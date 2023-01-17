import 'dart:convert';

import 'package:eosdart_ecc/eosdart_ecc.dart';
import 'package:jose/jose.dart';
import 'package:secp256k1/secp256k1.dart';

import '../../infra_did_dart.dart';

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
    builder.addRecipient(jwk);
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

  String createVerifiablePresentation(String verifiableCredentialJWT,
      String eosPrivateKey, String holderDid, String verifierDid) {
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
    verifiablePresentation["vp"]
        ["verifiableCredential"] = [verifiableCredentialJWT];
    verifiablePresentation["iss"] = holderDid;
    verifiablePresentation["aud"] = [verifierDid];
    verifiablePresentation["nbf"] = now.millisecondsSinceEpoch;
    verifiablePresentation["exp"] = exp.millisecondsSinceEpoch;

    var builder = JsonWebSignatureBuilder();
    builder.jsonContent = verifiablePresentation;
    builder.addRecipient(jwk);
    var jws = builder.build();
    return jws.toCompactSerialization();
  }

  Future<Map> verifyVerifiablePresentation(
      String verifiablePresentationJWT, Resolver resolver) async {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    var jws =
        JsonWebSignature.fromCompactSerialization(verifiablePresentationJWT);
    var payload = jws.unverifiedPayload.jsonContent;
    if (payload["nbf"] != Null && payload["nbf"] > currentTime) {
      throw Exception('verifiable presentation not valid yet');
    }
    if (payload["exp"] != Null && payload["exp"] < currentTime) {
      throw Exception('verifiable presentation expired');
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
