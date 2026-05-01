import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:fyarn/src/models/component_config.dart';

/// Representação Intermediária (IR) imutável do componente.
/// Garantia de determinismo: Mesma configuração -> Mesmo Hash.
class ComponentIR {
  final String componentName;
  final Map<String, TemplateBinding> resolvedFiles;
  final List<String> dependencies; // Lista de dependências do grafo
  final String irHash;

  ComponentIR({
    required this.componentName,
    required this.resolvedFiles,
    required this.dependencies,
    required this.irHash,
  });

  factory ComponentIR.create(
    String name, 
    List<ComponentFile> files, 
    String templatePath, {
    List<String> dependencies = const [],
    Map<String, String> templateHashes = const {}, // Hash real do conteúdo do template
  }) {
    final Map<String, TemplateBinding> bindings = {};

    // 1. Ordenação determinística de dependências
    final sortedDeps = [...dependencies]..sort();

    final hashInput = StringBuffer();
    hashInput.write('component:$name;');
    hashInput.write('deps:${sortedDeps.join(',')};');
    hashInput.write('templatePath:$templatePath;');

    // 2. Ordenação alfabética dos arquivos para garantir hash determinístico
    final sortedFiles = [...files]..sort((a, b) => a.fileName.compareTo(b.fileName));

    for (final file in sortedFiles) {
      // O hash do arquivo é baseado no conteúdo real do template, nome e parâmetros
      final effectivePath = file.templatePath ?? templatePath;
      final tplHash = templateHashes['$effectivePath/${file.templateName}'] ?? 'no-content';
      final fileHashSource = 'tpl:${file.templateName};content:$tplHash;path:$effectivePath;name:${file.fileName}';
      final fileHash = sha256.convert(utf8.encode(fileHashSource)).toString();

      bindings[file.fileName] = TemplateBinding(
        templatePath: effectivePath,
        templateName: file.templateName,
        fileName: file.fileName,
        templateHash: tplHash, // Guardamos o hash original da fonte
        contentHash: fileHash,
      );
      hashInput.write('file:${file.fileName}:$fileHash;');
    }

    final hash = sha256.convert(utf8.encode(hashInput.toString())).toString();

    return ComponentIR(
      componentName: name,
      resolvedFiles: Map.unmodifiable(bindings),
      dependencies: List.unmodifiable(sortedDeps),
      irHash: hash,
    );

  }
}

class TemplateBinding {
  final String templatePath;
  final String templateName;
  final String fileName;
  final String templateHash;
  final String contentHash;

  TemplateBinding({
    required this.templatePath,
    required this.templateName,
    required this.fileName,
    required this.templateHash,
    required this.contentHash,
  });
}
