import 'package:miot_spec/src/type.dart';
import 'package:test/test.dart';

void main() {
  group('MIoT spec type', () {
    test('urn:miot-spec-v2:device:fan:0000A005', () {
      final type = MIoTSpecType.parse('urn:miot-spec-v2:device:fan:0000A005');

      expect(type.namespace, equals('miot-spec-v2'));
      expect(type.type, equals(MIoTSpecTypeKind.device));
      expect(type.name, equals('fan'));
      expect(type.value, equals(0xA005));
      expect(type.product, isNull);
      expect(type.version, isNull);
      expect(type.toString(), equals('urn:miot-spec-v2:device:fan:0000A005'));
    });

    test('urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1', () {
      final type = MIoTSpecType.parse(
        'urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1',
      );

      expect(type.namespace, equals('miot-spec-v2'));
      expect(type.type, equals(MIoTSpecTypeKind.device));
      expect(type.name, equals('light'));
      expect(type.value, equals(0xA001));
      expect(type.product, equals('yeelight-lamp1'));
      expect(type.version, equals(1));
      expect(
        type.toString(),
        equals('urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1'),
      );
    });

    test('urn:miot-spec-v2:device:light:0000A001:yeelink-lamp22:1:0000C802',
        () {
      final type = MIoTSpecType.parse(
        'urn:miot-spec-v2:device:light:0000A001:yeelink-lamp22:1:0000C802',
      );

      expect(
        type.toString(),
        equals(
          'urn:miot-spec-v2:device:light:0000A001:yeelink-lamp22:1:0000C802',
        ),
      );
    });

    test('Wrong type: urn:miot-spec-v2:device:light', () {
      expect(
        () => MIoTSpecType.parse('urn:miot-spec-v2:device:light'),
        throwsFormatException,
      );
    });

    test('Equality', () {
      final t1 = MIoTSpecType.parse(
        'urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1',
      );
      final t2 = MIoTSpecType.parse(
        'urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1',
      );
      expect(t1, equals(t2));
      expect(t1.hashCode, equals(t2.hashCode));

      final t3 = MIoTSpecType.parse('urn:miot-spec-v2:device:light:0000A001');
      final t4 = MIoTSpecType.parse('urn:miot-spec-v2:device:light:0000A001');
      expect(t3, equals(t4));
      expect(t3.hashCode, equals(t4.hashCode));

      final t5 = MIoTSpecType.parse(
        'urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1',
      );
      final t6 = MIoTSpecType.parse(
        'urn:miot-spec-v2:device:light:0000A002:yeelight-lamp1:1',
      );
      expect(t5, isNot(equals(t6)));
      expect(t5.hashCode, isNot(equals(t6.hashCode)));
    });
  });
}
