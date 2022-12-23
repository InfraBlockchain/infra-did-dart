import 'package:jose/jose.dart';
import 'package:secp256k1/secp256k1.dart';

import '../../infra_did_dart.dart';

class InfraVerifiable {
  Future<String> createVerifiableCredential(
      Map credential, String privatekey) async {
    PrivateKey sk = PrivateKey.fromHex(privatekey);
    PublicKey pk = sk.publicKey;
    JsonWebKey jwk = JsonWebKey.ec(
        curve: "P-256K",
        privateKey: sk.D,
        xCoordinate: pk.X,
        yCoordinate: pk.Y);

    var builder = JsonWebSignatureBuilder();
    builder.jsonContent = credential;
    builder.addRecipient(jwk);
    var jws = builder.build();

    return jws.toCompactSerialization();
  }

  Future<Map> verifyVerifiableCredential(
      String verifiableCredentialJWT, Resolver resolver) async {
    var jws =
        JsonWebSignature.fromCompactSerialization(verifiableCredentialJWT);
    var payload = jws.unverifiedPayload.jsonContent;
    String issuer = payload["issuer"];
    var issuerDidDocument = await resolver.resolve(issuer);
    Map issuerVerificationMethod =
        issuerDidDocument["didDocument"]["verificationMethods"];
    String issuerPublicKey = issuerVerificationMethod["publicKeyHex"];
    PublicKey pk = PublicKey.fromCompressedHex(issuerPublicKey);

    JsonWebKey jwk =
        JsonWebKey.ec(curve: "P-256K", xCoordinate: pk.X, yCoordinate: pk.Y);

    var keyStore = JsonWebKeyStore()..addKey(jwk);
    var verified = await jws.verify(keyStore);
    if (!verified) {
      throw Exception('Verification failed');
    }

    return jws.unverifiedPayload.jsonContent;
  }

  String createVerifiablePresentation(String verifiableCredentialJWT,
      String privatekey, String holderDid, String verifierDid) {
    PrivateKey pk = PrivateKey.fromHex(privatekey);
    JsonWebKey jwk = JsonWebKey.ec(curve: "P-256K", privateKey: pk.D);

    Map verifiablePresentation = {};

    var now = DateTime.now();
    var exp = DateTime(now.year, now.month, now.day, now.hour + 10);

    verifiablePresentation["@context"] =
        "https://www.w3.org/2018/credentials/v1";
    verifiablePresentation["type"] = "VerifiablePresentation";
    verifiablePresentation["verifiableCredential"] = [verifiableCredentialJWT];
    verifiablePresentation["holder"] = holderDid;
    verifiablePresentation["verifier"] = verifierDid;
    verifiablePresentation["issuanceDate"] = now.toIso8601String();
    verifiablePresentation["expirationDate"] = exp.toIso8601String();

    var builder = JsonWebSignatureBuilder();
    builder.jsonContent = verifiablePresentation;
    builder.addRecipient(jwk);
    var jws = builder.build();
    return jws.toCompactSerialization();
  }

  Future<Map> verifyVerifiablePresentation(
      String verifiablePresentationJWT, Resolver resolver) async {
    var jws =
        JsonWebSignature.fromCompactSerialization(verifiablePresentationJWT);
    var payload = jws.unverifiedPayload.jsonContent;
    String holder = payload["holder"];
    var holderDidDocument = await resolver.resolve(holder);
    Map holderVerificationMethod =
        holderDidDocument["didDocument"]["verificationMethods"];
    String issuerPublicKey = holderVerificationMethod["publicKeyHex"];
    PublicKey pk = PublicKey.fromCompressedHex(issuerPublicKey);

    JsonWebKey jwk =
        JsonWebKey.ec(curve: "P-256K", xCoordinate: pk.X, yCoordinate: pk.Y);

    var keyStore = JsonWebKeyStore()..addKey(jwk);
    var verified = await jws.verify(keyStore);
    if (!verified) {
      throw Exception('Verification failed');
    }

    return jws.unverifiedPayload.jsonContent;
  }
}
