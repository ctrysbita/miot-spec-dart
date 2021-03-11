/// URN for identifying type of each device, property, etc.
///
/// Follow the URN standard RFC2141. For details, please visit:
/// https://iot.mi.com/new/doc/standard/miot-spec/spec#规范定义
class SpecType {
  final String namespace;
  final String type;
  final String name;
  final int? value;
  final String? product;
  final int? version;

  const SpecType({
    required this.namespace,
    required this.type,
    required this.name,
    required this.value,
    this.product,
    this.version,
  });

  factory SpecType.parse(String specType) {
    final list = specType.split(':');

    if (list.length < 5 || list.first != 'urn') {
      throw FormatException('Invalid specification type.');
    }

    return SpecType(
      namespace: list[1],
      type: list[2],
      name: list[3],
      value: int.parse(list[4], radix: 16),
      product: list.length >= 6 ? list[5] : null,
      version: list.length >= 7 ? int.parse(list[6]) : null,
    );
  }

  factory SpecType.fromJson(String json) => SpecType.parse(json);

  String toJson() => toString();

  @override
  String toString() => 'urn:$namespace:$type:$name'
      ':${(value ?? 0).toRadixString(16).padLeft(8, '0').toUpperCase()}'
      '${product != null ? ':$product' : ''}'
      '${version != null ? ':$version' : ''}';
}
