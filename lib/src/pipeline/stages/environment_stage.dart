import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/services/project_service.dart';
import 'package:fyarn/src/services/logger.dart';

class EnvironmentStage implements PipelineStage {
  @override
  String get name => 'Environment Validation';

  @override
  Future<void> execute(PipelineContext context) async {
    final service = ProjectService(context.projectRoot);
    
    if (!service.isValidFlutterProject()) {
      throw Exception('Not a valid Flutter project.');
    }
    
    context.projectName = service.getProjectName();
    Logger.step('Project identified: ${context.projectName}');
  }
}
