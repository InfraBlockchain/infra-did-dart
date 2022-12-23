# infra-did-dart

**This Library is dart version of infra-did-js**

* Infra DID Method Spec
  - https://github.com/InfraBlockchain/infra-did-method-specs/blob/main/docs/Infra-DID-method-spec.md

* Infra DID Registry Smart Contract on InfraBlockchain
  - https://github.com/InfraBlockchain/infra-did-registry

* Infra DID Resolver (DIF javascript universal resolver compatible)
  - https://github.com/InfraBlockchain/infra-did-resolver


Feature provided by Infra-DID-Swift Library :
  * Infra DID Creation
  * update DID attributes (service endpoint)
  * update Pub-Key DID owner key
  * revoke Pub-Key DID
  * add/update/remove trusted Pub-Key DID & Account DID
  * get trusted Pub-Key DID & Account DID
  * VC/VP creation/verification

## Installation

- **Using [pub](https://pub.dev)**:

```sh
dart pub add infra_did_dart
```

### Infra DID Creation

currently secp256k1 curve is supported 
**EosioSwift package is broken, DID Creation not supported for now**

```dart
  InfraKey a = InfraKey();
  a.generateDid("01");
  print(a.toJson());
  /*
    {
      "privateKey": "PVT_K1_tJNUdraxcUjn2rACZSWLFbUcj3DeVjDC5ZjG8Q3yztTZZg3N7",
      "publicKey": "PUB_K1_5JXbkkMg4o2P9Zm7ZuSkmb4zegbygvfYPMgXTxcTTyjBuDxRgs",
      "did":
          "did:infra:01:PUB_K1_5JXbkkMg4o2P9Zm7ZuSkmb4zegbygvfYPMgXTxcTTyjBuDxRgs"
    };
   */
```

### Update DID attributes

Set Pub-Key DID Attribute 
```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.setAttributePubKeyDID("key", "value");
```

Remove Pub-Key DID Attribute
```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.revokePubKeyDID();
```

Clear Pub-Key DID chain data
```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.clearPubKeyDID();
```

Set Account-based DID Attribute
```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.setAttributeAccountDID(
          "svc/MessagingService", "https://infradid.com/pk/3/mysvcr90");
```

Update Pub-Key DID owner key
```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.changeOwnerPubKeyDID(
          "PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63");
```

### Revoke Pub-Key DID

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.revokePubKeyDID();
```

### Add Trusted Pub-Key DID

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.registerTrustedAccountDID("fmapkumrotfc", "eosio", "?");
```

### Update Trusted Pub-Key DID

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.updateTrustedAccountDID("fmapkumrotfc", "eosio", "?");
```

### Remove Trusted Pub-Key DID

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.removeTrustedAccountDID("fmapkumrotfc", "eosio");
```

### Get Trusted Pub-Key DID By Authorizer

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.getTrustedPubKeyDIDByAuthorizer("fmapkumrotfc");
```

### Get Trusted Pub-Key DID By Target

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.getTrustedPubKeyDIDByTarget(
          "PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63");
```

### Get Trusted Pub-Key DID By Authorizer and Target

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.getTrustedPubKeyDID("fmapkumrotfc",
          "PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63");
```

### Add Trusted Account DID

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.registerTrustedAccountDID("fmapkumrotfc", "eosio", "?");
```

### Update Trusted Account DID

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.updateTrustedAccountDID("fmapkumrotfc", "eosio", "?");
```

### Remove Trusted Account DID

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.removeTrustedAccountDID("fmapkumrotfc", "eosio");
```

### Get Trusted Account DID By Authorizer

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.getTrustedAccountDIDByAuthorizer("fmapkumrotfc");
```

### Get Trusted Account DID By Target

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.getTrustedAccountDIDByTarget("eosio");
```

### Get Trusted Account DID By Authorizer and Target

```dart
    var infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    await infra.getTrustedAccountDID("fmapkumrotfc", "eosio");
```

### Issuing and Verifying W3C Verifiable Credential (VC), Verifiable Presentation (VP)

#### DID Resolver
```dart
  Resolver a = Resolver("fmapkumrotfc", "01", "http://localhost:8888");
```

#### Create and Verify Verifiable Credential Jwt

```dart
  Resolver resolver = Resolver("fmapkumrotfc", "01", "http://localhost:8888");
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

  String vc = await InfraVerifiable().createVerifiableCredential(credentials,
      "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
  print(vc + "\n");

  Map verifiedVc =
      await InfraVerifiable().verifyVerifiableCredential(vc, resolver);
  print(verifiedVc);
  print("");
```

Verified Credential Result
```json
{
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
```

#### Create and Verify Verifiable Presentation Jwt

```dart
  String vp = await InfraVerifiable().createVerifiablePresentation(
      vc,
      "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
      "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
      "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63");
  print(vp + "\n");

  Map verifiedVp =
      await InfraVerifiable().verifyVerifiablePresentation(vp, resolver);
  print(verifiedVp);
  print("");
```

Verified Presentation Result
```json
{
  "vp": {
    "@context": ["https://www.w3.org/2018/credentials/v1"],
    "type": ["VerifiablePresentation"],
    "verifiableCredential": [
      "eyJhbGciOiJFUzI1NiJ9.eyJ2YyI6eyJpZCI6ImRpZDppbmZyYTowMTpQVUJfSzFfNk1SeUFqUXE4dWQ3aFZOWWNmblZQSnFjVnBzY041U284Qmh0SHVHWXFFVDVCb0RxNjMiLCJAY29udGV4dCI6WyJodHRwczovL3d3dy53My5vcmcvMjAxOC9jcmVkZW50aWFscy92MSIsImh0dHBzOi8vY29vdi5pby9kb2NzL3ZjL3BlcnNvbmFsIl0sInR5cGUiOlsiVmVyaWZpYWJsZUNyZWRlbnRpYWwiLCJQZXJzb25hbCJdLCJjcmVkZW50aWFsU3ViamVjdCI6eyJkb2IiOiIxOTkxMDQwNSJ9fSwic3ViIjoiZGlkOmluZnJhOjAxOlBVQl9LMV82TVJ5QWpRcTh1ZDdoVk5ZY2ZuVlBKcWNWcHNjTjVTbzhCaHRIdUdZcUVUNUJvRHE2MyIsInZlciI6IjAuOSIsImlzcyI6ImRpZDppbmZyYTowMTpQVUJfSzFfNk1SeUFqUXE4dWQ3aFZOWWNmblZQSnFjVnBzY041U284Qmh0SHVHWXFFVDVCb0RxNjMifQ.mqEdDQAmNquUvRy7XjjbeW7unlsjjP7UHhFjYzVRItLoFbiM40KG_aHLqRMiF7NjX3vuAB88ukPtkAXU7PkoKA"
    ]
  },
  "iss": "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
  "aud": "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
  "nbf": "1671771659477",
  "exp": "1671807600000"
}
```

## API Documentation
   For more information visit our [API reference]().

## License

**Infra-DID-Dart** is under MIT license. See the [LICENSE](https://github.com/InfraBlockchain/infra-did-dart/blob/master/LICENSE) file for more info.