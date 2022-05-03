import 'package:miot_spec/src/type.dart';
import 'package:test/test.dart';

void main() {
  group('MIoT spec type', () {
    test('urn:miot-spec-v2:device:fan:0000A005', () {
      final type = SpecType.parse('urn:miot-spec-v2:device:fan:0000A005');

      expect(type.namespace, equals('miot-spec-v2'));
      expect(type.type, equals('device'));
      expect(type.name, equals('fan'));
      expect(type.value, equals(0xA005));
      expect(type.product, isNull);
      expect(type.version, isNull);
      expect(type.toString(), equals('urn:miot-spec-v2:device:fan:0000A005'));
    });

    test('urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1', () {
      final type = SpecType.parse(
        'urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1',
      );

      expect(type.namespace, equals('miot-spec-v2'));
      expect(type.type, equals('device'));
      expect(type.name, equals('light'));
      expect(type.value, equals(0xA001));
      expect(type.product, equals('yeelight-lamp1'));
      expect(type.version, equals(1));
      expect(
        type.toString(),
        equals('urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1'),
      );
    });

    test('Wrong type: urn:miot-spec-v2:device:light', () {
      expect(() => SpecType.parse('urn:miot-spec-v2:device:light'),
          throwsFormatException);
    });

    test('Equality', () {
      final type1 = SpecType.parse(
        'urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1',
      );
      final type2 = SpecType.parse(
        'urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1',
      );
      expect(type1, equals(type2));
      expect(type1.hashCode, equals(type2.hashCode));

      final type3 = SpecType.parse('urn:miot-spec-v2:device:light:0000A001');
      final type4 = SpecType.parse('urn:miot-spec-v2:device:light:0000A001');
      expect(type3, equals(type4));
      expect(type3.hashCode, equals(type4.hashCode));

      final type5 = SpecType.parse(
        'urn:miot-spec-v2:device:light:0000A001:yeelight-lamp1:1',
      );
      final type6 = SpecType.parse(
        'urn:miot-spec-v2:device:light:0000A002:yeelight-lamp1:1',
      );
      expect(type5, isNot(equals(type6)));
      expect(type5.hashCode, isNot(equals(type6.hashCode)));
    });
  });
}
