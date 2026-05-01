import 'dart:io';
import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/services/logger.dart';
import 'package:path/path.dart' as p;

class PersistenceStage implements PipelineStage {
  @override
  String get name => 'File Persistence';

  @override
  Future<void> execute(PipelineContext context) async {
    for (final entry in context.fileManifest.entries) {
      final path = entry.key;
      final content = entry.value;
      final file = File(path);

      final directory = Directory(p.dirname(path));
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      
      await file.writeAsString(content);
      
      final displayPath = p.relative(path, from: context.projectRoot);
      Logger.success('Created $displayPath');
    }
  }
}

