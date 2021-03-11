import 'package:dio/dio.dart';

import 'instance.dart';

class MIoTSpecV2 {
  static final instance = MIoTSpecV2._();

  final _dio = Dio(BaseOptions(baseUrl: 'https://miot-spec.org/miot-spec-v2'));

  MIoTSpecV2._();

  Future<List<InstanceEntry>> get instances async {
    final resp = await _dio.get<Map<String, dynamic>>('/instances?status=all');
    final list = resp.data?['instances'] as List<dynamic>;
    return list
        .map((dynamic e) => InstanceEntry.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<InstanceSpec> getInstance(String type) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/instance',
      queryParameters: <String, dynamic>{
        'type': type,
      },
    );

    return InstanceSpec.fromJson(resp.data!);
  }
}
