import 'package:meta/meta.dart';

@immutable
class ComponentFile {
  final String templateName;
  final String fileName;
  final String? templatePath;

  const ComponentFile({
    required this.templateName,
    required this.fileName,
    this.templatePath,
  })  : assert(templateName != '', 'templateName cannot be empty'),
        assert(fileName != '', 'fileName cannot be empty');
}

@immutable
class ComponentVariant {
  final String name;
  final List<ComponentFile> files;
  final String? extendsVariant;

  const ComponentVariant({
    required this.name,
    this.files = const [],
    this.extendsVariant,
  }) : assert(name != '', 'variant name cannot be empty');
}

@immutable
class ComponentConfig {
  final String name;
  final String templatePath;
  final List<ComponentFile> files;
  final Map<String, ComponentVariant> variants;
  final List<String> dependencies;

  const ComponentConfig({
    required this.name,
    required this.templatePath,
    required this.files,
    this.variants = const {},
    this.dependencies = const [],
  })  : assert(name != '', 'component name cannot be empty'),
        assert(templatePath != '', 'templatePath cannot be empty'),
        assert(files.length > 0, 'component must have at least one file');

}