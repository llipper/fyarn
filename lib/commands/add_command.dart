import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:args/command_runner.dart';
import 'package:fyarn/src/models/build_state.dart';
import 'package:fyarn/src/services/logger.dart';
import 'package:fyarn/src/services/template_loader.dart';
import 'package:fyarn/src/utils/template_resolver.dart';
import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/pipeline/stages/environment_stage.dart';
import 'package:fyarn/src/pipeline/stages/resolution_stage.dart';
import 'package:fyarn/src/pipeline/stages/rendering_stage.dart';
import 'package:fyarn/src/pipeline/stages/persistence_stage.dart';
import 'package:fyarn/src/pipeline/stages/format_stage.dart';
import 'package:fyarn/src/pipeline/stages/consistency_check_stage.dart';
import 'package:fyarn/src/pipeline/stages/test_stage.dart';

import 'package:fyarn/src/pipeline/stages/graph_builder_stage.dart';
import 'package:fyarn/src/pipeline/stages/graph_validation_stage.dart';
import 'package:fyarn/src/pipeline/stages/delta_computation_stage.dart';
import 'package:fyarn/src/pipeline/stages/incremental_build_engine_stage.dart';
import 'package:fyarn/src/pipeline/stages/verification_stage.dart';
import 'package:fyarn/src/services/build_state_service.dart';



/// [AddCommand] is responsible for downloading and generating UI components 
/// into the target Flutter project. It handles dependency resolution,
/// incremental builds, and template rendering.
class AddCommand extends Command<int> with TemplateResolver {
  @override
  final name = 'add';
  @override
  final description = 'Adds one or more components to your project';

  /// Creates a new instance of [AddCommand] and configures its arguments.
  AddCommand() {
    argParser.addFlag(
      'overwrite',
      abbr: 'o',
      help: 'Overwrite existing files',
      negatable: false,
    );
    argParser.addOption(
      'variant',
      abbr: 'v',
      help: 'Specify the component variant',
    );
    argParser.addFlag(
      'all',
      abbr: 'a',
      help: 'Add all available components',
      negatable: false,
    );
  }

  @override
  Future<int> run() async {
    final all = argResults?['all'] as bool? ?? false;
    var componentsToAdd = argResults?.rest ?? [];

    if (componentsToAdd.isEmpty && !all) {
      throw UsageException('Especifique ao menos um componente ou use --all.', usage);
    }

    final variant = argResults?['variant'] as String?;
    final overwrite = argResults?['overwrite'] as bool? ?? false;
    final projectRoot = Directory.current.path;

    try {
      // 1. Setup Infra
      final templatesPath = await resolveTemplatesPath();
      final loader = TemplateLoader(templatesPath);
      final stateService = BuildStateService(projectRoot);

      // 2. Setup Pipeline (Fyarn v4 Formal Build System)
      final engine = PipelineEngine();
      engine.addStage(EnvironmentStage());
      engine.addStage(GraphBuilderStage(loader));

      engine.addStage(GraphValidationStage());
      engine.addStage(DeltaComputationStage(stateService));
      engine.addStage(IncrementalBuildEngineStage());
      engine.addStage(ConsistencyCheckStage(loader));
      engine.addStage(TestStage());

      engine.addStage(VerificationStage());
      engine.addStage(ResolutionStage());
      engine.addStage(RenderingStage(loader));
      engine.addStage(PersistenceStage());
      engine.addStage(FormatStage());

      // 3. Resolver componentes a serem adicionados
      if (all) {
        final uiPath = p.join(templatesPath, 'ui');
        final uiDir = Directory(uiPath);
        if (await uiDir.exists()) {
          final List<String> validComponents = [];
          final entities = await uiDir.list().where((e) => e is Directory).toList();
          
          for (final entity in entities) {
            final name = p.basename(entity.path);
            if (name == 'auth') continue;

            final mainTemplatePath = p.join(entity.path, 'fyarn_$name.dart.tpl');
            if (await File(mainTemplatePath).exists()) {
              validComponents.add(name);
            }
          }
          
          componentsToAdd = validComponents;
          Logger.info('🧶 Adicionando ${componentsToAdd.length} componentes válidos (v1.1.0)...\n');
        }
      }

      // 4. Execute para cada componente
      for (final component in componentsToAdd) {
        final context = PipelineContext(
          componentName: component.toLowerCase(),
          variant: variant,
          overwrite: overwrite,
          projectRoot: projectRoot,
        );

        await engine.run(context);

        // 4. Salva a prova de build (Persistence of Truth)
        // Construímos o índice reverso: para cada dependência do IR, este componente é um dependente
        final Map<String, List<String>> reverseDeps = {};
        for (final dep in context.ir.dependencies) {
          reverseDeps[dep] = [context.componentName];
        }

        final buildProofIR = BuildProofIR(
          componentName: context.componentName,
          buildProofHash: context.ir.irHash,
          contentHashes: context.ir.resolvedFiles.map(
            (k, v) => MapEntry(k, v.contentHash),
          ),
          dependencyIndex: reverseDeps, 
          proof: context.proof,
        );
        
        await stateService.saveBuild(buildProofIR);

      }


      Logger.success('\nProcess completed successfully! 🧶');
      return 0;
    } catch (e, s) {
      Logger.error(e.toString());
      Logger.debug(s.toString());
      return 1;
    }
  }
}

