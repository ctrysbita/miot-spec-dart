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
  final ReleaseStatus status;
  final String model;
  final String type;
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
  final SpecType type;
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
  final SpecType type;
  final String description;

  @JsonKey(defaultValue: <InstancePropertySpec>[])
  final List<InstancePropertySpec> properties;

  InstanceServiceSpec({
    required this.iid,
    required this.type,
    required this.description,
    this.properties = const [],
  });

  factory InstanceServiceSpec.fromJson(Map<String, dynamic> json) =>
      _$InstanceServiceSpecFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceServiceSpecToJson(this);
}

@JsonSerializable()
class InstancePropertySpec {
  final int iid;
  final SpecType type;
  final String description;
  final String format;

  @JsonKey(defaultValue: <String>{})
  final Set<String> access;

  InstancePropertySpec({
    required this.iid,
    required this.type,
    required this.description,
    required this.format,
    required this.access,
  });

  factory InstancePropertySpec.fromJson(Map<String, dynamic> json) =>
      _$InstancePropertySpecFromJson(json);

  Map<String, dynamic> toJson() => _$InstancePropertySpecToJson(this);

  bool get canRead => access.contains('read');
  bool get canWrite => access.contains('write');
}
