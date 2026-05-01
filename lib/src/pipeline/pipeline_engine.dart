import 'package:fyarn/src/models/component_config.dart';
import 'package:fyarn/src/models/component_ir.dart';
import 'package:fyarn/src/models/build_state.dart';
import 'package:fyarn/src/models/build_plan.dart';

class PipelineContext {
  final String componentName;
  final String? variant;
  final bool overwrite;
  final String projectRoot;
  
  // Dados populados durante a execução
  late String projectName;
  late ComponentConfig config;
  late ComponentIR ir;
  late BuildPlan plan;
  late List<ComponentFile> resolvedFiles;

  
  // v4 Build System State
  Map<String, dynamic>? lastBuildState;
  final List<String> rebuiltNodes = [];
  int cacheHits = 0;
  late BuildProof proof;
  
  // Caminho -> Conteúdo Final
  final Map<String, String> fileManifest = {};


  
  PipelineContext({
    required this.componentName,
    this.variant,
    this.overwrite = false,
    required this.projectRoot,
  });
}

abstract class PipelineStage {
  String get name;
  Future<void> execute(PipelineContext context);
}

class PipelineEngine {
  final List<PipelineStage> _stages = [];

  void addStage(PipelineStage stage) => _stages.add(stage);

  Future<void> run(PipelineContext context) async {
    for (final stage in _stages) {
      await stage.execute(context);
    }
  }
}
