import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable(createToJson: false)
class InstanceTranslations {
  @JsonKey(defaultValue: <String, InstanceTranslation>{})
  final Map<String, InstanceTranslation> data;

  InstanceTranslations(this.data);

  factory InstanceTranslations.fromJson(Map<String, dynamic> json) =>
      _$InstanceTranslationsFromJson(json);

  /// Get translation for using language code.
  InstanceTranslation? translationFor(String code) => data[code];
}

class InstanceTranslation {
  final Map<String, String> _data;

  InstanceTranslation.fromJson(Map<String, dynamic> json) : _data = json.cast();

  String? translateService(int siid) =>
      _data['service:${siid.toString().padLeft(3, '0')}'];

  String? translateProperty(int siid, int piid) =>
      _data['service:${siid.toString().padLeft(3, '0')}'
          ':property:${piid.toString().padLeft(3, '0')}'];
}
