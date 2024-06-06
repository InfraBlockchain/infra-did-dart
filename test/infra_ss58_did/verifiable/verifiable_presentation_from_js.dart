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

  test("Should issue vp", () async {
    String vp = """
    {"@context":["https://www.w3.org/2018/credentials/v1","https://www.w3.org/2018/credentials/examples/v1","https://schema.org"],"verifiableCredential":[{"@context":["https://www.w3.org/2018/credentials/v1","https://www.w3.org/2018/credentials/examples/v1","https://schema.org"],"id":"did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z","type":["VerifiableCredential"],"credentialSubject":[{"id":"did:example:d23dd687a7dc6787646f2eb98d0"}],"issuanceDate":"2024-05-23T06:08:03.039Z","issuer":"did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z","proof":{"type":"Ed25519Signature2020","proofPurpose":"assertionMethod","verificationMethod":"did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z#keys-2","created":"2024-06-05T06:00:46.734682Z","proofValue":"z3XHaVZgi5PT71Z7ZUVyp9Mic59yuvV1LeTpBawcN13UexQc8YUMXzYcdAfngpmuMVR1b6X6zYqsjBzifk1XMHDZQ"}}],"id":"http://example.edu/credentials/2803","type":["VerifiablePresentation","CredentialManagerPresentation"],"holder":"did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z","proof":{"type":"Ed25519Signature2020","proofPurpose":"assertionMethod","verificationMethod":"did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z#keys-2","created":"2024-06-05T06:04:15.210569Z","challenge":"challenge","domain":"newnal","proofValue":"z3d7moUNT1NXz8WyDh2cGCh35FNfAkHqEnXMMfekkMF9QF8T5FW9vjLgea8eQfbKUbopB7NfTERcEwqFZg97WAqbc"}}
    """;

    final resolver = InfraSS58DIDResolver(
      infraSS58DID.chainEndpoint,
    );

    final isVerified = await InfraSS58VerifiablePresentation()
        .verifyVp(jsonDecode(vp), resolver);
    print(isVerified);
  });
}
