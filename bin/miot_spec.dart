import 'src/command_runner.dart';
import 'src/utils.dart';

void main(List<String> args) async {
  try {
    await MiotSpecCommandRunner().run(args);
  } on Exception catch (e) {
    logger.e('Command failed with exception:\n$e');
  }
}
