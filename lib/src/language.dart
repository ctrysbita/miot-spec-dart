class InstanceTranslation {
  final Map<String, String> _data;

  InstanceTranslation.fromJson(Map<String, dynamic> json) : _data = json.cast();

  String? translateService(int siid) =>
      _data['service:${siid.toString().padLeft(3, '0')}'];

  String? translateProperty(int siid, int piid) =>
      _data['service:${siid.toString().padLeft(3, '0')}'
          ':property:${piid.toString().padLeft(3, '0')}'];
}
