import 'dart:convert';
import 'package:crypto/crypto.dart';

/// Unidade final de verdade do build system.
/// Contém o grafo resolvido e as provas de integridade.
class BuildProofIR {
  final String componentName;
  final String buildProofHash;
  final Map<String, String> contentHashes;
  final Map<String, List<String>> dependencyIndex;
  final BuildProof proof;

  BuildProofIR({
    required this.componentName,
    required this.buildProofHash,
    required this.contentHashes,
    required this.dependencyIndex,
    required this.proof,
  });

  Map<String, dynamic> toJson() => {
    'componentName': componentName,
    'buildProofHash': buildProofHash,
    'contentHashes': contentHashes,
    'dependencyIndex': dependencyIndex,
    'proof': proof.toJson(),
  };
}

/// Prova verificável de uma execução de build.
class BuildProof {
  final String graphHash;
  final String deltaHash;
  final List<String> affectedNodes;
  final int cacheHits;
  final List<String> rebuiltNodes;
  final String finalArtifactHash;

  BuildProof({
    required this.graphHash,
    required this.deltaHash,
    required this.affectedNodes,
    required this.cacheHits,
    required this.rebuiltNodes,
    required this.finalArtifactHash,
  });

  Map<String, dynamic> toJson() => {
    'graphHash': graphHash,
    'deltaHash': deltaHash,
    'affectedNodes': affectedNodes,
    'cacheHits': cacheHits,
    'rebuiltNodes': rebuiltNodes,
    'finalArtifactHash': finalArtifactHash,
  };
}

/// Motor de geração de chaves para Content Addressable Cache.
class CacheKeyGenerator {
  static String generate({
    required String templateContent,
    required String context,
    required List<String> dependencies,
    String variant = 'default',
  }) {
    final input = 'tpl:$templateContent;ctx:$context;deps:${dependencies.join(',')};var:$variant';
    return sha256.convert(utf8.encode(input)).toString();
  }
}
