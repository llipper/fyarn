import 'dart:io';
import 'dart:isolate';
import 'package:path/path.dart' as p;

mixin TemplateResolver {
  Future<String> resolveTemplatesPath() async {
    // 1. Tentar via package (funciona quando instalado globalmente ou via path)
    // O nome do pacote é 'fyarn' conforme definido no pubspec.yaml
    final packageUri = Uri.parse('package:fyarn/templates/');
    final resolvedUri = await Isolate.resolvePackageUri(packageUri);
    
    if (resolvedUri != null) {
      final path = resolvedUri.toFilePath();
      if (Directory(path).existsSync()) return path;
    }

    // 2. Fallback para desenvolvimento local (baseado no script que está rodando)
    final scriptPath = Platform.script.toFilePath();
    final localPath = p.join(p.dirname(p.dirname(scriptPath)), 'lib', 'templates');
    
    if (Directory(localPath).existsSync()) return localPath;

    throw Exception(
      'Não foi possível localizar o diretório de templates.\n'
      'Certifique-se de que o pacote fyarn está instalado corretamente.',
    );
  }
}
