// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstanceEntry _$InstanceEntryFromJson(Map<String, dynamic> json) {
  return InstanceEntry(
    status: _$enumDecode(_$ReleaseStatusEnumMap, json['status']),
    model: json['model'] as String,
    type: json['type'] as String,
    version: json['version'] as int,
  );
}

Map<String, dynamic> _$InstanceEntryToJson(InstanceEntry instance) =>
    <String, dynamic>{
      'status': _$ReleaseStatusEnumMap[instance.status],
      'model': instance.model,
      'type': instance.type,
      'version': instance.version,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ReleaseStatusEnumMap = {
  ReleaseStatus.debug: 'debug',
  ReleaseStatus.preview: 'preview',
  ReleaseStatus.released: 'released',
};

InstanceSpec _$InstanceSpecFromJson(Map<String, dynamic> json) {
  return InstanceSpec(
    type: SpecType.fromJson(json['type'] as String),
    description: json['description'] as String,
    services: (json['services'] as List<dynamic>)
        .map((e) => InstanceServiceSpec.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InstanceSpecToJson(InstanceSpec instance) =>
    <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
      'services': instance.services,
    };

InstanceServiceSpec _$InstanceServiceSpecFromJson(Map<String, dynamic> json) {
  return InstanceServiceSpec(
    iid: json['iid'] as int,
    type: SpecType.fromJson(json['type'] as String),
    description: json['description'] as String,
    properties: (json['properties'] as List<dynamic>?)
            ?.map(
                (e) => InstancePropertySpec.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$InstanceServiceSpecToJson(
        InstanceServiceSpec instance) =>
    <String, dynamic>{
      'iid': instance.iid,
      'type': instance.type,
      'description': instance.description,
      'properties': instance.properties,
    };

InstancePropertySpec _$InstancePropertySpecFromJson(Map<String, dynamic> json) {
  return InstancePropertySpec(
    iid: json['iid'] as int,
    type: SpecType.fromJson(json['type'] as String),
    description: json['description'] as String,
    format: json['format'] as String,
    access:
        (json['access'] as List<dynamic>?)?.map((e) => e as String).toSet() ??
            {},
  );
}

Map<String, dynamic> _$InstancePropertySpecToJson(
        InstancePropertySpec instance) =>
    <String, dynamic>{
      'iid': instance.iid,
      'type': instance.type,
      'description': instance.description,
      'format': instance.format,
      'access': instance.access.toList(),
    };
