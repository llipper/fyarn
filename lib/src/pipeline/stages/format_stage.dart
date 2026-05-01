import 'dart:io';
import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/services/logger.dart';

class FormatStage implements PipelineStage {
  @override
  String get name => 'Code Formatting';

  @override
  Future<void> execute(PipelineContext context) async {
    if (context.fileManifest.isEmpty) return;

    Logger.step('Formatting generated files...');
    
    // Executa o dart format em todos os arquivos gerados
    final result = await Process.run('dart', ['format', ...context.fileManifest.keys]);
    
    if (result.exitCode != 0) {
      Logger.warning('Failed to format some files. You may need to run "dart format ." manually.');
    }
  }
}
