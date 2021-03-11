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
      allowed: ['verbose', 'debug', 'info'],
      defaultsTo: 'info',
      callback: (level) {
        Logger.level = const <String, Level>{
              'verbose': Level.verbose,
              'debug': Level.debug,
              'info': Level.info,
            }[level] ??
            Level.info;
      },
    );

    addCommand(InstancesCommand());
    addCommand(InstanceCommand());
  }
}
