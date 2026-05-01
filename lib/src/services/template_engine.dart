import 'package:path/path.dart' as p;

class TemplateEngine {
  final String projectName;
  final String projectRoot;

  TemplateEngine({
    required this.projectName,
    required this.projectRoot,
  });

  /// Única fonte de verdade para renderização de templates.
  String render(
    String content, {
    required Map<String, String> variables,
    required String outputFilePath,
  }) {
    var result = content;

    result = _applyVariables(result, variables);
    result = _convertImports(result, outputFilePath);

    return result;
  }

  String _applyVariables(String content, Map<String, String> vars) {
    // Regex robusto: {{transformer key}} ou {{key}}
    final regex = RegExp(r"\{\{\s*(?:(\w+)\s+)?(\w+)\s*\}\}");

    return content.replaceAllMapped(regex, (m) {
      final transformer = m.group(1);
      final key = m.group(2)!;
      final value = vars[key] ?? '';

      if (transformer == null) return value;

      switch (transformer) {
        case 'pascalCase':
          return _toPascal(value);
        case 'camelCase':
          return _toCamel(value);
        case 'snakeCase':
          return _toSnake(value);
        case 'upperCase':
          return value.toUpperCase();
        default:
          return value;
      }
    });
  }

  String _convertImports(String content, String outputFilePath) {
    // Regex robusto: captura prefixo, path e sufixo (as, show, hide, etc.)
    final regex = RegExp(r'''(import|export)\s+['"](\.\.?/.*?)['"](.*?);''');

    return content.replaceAllMapped(regex, (m) {
      final type = m.group(1)!;
      final relative = m.group(2)!;
      final suffix = m.group(3)!;

      final resolved = p.normalize(
        p.join(p.dirname(outputFilePath), relative),
      );

      final lib = p.join(projectRoot, 'lib');

      if (p.isWithin(lib, resolved)) {
        final pkg = p.relative(resolved, from: lib).replaceAll(p.separator, '/');
        return "$type 'package:$projectName/$pkg'$suffix;";
      }

      return m.group(0)!;
    });
  }

  String _toPascal(String s) {
    if (s.isEmpty) return s;
    return s.split(RegExp(r'[-_ ]')).map((part) {
      if (part.isEmpty) return '';
      return part[0].toUpperCase() + part.substring(1).toLowerCase();
    }).join();
  }

  String _toCamel(String s) {
    final pascal = _toPascal(s);
    if (pascal.isEmpty) return pascal;
    return pascal[0].toLowerCase() + pascal.substring(1);
  }

  String _toSnake(String s) {
    return s
        .replaceAllMapped(RegExp(r'([A-Z])'), (m) => '_${m.group(1)!.toLowerCase()}')
        .replaceAll(RegExp(r'[- ]'), '_')
        .replaceFirst(RegExp(r'^_'), '')
        .toLowerCase();
  }
}


