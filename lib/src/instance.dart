import 'package:json_annotation/json_annotation.dart';

import 'type.dart';

part 'instance.g.dart';

enum ReleaseStatus {
  debug,
  preview,
  released,
}

@JsonSerializable()
class InstanceEntry {
  final ReleaseStatus? status;
  final String model;
  final MIoTSpecType type;
  final int version;

  InstanceEntry({
    required this.status,
    required this.model,
    required this.type,
    required this.version,
  });

  factory InstanceEntry.fromJson(Map<String, dynamic> json) =>
      _$InstanceEntryFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceEntryToJson(this);
}

@JsonSerializable()
class InstanceSpec {
  final MIoTSpecType type;
  final String description;
  final List<InstanceServiceSpec> services;

  InstanceSpec({
    required this.type,
    required this.description,
    required this.services,
  });

  factory InstanceSpec.fromJson(Map<String, dynamic> json) =>
      _$InstanceSpecFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceSpecToJson(this);
}

@JsonSerializable()
class InstanceServiceSpec {
  final int iid;
  final MIoTSpecType type;
  final String description;
  final List<InstancePropertySpec> properties;
  final List<InstanceActionSpec> actions;

  InstanceServiceSpec({
    required this.iid,
    required this.type,
    required this.description,
    this.properties = const [],
    this.actions = const [],
  });

  factory InstanceServiceSpec.fromJson(Map<String, dynamic> json) =>
      _$InstanceServiceSpecFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceServiceSpecToJson(this);
}

@JsonSerializable()
class InstancePropertySpec {
  final int iid;
  final MIoTSpecType type;
  final String description;
  final String format;

  @JsonKey(defaultValue: {})
  final Set<String> access;

  /// The enum values if available.
  @JsonKey(name: 'value-list', includeIfNull: false)
  final List<InstancePropertyValueEnum>? values;

  /// The range of value if available.
  @JsonKey(name: 'value-range', includeIfNull: false)
  final InstancePropertyValueRange? range;

  InstancePropertySpec({
    required this.iid,
    required this.type,
    required this.description,
    required this.format,
    required this.access,
    this.values,
    this.range,
  });

  factory InstancePropertySpec.fromJson(Map<String, dynamic> json) =>
      _$InstancePropertySpecFromJson(json);

  Map<String, dynamic> toJson() => _$InstancePropertySpecToJson(this);

  bool get canRead => access.contains('read');
  bool get canWrite => access.contains('write');
}

@JsonSerializable()
class InstancePropertyValueEnum {
  final int value;
  final String description;

  InstancePropertyValueEnum({
    required this.value,
    required this.description,
  });

  factory InstancePropertyValueEnum.fromJson(Map<String, dynamic> json) =>
      _$InstancePropertyValueEnumFromJson(json);

  Map<String, dynamic> toJson() => _$InstancePropertyValueEnumToJson(this);
}

class InstancePropertyValueRange {
  final num begin;
  final num end;
  final num step;

  InstancePropertyValueRange({
    required this.begin,
    required this.end,
    required this.step,
  });

  factory InstancePropertyValueRange.fromJson(List<dynamic> range) =>
      InstancePropertyValueRange(
        begin: range.first as num,
        end: range[1] as num,
        step: range[2] as num,
      );

  List<dynamic> toJson() => <dynamic>[begin, end, step];
}

@JsonSerializable()
class InstanceActionSpec {
  final int iid;
  final MIoTSpecType type;
  final String description;

  InstanceActionSpec({
    required this.iid,
    required this.type,
    required this.description,
  });

  factory InstanceActionSpec.fromJson(Map<String, dynamic> json) =>
      _$InstanceActionSpecFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceActionSpecToJson(this);
}
