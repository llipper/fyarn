import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:crypto/crypto.dart';

class TemplateLoader {
  final String baseTemplatePath;

  TemplateLoader(this.baseTemplatePath);

  Future<String> getTemplateHash(String componentPath, String templateName) async {
    final path = p.join(baseTemplatePath, componentPath, templateName);
    final file = File(path);
    if (!await file.exists()) return 'missing';
    
    final content = await file.readAsBytes();
    return sha256.convert(content).toString();
  }


  Future<String> loadTemplate(String componentPath, String templateName) async {
    final path = p.join(baseTemplatePath, componentPath, templateName);
    final file = File(path);

    if (!await file.exists()) {
      throw Exception('Template not found at $path');
    }

    return await file.readAsString();
  }

  Future<bool> exists(String componentPath, String templateName) async {
    final path = p.join(baseTemplatePath, componentPath, templateName);
    return await File(path).exists();
  }
}

