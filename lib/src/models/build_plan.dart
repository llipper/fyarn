/// [BuildPlan] represents the execution strategy for the incremental build engine.
/// It determines which components need to be rendered from scratch and 
/// which ones can be safely reused from the previous build state.
class BuildPlan {
  /// List of component names that need to be rebuilt.
  final List<String> nodesToRebuild;
  /// List of component names that will be recovered from cache.
  final List<String> nodesFromCache;
  /// Detailed reasons why specific components were invalidated.
  final Map<String, String> invalidationReasons;
  /// Unique identifier of this build strategy.
  final String planHash;

  /// Creates a new [BuildPlan] with the specified rebuild and cache nodes.
  BuildPlan({
    required this.nodesToRebuild,
    required this.nodesFromCache,
    required this.invalidationReasons,
    required this.planHash,
  });

  bool get isFullRebuild => nodesFromCache.isEmpty && nodesToRebuild.isNotEmpty;
  bool get isIncremental => nodesFromCache.isNotEmpty;
  bool get isNoOp => nodesToRebuild.isEmpty;
}
