import 'dart:convert';
import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:test/test.dart';

void main() {
  group('infra_did_dart verifiable test', () {
    test('Create VC + Verify VC + Create VP + Verify VP', () async {
      Resolver resolver =
          Resolver("fmapkumrotfc", "01", "http://localhost:8888");
      Map credentials = {
        "vc": {
          "id":
              "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "@context": [
            "https://www.w3.org/2018/credentials/v1",
            "https://coov.io/docs/vc/personal"
          ],
          "type": ["VerifiableCredential", "Personal"],
          "credentialSubject": {"dob": "19910405"}
        },
        "sub":
            "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
        "ver": "0.9",
        "iss":
            "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63"
      };

      String vc = await InfraVerifiable().createVerifiableCredential(
          credentials,
          "d2653ff7cbb2d8ff129ac27ef5781ce68b2558c41a74af1f2ddca635cbeef07d");

      Map verifiedVc =
          await InfraVerifiable().verifyVerifiableCredential(vc, resolver);

      String vp = await InfraVerifiable().createVerifiablePresentation(
          vc,
          "d2653ff7cbb2d8ff129ac27ef5781ce68b2558c41a74af1f2ddca635cbeef07d",
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63");

      Map verifiedVp =
          await InfraVerifiable().verifyVerifiablePresentation(vp, resolver);
      expect(true, true);
    });
  });
}
