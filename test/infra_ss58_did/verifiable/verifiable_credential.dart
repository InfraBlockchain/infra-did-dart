import "dart:convert";

import "package:infra_did_dart/infra_did_dart.dart";
import "package:infra_did_dart/src/infra_ss58_did/model/infra_ss58_did_set.dart";
import "package:infra_did_dart/src/infra_ss58_did/model/signer.dart";
import "package:infra_did_dart/src/infra_ss58_did/resolver/resolver.dart";
import "package:infra_did_dart/src/infra_ss58_did/verifiable/verifiable_credential.dart";
import "package:test/test.dart";

Future<void> main() async {
  String phrase =
      "biology other aware floor recall journey coin bubble dial hurdle coconut canoe";
  InfraSS58DIDSet didSet =
      await InfraSS58DID.generateSS58DIDFromPhrase(phrase, "01");

  InfraSS58DID infraSS58DID = InfraSS58DID(
    didSet: didSet,
    chainEndpoint: "wss://did.stage.infrablockspace.net",
    controllerDID: didSet.did,
    controllerMnemonic: didSet.mnemonic,
  );

  test("Should issue vc & verify vc", () async {
    CredentialSigner cs = CredentialSigner(
        did: didSet.did,
        keyId: "key-2",
        keyType: "Ed25519VerificationKey2020",
        seed: didSet.seed,
        mnemonic: didSet.mnemonic);

    String credentialString = """{
            "@context": [
              "https://www.w3.org/2018/credentials/v1",
              "https://www.w3.org/2018/credentials/examples/v1"
            ],
            "id": "did:infra:01:5D1vAs2qC6XS3Raxy3W38xo2TiZXBcrT6PN3WkrN4SZDZuVJ",
            "type": [
                "VerifiableCredential"
            ],
            "credentialSubject": [
                {
                    "id": "did:example:d23dd687a7dc6787646f2eb98d0"
                }
            ],
            "issuanceDate": "2024-05-23T06:08:03.039Z",
            "issuer": "did:infra:01:5D1vAs2qC6XS3Raxy3W38xo2TiZXBcrT6PN3WkrN4SZDZuVJ"
        }""";

    final vc = await InfraSS58VerifiableCredential()
        .issueVc(jsonDecode(credentialString), infraSS58DID.didSet.did, cs);
    print(jsonEncode(vc));

    final resolver = InfraSS58DIDResolver(
      infraSS58DID.chainEndpoint,
    );

    final isVerified =
        await InfraSS58VerifiableCredential().verifyVc(vc, resolver);
    print(isVerified);
  });
}
