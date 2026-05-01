import 'dart:io';
import 'package:fyarn/src/models/build_plan.dart';
import 'package:fyarn/src/utils/path_resolver.dart';
import 'package:path/path.dart' as p;
import 'package:fyarn/src/pipeline/pipeline_engine.dart';
import 'package:fyarn/src/services/logger.dart';

class IncrementalBuildEngineStage implements PipelineStage {
  @override
  String get name => 'Incremental Build Engine (Cache vs Rebuild)';

  @override
  Future<void> execute(PipelineContext context) async {
    final pathResolver = PathResolver(context.projectRoot);
    final outputBaseDir = pathResolver.resolveOutputDirectory(context.componentName);
    final ir = context.ir;

    final lastState = context.lastBuildState;
    
    // Se não há build anterior OU se overwrite está ativo, todos os nós são reconstruídos
    if (lastState == null || context.overwrite) {
      final allNodes = ir.resolvedFiles.keys.toList();
      context.rebuiltNodes.addAll(allNodes);
      context.cacheHits = 0;
      
      context.plan = BuildPlan(
        nodesToRebuild: allNodes,
        nodesFromCache: [],
        invalidationReasons: {for (var n in allNodes) n: lastState == null ? 'Initial build' : 'Overwrite forced'},
        planHash: ir.irHash,
      );

      final reason = lastState == null ? 'Initial run' : 'Overwrite forced';
      Logger.step('Incremental Build: $reason, all nodes scheduled for rebuild.');
      return;
    }



    final List<String> nodesToRebuild = [];
    final List<String> nodesFromCache = [];
    final Map<String, String> invalidationReasons = {};
    final lastHashes = (lastState['contentHashes'] as Map?)?.cast<String, dynamic>() ?? {};

    for (final binding in ir.resolvedFiles.values) {

      final lastHash = lastHashes[binding.fileName];
      
      // Validação de Integridade Física
      final fullPath = p.join(outputBaseDir, binding.fileName);
      final existsOnDisk = await File(fullPath).exists();


      if (lastHash == binding.contentHash && existsOnDisk) {
        nodesFromCache.add(binding.fileName);
        context.cacheHits++;
      } else {
        nodesToRebuild.add(binding.fileName);
        context.rebuiltNodes.add(binding.fileName);
        
        // Motivo da invalidação
        if (!existsOnDisk) {
          invalidationReasons[binding.fileName] = 'Physical file missing on disk';
        } else if (lastHash == null) {
          invalidationReasons[binding.fileName] = 'New node in graph';
        } else {
          invalidationReasons[binding.fileName] = 'Content hash mismatch (template or spec changed)';
        }
      }
    }

    // 3. Produz o Plano de Build Formal
    context.plan = BuildPlan(
      nodesToRebuild: nodesToRebuild,
      nodesFromCache: nodesFromCache,
      invalidationReasons: invalidationReasons,
      planHash: ir.irHash, // O hash do plano é o hash do grafo atual
    );

    if (context.plan.isNoOp) {
      Logger.success('Incremental Build Plan: 100% Cache Hit. Ready for no-op execution.');
    } else {
      Logger.step('Incremental Build Plan: ${nodesToRebuild.length} to rebuild, ${nodesFromCache.length} from cache.');
    }
  }
}

