import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/services/template_loader.dart';
import 'package:fyarn/src/services/template_engine.dart';
import 'package:fyarn/src/utils/path_resolver.dart';
import 'package:path/path.dart' as p;

class RenderingStage implements PipelineStage {
  final TemplateLoader loader;

  RenderingStage(this.loader);

  @override
  String get name => 'Template Rendering';

  @override
  Future<void> execute(PipelineContext context) async {
    final pathResolver = PathResolver(context.projectRoot);
    final engine = TemplateEngine(
      projectName: context.projectName,
      projectRoot: context.projectRoot,
    );

    final outputBaseDir = pathResolver.resolveOutputDirectory(context.componentName);

    // Filter only files that need rebuild
    final filesToRender = context.resolvedFiles
        .where((f) => context.rebuiltNodes.contains(f.fileName));

    for (final fileConfig in filesToRender) {
      final outputPath = p.join(outputBaseDir, fileConfig.fileName);

      
      final rawContent = await loader.loadTemplate(
        fileConfig.templatePath ?? context.config.templatePath, 
        fileConfig.templateName,
      );


      final renderedContent = engine.render(
        rawContent,
        outputFilePath: outputPath,
        variables: {
          'component_name': context.componentName,
          'project_name': context.projectName,
        },
      );

      context.fileManifest[outputPath] = renderedContent;
    }
  }
}
