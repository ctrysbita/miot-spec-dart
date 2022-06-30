import 'package:json_annotation/json_annotation.dart';

part 'translation.g.dart';

@JsonSerializable(createToJson: false)
class InstanceTranslations {
  final Map<String, InstanceTranslation> data;

  @JsonKey(fromJson: _tsFromJson)
  final DateTime timestamp;

  static DateTime _tsFromJson(String date) =>
      DateTime.fromMillisecondsSinceEpoch(int.parse(date) * 1000);

  const InstanceTranslations({
    required this.data,
    required this.timestamp,
  });

  factory InstanceTranslations.fromJson(Map<String, dynamic> json) =>
      _$InstanceTranslationsFromJson(json);

  InstanceTranslation? operator [](String key) => data[key];
}

class InstanceTranslation {
  final Map<String, String> _data;

  InstanceTranslation.fromJson(Map<String, dynamic> json) : _data = json.cast();

  String? translateService(int siid) =>
      _data['service:${siid.toString().padLeft(3, '0')}'];

  String? translateProperty(int siid, int piid) =>
      _data['service:${siid.toString().padLeft(3, '0')}'
          ':property:${piid.toString().padLeft(3, '0')}'];

  @override
  String toString() => _data.toString();
}
