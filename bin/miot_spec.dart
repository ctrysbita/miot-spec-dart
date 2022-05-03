import 'package:miot_spec/src/utils.dart';

import 'src/command_runner.dart';

void main(List<String> args) async {
  try {
    await MiotSpecCommandRunner().run(args);
  } on Exception catch (e) {
    logger.e('Command failed with exception:\n$e');
  }
}
