import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';
import 'package:fyarn/src/services/logger.dart';

class ProjectService {
  final String projectRoot;

  ProjectService(this.projectRoot);

  /// Valida se o diretório atual é um projeto Flutter válido.
  bool isValidFlutterProject() {
    final pubspecFile = File(p.join(projectRoot, 'pubspec.yaml'));
    if (!pubspecFile.existsSync()) {
      Logger.error('Nenhum pubspec.yaml encontrado. Você está na raiz de um projeto Flutter?');
      return false;
    }

    final content = pubspecFile.readAsStringSync();
    if (!content.contains('sdk: flutter')) {
      Logger.error('Este não parece ser um projeto Flutter. O Fyarn UI requer o Flutter SDK.');
      return false;
    }

    return true;
  }

  /// Extrai o nome do projeto do pubspec.yaml.
  String getProjectName() {
    final pubspecFile = File(p.join(projectRoot, 'pubspec.yaml'));
    final content = pubspecFile.readAsStringSync();
    final doc = loadYaml(content);
    return (doc['name'] as String?) ?? 'app';
  }
}
