import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:test/test.dart';

void main() {
  group('infra_did_dart key test', () {
    test('Key generation', () {
      InfraKey a = InfraKey();
      String did = a.generateDid("01");
      expect(did.startsWith("did:infra:01"), true);
    });
  });
}
