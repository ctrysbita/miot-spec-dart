// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstanceTranslations _$InstanceTranslationsFromJson(
        Map<String, dynamic> json) =>
    InstanceTranslations(
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, InstanceTranslation.fromJson(e as Map<String, dynamic>)),
      ),
      timestamp: InstanceTranslations._tsFromJson(json['timestamp'] as String),
    );
