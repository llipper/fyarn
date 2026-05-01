import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/services/build_state_service.dart';
import 'package:fyarn/src/services/logger.dart';

class DeltaComputationStage implements PipelineStage {
  final BuildStateService stateService;

  DeltaComputationStage(this.stateService);

  @override
  String get name => 'Delta Computation (Graph Analysis)';

  @override
  Future<void> execute(PipelineContext context) async {
    // 1. Carrega o estado anterior específico deste componente
    context.lastBuildState = await stateService.loadLastBuild(context.componentName);

    
    if (context.lastBuildState == null) {
      Logger.step('No previous build found. Performing full build.');
      return;
    }

    // 2. Calcula o Delta Hash
    // Comparamos o hash do ComponentIR atual com o do último build
    final lastHash = context.lastBuildState!['buildProofHash'] as String;
    final currentHash = context.ir.irHash;

    if (lastHash == currentHash) {
      Logger.success('Graph Delta is EMPTY. All nodes are consistent with cache.');
    } else {
      Logger.step('Graph Delta detected: nodes have changed or were added.');
    }

    // Geramos um hash único para este delta
    final deltaInput = 'last:$lastHash;current:$currentHash';
    final deltaHash = sha256.convert(utf8.encode(deltaInput)).toString();
    
    // Armazenamos o deltaHash para a prova final
    context.lastBuildState!['currentDeltaHash'] = deltaHash;
  }
}
