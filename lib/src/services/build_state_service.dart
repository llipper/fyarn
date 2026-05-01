import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:fyarn/src/models/build_state.dart';

class BuildStateService {
  final String projectRoot;
  late String _statePath;

  BuildStateService(this.projectRoot) {
    _statePath = p.join(projectRoot, '.fyarn', 'build_info.json');
  }

  Future<Map<String, dynamic>?> loadLastBuild(String componentName) async {
    final file = File(_statePath);
    if (!await file.exists()) return null;
    
    try {
      final content = await file.readAsString();
      final allStates = (jsonDecode(content) as Map).cast<String, dynamic>();
      return (allStates[componentName] as Map?)?.cast<String, dynamic>();
    } catch (_) {
      return null;
    }
  }

  Future<void> saveBuild(BuildProofIR ir) async {
    final file = File(_statePath);
    Map<String, dynamic> allStates = {};

    if (await file.exists()) {
      try {
        final content = await file.readAsString();
        allStates = (jsonDecode(content) as Map).cast<String, dynamic>();
      } catch (_) {}
    }

    // Merge: Atualiza apenas este componente
    allStates[ir.componentName] = ir.toJson();
    
    if (!await file.parent.exists()) {
      await file.parent.create(recursive: true);
    }
    
    const encoder = JsonEncoder.withIndent('  ');
    await file.writeAsString(encoder.convert(allStates));
  }

}
