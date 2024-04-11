import 'dart:convert';

import 'package:eosdart_ecc/eosdart_ecc.dart';
import 'package:jose/jose.dart';
import 'package:secp256k1/secp256k1.dart';

import '../../../infra_did_dart.dart';
import '../infrablockchain/numeric.dart';
import '../infrablockchain/serialize.dart';

class InfraVerifiable {
  Future<String> createVerifiableCredential(
      Map credential, String eosPrivateKey) async {
    IKey eosSk = stringToPrivateKey(eosPrivateKey);
    PrivateKey sk = PrivateKey.fromHex(arrayToHex(eosSk.data));
    PublicKey pk = sk.publicKey;
    JsonWebKey jwk = JsonWebKey.ec(
        curve: "P-256K",
        privateKey: sk.D,
        xCoordinate: pk.X,
        yCoordinate: pk.Y);

    var builder = JsonWebSignatureBuilder();
    builder.jsonContent = credential;
    builder.addRecipient(jwk, algorithm: "ES256K");
    builder.setProtectedHeader("typ", "JWT");
    var jws = builder.build();

    return jws.toCompactSerialization();
  }

  Future<Map> verifyVerifiableCredential(
      String verifiableCredentialJWT, Resolver resolver) async {
    var jws =
        JsonWebSignature.fromCompactSerialization(verifiableCredentialJWT);
    var payload = jws.unverifiedPayload.jsonContent;
    String issuer = payload["iss"];
    String vcId = payload["vc"]["id"];
    var vcDidDocument = await resolver.resolve(vcId);
    if (vcDidDocument["didDocument"]["deactivated"] != Null &&
        vcDidDocument["didDocument"]["deactivated"] == true) {
      throw Exception('invalid verifiable credential');
    }
    var issuerDidDocument = await resolver.resolve(issuer);
    if (issuerDidDocument["didDocument"]["deactivated"] != Null &&
        issuerDidDocument["didDocument"]["deactivated"] == true) {
      throw Exception('invalid issuer');
    }
    Map issuerVerificationMethod =
        issuerDidDocument["didDocument"]["verificationMethods"];
    String issuerPublicKey = issuerVerificationMethod["publicKeyHex"];
    PublicKey pk = PublicKey.fromCompressedHex(issuerPublicKey);

    JsonWebKey jwk =
        JsonWebKey.ec(curve: "P-256K", xCoordinate: pk.X, yCoordinate: pk.Y);

    var keyStore = JsonWebKeyStore()..addKey(jwk);
    var verified = await jws.verify(keyStore);
    if (!verified) {
      throw Exception('verifiable credential verification failed');
    }

    return payload;
  }

  String createVerifiablePresentation(List<String> verifiableCredentialJWT,
      String eosPrivateKey, String holderDid, String verifierDid, Map options) {
    IKey eosSk = stringToPrivateKey(eosPrivateKey);
    PrivateKey sk = PrivateKey.fromHex(arrayToHex(eosSk.data));
    JsonWebKey jwk = JsonWebKey.ec(curve: "P-256K", privateKey: sk.D);

    Map verifiablePresentation = {};

    var now = DateTime.now();
    var exp = DateTime(now.year, now.month, now.day, now.hour + 10);

    verifiablePresentation["vp"] = {};
    verifiablePresentation["vp"]
        ["@context"] = ["https://www.w3.org/2018/credentials/v1"];
    verifiablePresentation["vp"]["type"] = ["VerifiablePresentation"];
    verifiablePresentation["vp"]["verifiableCredential"] =
        verifiableCredentialJWT;
    verifiablePresentation["iss"] = holderDid;
    if (options.containsKey("aud")) {
      verifiablePresentation["aud"] = options["aud"];
    }
    if (options.containsKey("nbf")) {
      verifiablePresentation["nbf"] = options["nbf"];
    }
    if (options.containsKey("exp")) {
      verifiablePresentation["exp"] = options["exp"];
    }
    if (options.containsKey("challenge")) {
      verifiablePresentation["nonce"] = options["challenge"];
    }

    var builder = JsonWebSignatureBuilder();
    builder.jsonContent = verifiablePresentation;
    builder.addRecipient(jwk, algorithm: "ES256K");
    builder.setProtectedHeader("typ", "JWT");
    var jws = builder.build();
    return jws.toCompactSerialization();
  }

  Future<Map> verifyVerifiablePresentation(
      String verifiablePresentationJWT, Resolver resolver, Map options) async {
    int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var jws =
        JsonWebSignature.fromCompactSerialization(verifiablePresentationJWT);
    var payload = jws.unverifiedPayload.jsonContent;
    if (payload.containsKey("nbf") && payload["nbf"] > currentTime) {
      throw Exception('verifiable presentation not valid yet');
    }
    if (payload.containsKey("exp") && payload["exp"] < currentTime) {
      throw Exception('verifiable presentation expired');
    }
    if (options.containsKey("challenge") &&
        options["challenge"] != payload["nonce"]) {
      throw Exception('Presentation does not contain the mandatory challenge');
    }

    List<dynamic> vcs = payload["vp"]["verifiableCredential"];
    for (String vc in vcs) {
      verifyVerifiableCredential(vc, resolver);
    }

    String holder = payload["iss"];
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
      throw Exception('verifiable presentation verification failed');
    }

    return payload;
  }
}
