import 'package:path/path.dart' as p;

enum ComponentCategory { ui, core, theme, themePreset, tokens }

class PathResolver {
  final String projectRoot;

  PathResolver(this.projectRoot);

  String resolveOutputDirectory(String componentName) {
    // A inteligência de subpastas (ui/, core/, etc.) já reside nos 
    // caminhos de arquivo (fileName) definidos no ComponentRegistry.
    // O PathResolver deve apenas garantir a raiz do Design System.
    return p.join(projectRoot, 'lib', 'components');
  }

}
