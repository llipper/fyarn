import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:fyarn/commands/add_command.dart';
import 'package:fyarn/commands/init_command.dart';
import 'package:fyarn/src/services/logger.dart';

void main(List<String> arguments) async {
  final runner = CommandRunner<int>(
    'fyarn',
    'Fyarn UI CLI - Professional Design System Engine for Flutter',
  )
    ..addCommand(InitCommand())
    ..addCommand(AddCommand());

  try {
    final exitCode = await runner.run(arguments);
    exit(exitCode ?? 0);
  } catch (e, stackTrace) {
    if (e is UsageException) {
      Logger.error(e.message);
      Logger.info('\n${e.usage}');
      exit(64);
    }
    Logger.error('Erro inesperado: $e');
    Logger.debug(stackTrace.toString());
    exit(1);
  }
}