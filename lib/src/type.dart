/// Available kinds of [MIoTSpecType].
enum MIoTSpecTypeKind {
  template,
  property,
  action,
  event,
  service,
  device,
}

/// URN for identifying type of each device, property, etc.
///
/// Follow the URN standard RFC2141. For details, please visit:
/// https://iot.mi.com/new/doc/design/spec/overall
class MIoTSpecType {
  final String namespace;
  final MIoTSpecTypeKind type;
  final String name;
  final int? value;
  final String? product;
  final int? version;

  const MIoTSpecType({
    required this.namespace,
    required this.type,
    required this.name,
    required this.value,
    this.product,
    this.version,
  });

  factory MIoTSpecType.parse(String specType) {
    final list = specType.split(':');

    if (list.length < 5 || list.first != 'urn') {
      throw FormatException('Invalid specification type.');
    }

    return MIoTSpecType(
      namespace: list[1],
      type: MIoTSpecTypeKind.values.firstWhere(
        (e) => e.name == list[2],
        orElse: () => throw FormatException('Invalid specification type.'),
      ),
      name: list[3],
      value: int.parse(list[4], radix: 16),
      product: list.length >= 6 ? list[5] : null,
      version: list.length >= 7 ? int.parse(list[6]) : null,
    );
  }

  factory MIoTSpecType.fromJson(String json) => MIoTSpecType.parse(json);

  String toJson() => toString();

  bool sameTypeWith(MIoTSpecType other) =>
      namespace == other.namespace && type == other.type;

  bool sameNameWith(MIoTSpecType other) =>
      namespace == other.namespace && type == other.type && name == other.name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MIoTSpecType &&
          sameNameWith(other) &&
          value == other.value &&
          product == other.product &&
          version == other.version;

  @override
  int get hashCode =>
      namespace.hashCode ^
      type.hashCode ^
      name.hashCode ^
      value.hashCode ^
      product.hashCode ^
      version.hashCode;

  @override
  String toString() => 'urn:$namespace:${type.name}:$name'
      ':${(value ?? 0).toRadixString(16).padLeft(8, '0').toUpperCase()}'
      '${product != null ? ':$product' : ''}'
      '${version != null ? ':$version' : ''}';
}
