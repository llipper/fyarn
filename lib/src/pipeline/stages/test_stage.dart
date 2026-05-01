import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/services/logger.dart';
import 'package:fyarn/src/generator/component_resolver.dart';
import 'package:fyarn/src/models/component_ir.dart';

class TestStage implements PipelineStage {
  final _resolver = ComponentResolver();

  @override
  String get name => 'Build Verification Tests';

  @override
  Future<void> execute(PipelineContext context) async {
    final ir = context.ir;
    int passed = 0;

    // Teste 1: Determinismo (Re-run IR construction with same inputs)
    final reResolvedFiles = _resolver.resolveGraph(context.componentName, context.variant);
    
    // Reconstituímos o mapa de hashes a partir da primeira IR

    final Map<String, String> originalHashes = {};
    for (final binding in ir.resolvedFiles.values) {
      originalHashes['${binding.templatePath}/${binding.templateName}'] = binding.templateHash;
    }


    final secondIR = ComponentIR.create(
      context.componentName, 
      reResolvedFiles, 
      context.config.templatePath,
      dependencies: ir.dependencies,
      templateHashes: originalHashes,
    );


    if (secondIR.irHash != ir.irHash) {
      throw Exception('Determinism Test FAILED: IR Hash changed between runs!');
    }
    passed++;

    // Teste 2: Integridade de Conteúdo (Garante que Map não está vazio)
    if (ir.resolvedFiles.isEmpty) {
      throw Exception('Integrity Test FAILED: Resolved files map is empty!');
    }
    passed++;

    // Teste 3: Verificação de Path Collision (Caminhos de saída)
    final seenPaths = <String>{};
    for (final binding in ir.resolvedFiles.values) {
      if (seenPaths.contains(binding.fileName)) {
        throw Exception('Path Collision Test FAILED: Multiple files writing to ${binding.fileName}');
      }
      seenPaths.add(binding.fileName);
    }
    passed++;

    Logger.step('Build Report: $passed tests PASSED. Build Hash ${ir.irHash.substring(0, 8)} is stable.');
  }
}
