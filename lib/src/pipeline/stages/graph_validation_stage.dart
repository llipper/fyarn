import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/services/logger.dart';

class GraphValidationStage implements PipelineStage {
  @override
  String get name => 'Graph Validation (Integrity Pass)';

  @override
  Future<void> execute(PipelineContext context) async {
    final ir = context.ir;

    // 1. Validação de Folhas Vazias
    if (ir.resolvedFiles.isEmpty) {
      throw Exception('Graph Validation Error: Component has no files to generate.');
    }

    // 2. Validação de Caminhos de Saída Proibidos
    for (final binding in ir.resolvedFiles.values) {
      if (binding.fileName.contains('..') || binding.fileName.startsWith('/')) {
        throw Exception('Graph Validation Error: Illegal output path detected: ${binding.fileName}');
      }
    }

    Logger.step('Graph Validation PASSED: Structural integrity is solid.');
  }
}
