import "dart:convert";

import "package:infra_did_dart/infra_did_dart.dart";
import "package:test/test.dart";

Future<void> main() async {
  String phrase =
      "bamboo absorb chief dog box envelope leisure pink alone service spin more";
  InfraSS58DIDSet didSet =
      await InfraSS58DID.generateSS58DIDFromPhrase(phrase, "01");

  InfraSS58DID infraSS58DID = InfraSS58DID(
    didSet: didSet,
    chainEndpoint: "wss://did.stage.infrablockspace.net",
    controllerDID: didSet.did,
    controllerMnemonic: didSet.mnemonic,
  );

  test("Should verify vc from js", () async {
    String vc = """
    {
      "@context": [
        "https://www.w3.org/2018/credentials/v1",
        "https://schema.org"
      ],
      "type": [
        "VerifiableCredential"
      ],
      "credentialSubject": {
        "id": "did:example:abcdefg",
        "degree": {
          "type": "BachelorDegree",
          "name": "Bachelor of Science and Arts"
        }
      },
      "issuer": "did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z",
      "proof": {
        "type": "Ed25519Signature2018",
        "created": "2024-05-30T00:49:07Z",
        "verificationMethod": "did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z#keys-1",
        "proofPurpose": "assertionMethod",
        "proofValue": "z3dk2Jgi9JxwnduAJ3UKuWhhF4rco1jWUDuD1rHZcHT7pJ3ns5Yetj3CnJhSf2prh6xaiDf919kHjLdruWVM9NxC8"
      },
      "id": "did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z",
      "issuanceDate": "2024-05-30T00:49:07.758Z"
    }
""";

    final resolver = InfraSS58DIDResolver(
      infraSS58DID.chainEndpoint,
    );

    final isVerified = await InfraSS58VerifiableCredential()
        .verifyVc(jsonDecode(vc), resolver);
    print(isVerified);
  });
}
