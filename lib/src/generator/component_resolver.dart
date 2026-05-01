import '../models/component_config.dart';
import '../registry/component_registry.dart';

class ComponentResolver {
  /// Resolve o grafo completo de arquivos (incluindo dependências recursivas)
  List<ComponentFile> resolveGraph(String rootComponentName, String? variantName) {
    final Map<String, ComponentFile> allFiles = {};
    final Set<String> visitedComponents = {};

    void traverse(String componentName) {
      if (visitedComponents.contains(componentName)) return;
      visitedComponents.add(componentName);

      final config = ComponentRegistry.getComponent(componentName);
      if (config == null) return;

      // Resolve dependências primeiro
      for (final dep in config.dependencies) {
        traverse(dep);
      }

      // Resolve arquivos do componente (considerando variantes)
      final componentFiles = resolve(config, variantName);
      for (final file in componentFiles) {
        // Vincula ao path do componente de origem para hashing correto posterior
        allFiles[file.fileName] = ComponentFile(
          templateName: file.templateName,
          fileName: file.fileName,
          templatePath: file.templatePath ?? config.templatePath,
        );
      }
    }

    traverse(rootComponentName);
    return allFiles.values.toList();
  }

  /// Resolve a lista final de arquivos de UM componente.

  List<ComponentFile> resolve(ComponentConfig config, String? variantName) {
    final result = <String, ComponentFile>{};
    final visited = <String>{};

    // 1. Carrega os arquivos base (Fundo da pilha de prioridade)
    for (final file in config.files) {
      result[file.fileName] = file;
    }

    if (variantName == null) {
      return result.values.toList();
    }

    // 2. Aplica as camadas de variantes recursivamente
    _applyVariant(config, variantName, result, visited);

    return result.values.toList();
  }

  void _applyVariant(
    ComponentConfig config,
    String variantName,
    Map<String, ComponentFile> result,
    Set<String> visited,
  ) {
    // 🔥 Proteção contra loop infinito (dependência circular)
    if (visited.contains(variantName)) {
      throw Exception('Circular variant dependency detected: $variantName');
    }

    visited.add(variantName);

    final variant = config.variants[variantName];
    if (variant == null) return;

    // Se a variante estende outra, processamos o pai primeiro para manter a ordem de prioridade correta
    if (variant.extendsVariant != null) {
      _applyVariant(config, variant.extendsVariant!, result, visited);
    }

    // Aplica os arquivos desta variante (sobrescrevendo os do pai ou base)
    for (final file in variant.files) {
      result[file.fileName] = file;
    }
  }
}
