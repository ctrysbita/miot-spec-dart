import 'package:dio/dio.dart';

import 'instance.dart';
import 'translation.dart';
import 'type.dart';

/// Online API for MIoT spec v2.
class MIoTSpecV2 {
  static final instance = MIoTSpecV2._();

  final _dio = Dio(BaseOptions(baseUrl: 'https://miot-spec.org/miot-spec-v2'));

  MIoTSpecV2._();

  /// Get all instances.
  Future<List<InstanceEntry>> getInstances([String status = 'all']) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/instances?status=$status',
    );
    final list = resp.data?['instances'] as List<dynamic>? ?? [];
    return list
        .map((e) => InstanceEntry.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Get specific instance.
  Future<InstanceSpec> getInstance(String type) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/instance',
      queryParameters: <String, dynamic>{
        'type': type,
      },
    );

    return InstanceSpec.fromJson(resp.data!);
  }

  /// Get translation for specific instance.
  Future<InstanceTranslations> getTranslationForInstance(
    MIoTSpecType type,
  ) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      'https://miot-spec.org/instance/v2/multiLanguage',
      queryParameters: <String, dynamic>{
        'urn': type,
      },
    );

    return InstanceTranslations.fromJson(resp.data!);
  }
}
