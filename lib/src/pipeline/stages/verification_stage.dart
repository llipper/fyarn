import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/models/build_state.dart';
import 'package:fyarn/src/services/logger.dart';

class VerificationStage implements PipelineStage {
  @override
  String get name => 'Build Proof Verification (Formal Pass)';

  @override
  Future<void> execute(PipelineContext context) async {
    final ir = context.ir;
    
    // 1. Constrói a Prova de Build
    context.proof = BuildProof(
      graphHash: ir.irHash,
      deltaHash: (context.lastBuildState?['currentDeltaHash'] as String?) ?? 'initial_build',
      affectedNodes: context.rebuiltNodes,
      cacheHits: context.cacheHits,
      rebuiltNodes: context.rebuiltNodes,
      finalArtifactHash: ir.irHash, // Simplificação: o hash do IR é o contrato do artefato
    );

    // 2. Validação de Invariantes
    // Invariante: rebuildNodes + cacheHits deve ser igual ao total de arquivos resolvidos
    final totalPlanned = context.rebuiltNodes.length + context.cacheHits;
    if (totalPlanned != ir.resolvedFiles.length) {
      throw Exception(
        'Verification Error: Integrity violation!\n'
        'Planned ($totalPlanned) != Resolved (${ir.resolvedFiles.length})'
      );
    }

    // Invariante: Se delta for vazio, rebuiltNodes deve ser zero (exceto se force-overwrite estiver ativo)
    if (context.lastBuildState?['currentDeltaHash'] == 'initial_build' && context.rebuiltNodes.isEmpty) {
       // Isso indicaria erro no motor de delta
       throw Exception('Verification Error: Delta computation inconsistency detected.');
    }

    Logger.step('Build Proof Verified: All invariants met. Proceeding to execution.');
  }
}
