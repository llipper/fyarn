import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/registry/component_registry.dart';
import 'package:fyarn/src/generator/component_resolver.dart';
import 'package:fyarn/src/models/component_ir.dart';

import 'package:fyarn/src/services/logger.dart';

import 'package:fyarn/src/services/template_loader.dart';

class GraphBuilderStage implements PipelineStage {
  final TemplateLoader loader;
  final _resolver = ComponentResolver();

  GraphBuilderStage(this.loader);

  @override
  String get name => 'Graph Builder (Structural Extraction)';

  @override
  Future<void> execute(PipelineContext context) async {
    final rootConfig = ComponentRegistry.getComponent(context.componentName);
    if (rootConfig == null) {
        throw Exception('Graph Build Error: Component "${context.componentName}" not found.');
    }
    context.config = rootConfig;

    // Resolve o grafo completo (recursivo)
    final allResolvedFiles = _resolver.resolveGraph(context.componentName, context.variant);
    
    // EXTRAI HASHES DE TODOS OS TEMPLATES NO GRAFO
    final Map<String, String> templateHashes = {};

    for (final file in allResolvedFiles) {
      final tplHash = await loader.getTemplateHash(file.templatePath!, file.templateName);
      templateHashes['${file.templatePath}/${file.templateName}'] = tplHash;
      
      // Tracking para dependências do IR
      // Nota: o resolveGraph já traz o templatePath correto
    }

    // Nota: Para o tracking de dependências no IR, precisamos saber quais componentes foram visitados.
    // Vamos fazer um scan rápido nos arquivos resolvidos.
    final dependencies = allResolvedFiles
        .map((f) => ComponentRegistry.getComponentByPath(f.templatePath!))
        .where((c) => c != null && c.name != context.componentName)
        .map((c) => c!.name)
        .toSet()
        .toList();

    // Constrói o IR imutável do grafo completo
    context.ir = ComponentIR.create(
      context.componentName, 
      allResolvedFiles, 
      context.config.templatePath,
      dependencies: dependencies,
      templateHashes: templateHashes,
    );

    Logger.step('Graph built: ${context.ir.resolvedFiles.length} nodes extracted from ${dependencies.length + 1} components.');
  }
}
