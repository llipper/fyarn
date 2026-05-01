import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/models/component_config.dart';
import 'package:fyarn/src/services/logger.dart';

class ResolutionStage implements PipelineStage {
  @override
  String get name => 'Component Resolution';

  @override
  Future<void> execute(PipelineContext context) async {
    // Agora o ResolutionStage apenas consome o IR já validado pelos estágios anteriores
    context.resolvedFiles = context.ir.resolvedFiles.values
        .map((b) => ComponentFile(
              templateName: b.templateName,
              fileName: b.fileName,
              templatePath: b.templatePath, 
            ))
        .toList();


    Logger.step('Resolution Stage: Finalized ${context.resolvedFiles.length} files from verified IR.');
  }
}

