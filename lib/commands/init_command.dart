import 'dart:async';
import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:fyarn/src/services/logger.dart';
import 'package:fyarn/src/services/template_loader.dart';
import 'package:fyarn/src/utils/template_resolver.dart';
import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/pipeline/stages/environment_stage.dart';
import 'package:fyarn/src/pipeline/stages/graph_builder_stage.dart';
import 'package:fyarn/src/pipeline/stages/resolution_stage.dart';
import 'package:fyarn/src/pipeline/stages/rendering_stage.dart';
import 'package:fyarn/src/pipeline/stages/persistence_stage.dart';
import 'package:fyarn/src/pipeline/stages/format_stage.dart';

class InitCommand extends Command<int> with TemplateResolver {
  @override
  final name = 'init';
  @override
  final description = 'Initializes the Fyarn UI configuration and design tokens';

  @override
  Future<int> run() async {
    final projectRoot = Directory.current.path;

    try {
      Logger.bold('\nInitializing Fyarn UI...');

      // 1. Setup Infra
      final templatesPath = await resolveTemplatesPath();
      final loader = TemplateLoader(templatesPath);

      // 2. Setup Pipeline
      final engine = PipelineEngine();
      engine.addStage(EnvironmentStage());
      engine.addStage(GraphBuilderStage(loader));
      engine.addStage(ResolutionStage());
      engine.addStage(RenderingStage(loader));
      engine.addStage(PersistenceStage());
      engine.addStage(FormatStage());

      // 3. Execute para o componente 'tokens'
      final context = PipelineContext(
        componentName: 'tokens',
        projectRoot: projectRoot,
      );

      await engine.run(context);

      Logger.success('\nFyarn initialized! 🧶');
      return 0;
    } catch (e, s) {
      Logger.error(e.toString());
      Logger.debug(s.toString());
      return 1;
    }
  }
}

