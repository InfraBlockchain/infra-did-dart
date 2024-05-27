# infra-did-dart

**This Library is dart version of infra-did-js**

Feature provided by infra-did-dart Library :

-   Infra DID Creation (SS58)
-   Resolve Infra DID (SS58)
-   JSON-LD VC/VP creation/verification

### Infra DID Creation

currently ed25519 curve is supported

```dart
    InfraSS58DIDSet didSet = await InfraSS58DID.generateSS58DID("01");
    print(didSet.toJson());
   /*
        {
            "address":"5FEWTgcxvefibCpoy7rfPx7WKimuWAuRx7JZmhwRTvQosZse"
            "did":"did:infra:01:5FEWTgcxvefibCpoy7rfPx7WKimuWAuRx7JZmhwRTvQosZse",
            "mnemonic":"second lucky rifle size spray advance approve view melody carpet offer thumb"
            "seed":"0177ced8efef49f17fec276d56de1b2037fbcc6348693d22436633043247a942",
        }
    */
```

### Issuing and Verifying W3C Verifiable Credential (VC), Verifiable Presentation (VP)

#### DID Resolver

```dart
    final did = "did:infra:01:5DpboW3jm8AnkZxN1Jkdk1ZxisuQyYV6rDGGicYzXDdjETpe";
    InfraSS58DIDDocument document =
        InfraSS58DIDResolver.resolveDefaultDocument(did);
    print(document.toJson());
    /*
        {
          "@context": "https://www.w3.org/ns/did/v1",
          "id": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW",
          "verificationMethod": [
            {
              "id": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-1",
              "type": "Ed25519VerificationKey2018",
              "controller": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW",
              "publicKeyBase58": "F9JHKboDqg3tK9wnrt8z8xwZRnoZCJAHTdxXVuUMW8z2"
            },
            {
              "id": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-2",
              "type": "Ed25519VerificationKey2020",
              "controller": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW",
              "publicKeyMultibase": "z6MktbZKur3fBDYMRenVYT6pz4VZFN5QcBQe9esTLBSNRMmQ"
            }
          ],
          "authentication": [
            "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-1",
            "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-2"
          ],
          "assertionMethod": [
            "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-1",
            "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-2"
          ]
        }
    */
```

#### Create and Verify Verifiable Credential JSON-LD

```dart
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
```

Verified Credential Result

```json
    {
      "@context": [
        "https://www.w3.org/2018/credentials/v1"
      ],
      "id": "did:infra:space:5FDseiC76zPek2YYkuyenu4ZgxZ7PUWXt9d19HNB5CaQXt5U",
      "type": [
        "VerifiableCredential"
      ],
      "credentialSubject": [
        {
          "id": "did:example:d23dd687a7dc6787646f2eb98d0"
        }
      ],
      "issuer": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW",
      "issuanceDate": "2023-04-24T06:08:03.039Z",
      "proof": {
        "@context": [
          "https://w3id.org/security/suites/ed25519-2020/v1"
        ],
        "type": "Ed25519Signature2020",
        "proofPurpose": "assertionMethod",
        "proofValue": "z5LPkbsnBbYTAJJ3fcwkEBtbfkT2wnLhLNmcSwj2e8FSYfMrrWoFey6958gm7G93UfTu6qkLkD1nwgzbzSihbu3jw",
        "verificationMethod": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-2",
        "created": "2023-04-30T23:53:20.028Z"
      }
    }
```

#### Create and Verify Verifiable Presentation JSON-LD

```dart
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
    CredentialSigner cs = CredentialSigner(
        did: didSet.did,
        keyId: "key-2",
        keyType: "Ed25519VerificationKey2020",
        seed: didSet.seed,
        mnemonic: didSet.mnemonic);

    String vc = """{
    "@context": [
        "https://www.w3.org/2018/credentials/v1",
        "https://www.w3.org/2018/credentials/examples/v1"
    ],
    "id": "did:infra:01:5D1vAs2qC6XS3Raxy3W38xo2TiZXBcrT6PN3WkrN4SZDZuVJ",
    "type": ["VerifiableCredential"],
    "credentialSubject": [{ "id": "did:example:d23dd687a7dc6787646f2eb98d0" }],
    "issuanceDate": "2024-05-23T06:08:03.039Z",
    "issuer": "did:infra:01:5D1vAs2qC6XS3Raxy3W38xo2TiZXBcrT6PN3WkrN4SZDZuVJ",
    "proofOptions": {
        "@context": "https://w3id.org/security/suites/ed25519-2020/v1",
        "type": "Ed25519",
        "proofPurpose": "assertionMethod",
        "verificationMethod": "did:infra:01:5D1vAs2qC6XS3Raxy3W38xo2TiZXBcrT6PN3WkrN4SZDZuVJ#key-2",
        "created": "2024-05-23T02:22:33.589280Z",
        "proofValue": "z5s3iK3xHnGepLcjopisRUJYrpsh3WpLEyj8SakJPu4icYViotCS3XmX5SmdpwtLuvppKu4rohCA478RHvKRrro9C"
    }
}
    """;

    final vp = await InfraSS58VerifiablePresentation()
        .issueVp(jsonDecode(vc), infraSS58DID.didSet.did, cs);
    print(jsonEncode(vp));

    final resolver = InfraSS58DIDResolver(
      infraSS58DID.chainEndpoint,
    );

    final isVerified =
        await InfraSS58VerifiableCredential().verifyVc(vp, resolver);
    print(isVerified);
```

Verified Presentation Result

```json
    {
      "@context": [
        "https://www.w3.org/2018/credentials/v1"
      ],
      "id": "did:infra:01:5D7nQ3WTPtJx79ywCbLum7fyVt1DKcg32jB6SdABhhwpzT9a",
      "type": "VerifiablePresentation",
      "verifiableCredential": {
        "@context": [
          "https://www.w3.org/2018/credentials/v1"
        ],
        "id": "did:infra:space:5FDseiC76zPek2YYkuyenu4ZgxZ7PUWXt9d19HNB5CaQXt5U",
        "type": [
          "VerifiableCredential"
        ],
        "credentialSubject": [
          {
            "id": "did:example:d23dd687a7dc6787646f2eb98d0"
          }
        ],
        "issuer": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW",
        "issuanceDate": "2023-04-24T06:08:03.039Z",
        "proof": {
          "@context": [
            "https://w3id.org/security/suites/ed25519-2020/v1"
          ],
          "type": "Ed25519Signature2020",
          "proofPurpose": "assertionMethod",
          "proofValue": "z3gFJvCvNYTVQJ7R7tXzbmAyZ62g3ZymbzwTrWJhgwatJouope5GnQmz7NW2zAVVYbor5KUW8TUa1V5KADPp8kBog",
          "verificationMethod": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-2",
          "created": "2023-04-25T23:52:13.770Z"
        }
      },
      "proof": {
        "@context": [
          "https://w3id.org/security/suites/ed25519-2020/v1"
        ],
        "type": "Ed25519Signature2020",
        "proofPurpose": "assertionMethod",
        "proofValue": "zWPTW2TC7WcEUk1F25saJxHKKt2HjsdSW3GEk12d2mJbUN2dJntEBng9N1RmZz6XuHqNuh7Dq1d4DTpyZ1GEokRq",
        "verificationMethod": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-2",
        "created": "2023-05-01T00:03:59.511Z"
      },
      "holder": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW"
    }
```

## API Documentation

For more information visit our [API reference]().

## License

**Infra-DID-Dart** is under MIT license. See the [LICENSE](https://github.com/InfraBlockchain/infra-did-dart/blob/master/LICENSE) file for more info.