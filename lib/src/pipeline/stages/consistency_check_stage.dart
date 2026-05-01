import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/services/logger.dart';
import 'package:fyarn/src/services/template_loader.dart';

class ConsistencyCheckStage implements PipelineStage {
  final TemplateLoader loader;

  ConsistencyCheckStage(this.loader);

  @override
  String get name => 'Consistency & Invariants Check';

  @override
  Future<void> execute(PipelineContext context) async {
    final ir = context.ir;
    final Set<String> outputs = {};

    for (final binding in ir.resolvedFiles.values) {
      // 1. Check para Colisão de Output (Impossível pelo Map do Resolver, mas validamos a lógica do IR)
      if (outputs.contains(binding.fileName)) {
        throw Exception('Consistency Error: Duplicate output path detected for ${binding.fileName}');
      }
      outputs.add(binding.fileName);

      // 2. Check de Existência Física de Templates
      // Este é o "Fail-Fast" real: evita erro de IO no meio do RenderingStage
      final templateExists = await loader.exists(binding.templatePath, binding.templateName);
      if (!templateExists) {
        throw Exception(
          'Consistency Error: Template source not found!\n'
          'Expected: ${binding.templatePath}/${binding.templateName}'
        );
      }
    }

    Logger.step('Consistency Check PASSED: All templates and output paths are valid.');
  }
}
