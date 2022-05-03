import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:miot_spec/miot_spec.dart';
import 'package:miot_spec/src/utils.dart';

class InstanceCommand extends Command<void> {
  @override
  final String name = 'instance';

  @override
  final String description = 'Get specific instance.';

  String? type;
  late final String? model;

  InstanceCommand() {
    argParser
      ..addOption(
        'type',
        abbr: 't',
        help: 'Type of instance.',
        callback: (s) => type = s,
      )
      ..addOption(
        'model',
        abbr: 'm',
        help: 'Model of instance.',
        callback: (s) => model = s,
      );
  }

  @override
  Future<void> run() async {
    if (type == null && model == null) {
      logger.e('Either type or model is required.');
      printUsage();
      return;
    }

    if (type == null) {
      final instancesFile = File('instances.json');
      if (instancesFile.existsSync()) {
        logger.i('Using local instances.json');
        type = (jsonDecode(instancesFile.readAsStringSync()) as List<dynamic>)
            .map<InstanceEntry?>((e) => InstanceEntry.fromJson(e))
            .firstWhere((e) => e?.model == model, orElse: () => null)
            ?.type
            .toString();
      } else {
        type = (await MIoTSpecV2.instance.getInstances())
            .cast<InstanceEntry?>()
            .firstWhere((e) => e?.model == model, orElse: () => null)
            ?.type
            .toString();
      }
    }

    if (type == null) {
      logger.e('Model $model not found.');
      return;
    }

    final instance = await MIoTSpecV2.instance.getInstance(type!);
    print(jsonEncoder.convert(instance));
  }
}
