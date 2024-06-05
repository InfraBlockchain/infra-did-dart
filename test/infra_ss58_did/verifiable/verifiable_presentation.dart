import "dart:convert";

import "package:infra_did_dart/infra_did_dart.dart";
import "package:infra_did_dart/src/infra_ss58_did/model/infra_ss58_did_set.dart";
import "package:infra_did_dart/src/infra_ss58_did/model/signer.dart";
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

  test("Should issue vp", () async {
    CredentialSigner cs = CredentialSigner(
        did: didSet.did,
        keyId: "keys-2",
        keyType: "Ed25519VerificationKey2020",
        seed: didSet.seed,
        mnemonic: didSet.mnemonic);

    String unsignedVP = """
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://www.w3.org/2018/credentials/examples/v1",
    "https://schema.org"
  ],
  "verifiableCredential": [
{"@context":["https://www.w3.org/2018/credentials/v1","https://www.w3.org/2018/credentials/examples/v1","https://schema.org"],"id":"did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z","type":["VerifiableCredential"],"credentialSubject":[{"id":"did:example:d23dd687a7dc6787646f2eb98d0"}],"issuanceDate":"2024-05-23T06:08:03.039Z","issuer":"did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z","proof":{"type":"Ed25519Signature2020","proofPurpose":"assertionMethod","verificationMethod":"did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z#keys-2","created":"2024-06-05T06:00:46.734682Z","proofValue":"z3XHaVZgi5PT71Z7ZUVyp9Mic59yuvV1LeTpBawcN13UexQc8YUMXzYcdAfngpmuMVR1b6X6zYqsjBzifk1XMHDZQ"}}  ],
  "id": "http://example.edu/credentials/2803",
  "type": ["VerifiablePresentation", "CredentialManagerPresentation"],
  "holder": "did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z"
}
    """;

    final vp = await InfraSS58VerifiablePresentation().issueVp(
      jsonDecode(unsignedVP),
      infraSS58DID.didSet.did,
      cs,
      "challenge",
      "newnal",
    );
    print(jsonEncode(vp));

    final resolver = InfraSS58DIDResolver(
      infraSS58DID.chainEndpoint,
    );

    final isVerified = await InfraSS58VerifiablePresentation()
        .verifyVp(vp, resolver, "challenge", "newnal");
    print(isVerified);
  });
}
