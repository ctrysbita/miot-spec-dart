// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstanceEntry _$InstanceEntryFromJson(Map<String, dynamic> json) =>
    InstanceEntry(
      status: $enumDecode(_$ReleaseStatusEnumMap, json['status']),
      model: json['model'] as String,
      type: MIoTSpecType.fromJson(json['type'] as String),
      version: json['version'] as int,
    );

Map<String, dynamic> _$InstanceEntryToJson(InstanceEntry instance) =>
    <String, dynamic>{
      'status': _$ReleaseStatusEnumMap[instance.status],
      'model': instance.model,
      'type': instance.type,
      'version': instance.version,
    };

const _$ReleaseStatusEnumMap = {
  ReleaseStatus.debug: 'debug',
  ReleaseStatus.preview: 'preview',
  ReleaseStatus.released: 'released',
};

InstanceSpec _$InstanceSpecFromJson(Map<String, dynamic> json) => InstanceSpec(
      type: MIoTSpecType.fromJson(json['type'] as String),
      description: json['description'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => InstanceServiceSpec.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InstanceSpecToJson(InstanceSpec instance) =>
    <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
      'services': instance.services,
    };

InstanceServiceSpec _$InstanceServiceSpecFromJson(Map<String, dynamic> json) =>
    InstanceServiceSpec(
      iid: json['iid'] as int,
      type: MIoTSpecType.fromJson(json['type'] as String),
      description: json['description'] as String,
      properties: (json['properties'] as List<dynamic>?)
              ?.map((e) =>
                  InstancePropertySpec.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      actions: (json['actions'] as List<dynamic>?)
              ?.map(
                  (e) => InstanceActionSpec.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$InstanceServiceSpecToJson(
        InstanceServiceSpec instance) =>
    <String, dynamic>{
      'iid': instance.iid,
      'type': instance.type,
      'description': instance.description,
      'properties': instance.properties,
      'actions': instance.actions,
    };

InstancePropertySpec _$InstancePropertySpecFromJson(
        Map<String, dynamic> json) =>
    InstancePropertySpec(
      iid: json['iid'] as int,
      type: MIoTSpecType.fromJson(json['type'] as String),
      description: json['description'] as String,
      format: json['format'] as String,
      access:
          (json['access'] as List<dynamic>?)?.map((e) => e as String).toSet() ??
              {},
      values: (json['value-list'] as List<dynamic>?)
          ?.map((e) =>
              InstancePropertyValueEnum.fromJson(e as Map<String, dynamic>))
          .toList(),
      range: json['value-range'] == null
          ? null
          : InstancePropertyValueRange.fromJson(
              json['value-range'] as List<dynamic>),
    );

Map<String, dynamic> _$InstancePropertySpecToJson(
    InstancePropertySpec instance) {
  final val = <String, dynamic>{
    'iid': instance.iid,
    'type': instance.type,
    'description': instance.description,
    'format': instance.format,
    'access': instance.access.toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value-list', instance.values);
  writeNotNull('value-range', instance.range);
  return val;
}

InstancePropertyValueEnum _$InstancePropertyValueEnumFromJson(
        Map<String, dynamic> json) =>
    InstancePropertyValueEnum(
      value: json['value'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$InstancePropertyValueEnumToJson(
        InstancePropertyValueEnum instance) =>
    <String, dynamic>{
      'value': instance.value,
      'description': instance.description,
    };

InstanceActionSpec _$InstanceActionSpecFromJson(Map<String, dynamic> json) =>
    InstanceActionSpec(
      iid: json['iid'] as int,
      type: MIoTSpecType.fromJson(json['type'] as String),
      description: json['description'] as String,
    );

Map<String, dynamic> _$InstanceActionSpecToJson(InstanceActionSpec instance) =>
    <String, dynamic>{
      'iid': instance.iid,
      'type': instance.type,
      'description': instance.description,
    };
