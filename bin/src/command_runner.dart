import 'package:args/command_runner.dart';
import 'package:logger/logger.dart';

import 'command/instance.dart';
import 'command/instances.dart';

class MiotSpecCommandRunner extends CommandRunner<void> {
  MiotSpecCommandRunner() : super('miot-spec', 'Cli for handling MIoT spec.') {
    argParser.addOption(
      'level',
      abbr: 'l',
      help: 'Log level.',
      allowed: ['v', 'verbose', 'd', 'debug', 'i', 'info'],
      defaultsTo: 'info',
      callback: (level) {
        Logger.level = const <String, Level>{
              'v': Level.verbose,
              'verbose': Level.verbose,
              'd': Level.debug,
              'debug': Level.debug,
              'i': Level.info,
              'info': Level.info,
            }[level] ??
            Level.info;
      },
    );

    addCommand(InstancesCommand());
    addCommand(InstanceCommand());
  }
}
