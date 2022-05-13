import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:miot_spec/miot_spec.dart';
import 'package:miot_spec/src/utils.dart';

class InstancesCommand extends Command<void> {
  @override
  final String name = 'instances';

  @override
  final String description = 'Get all available instances.';

  @override
  Future<void> run() async {
    logger.i('Downloading all instances...');
    final entries = await MIoTSpecV2.instance.getInstances();
    logger.i('Saving ${entries.length} instances...');
    File('instances.json').writeAsStringSync(jsonEncoder.convert(entries));
    logger.i('Instances saved to instances.json.');
  }
}
