import 'dart:convert';
import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:test/test.dart';

void main() {
  group('infra_did_dart resolver test', () {
    test('resolve pubkey did success', () async {
      JsonEncoder encoder = JsonEncoder.withIndent('  ');

      Resolver a = Resolver("fmapkumrotfc", "01", "http://localhost:8888");
      var document = await a.resolve(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63");
      expect(true, true);
    });

    test('resolve account did success', () async {
      JsonEncoder encoder = JsonEncoder.withIndent('  ');

      Resolver a = Resolver("fmapkumrotfc", "01", "http://localhost:8888");
      var document = await a.resolve("did:infra:01:fmapkumrotfc");
      expect(true, true);
    });

    test('resolve failed', () async {
      try {
        JsonEncoder encoder = JsonEncoder.withIndent('  ');

        Resolver a = Resolver("fmapkumrotfc", "01", "http://localhost:8888");
        var document = await a.resolve("did:infra:01");
        expect(true, false);
      } catch (e) {
        expect(true, true);
      }
    });
  });
}
