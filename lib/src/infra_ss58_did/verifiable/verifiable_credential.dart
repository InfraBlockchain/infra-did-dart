import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:infra_did_dart/src/infra_ss58_did/model/exception.dart';
import 'package:infra_did_dart/src/infra_ss58_did/model/infra_ss58_did_document.dart';
import 'package:infra_did_dart/src/infra_ss58_did/model/signer.dart';
import 'package:infra_did_dart/src/infra_ss58_did/resolver/resolver.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/key_convert.dart';
import 'package:json_ld_processor/json_ld_processor.dart';
import 'package:crypto/crypto.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:base_codecs/base_codecs.dart';

class InfraSS58VerifiableCredential {
  Future<Map<String, dynamic>> issueVc(
    Map<String, dynamic> credential,
    String issuerDid,
    CredentialSigner issuerSigner, {
    String? purpose,
  }) async {
    var proofOptions = {
      "@context": "https://w3id.org/security/v2",
      'type': issuerSigner.signatureName,
      'proofPurpose': purpose != null ? purpose : 'assertionMethod',
      'verificationMethod': issuerDid + "#" + issuerSigner.keyId,
      'created': DateTime.now().toUtc().toIso8601String()
    };
    List<int> privateKey =
        await extendedPrivateKeyFromUri(issuerSigner.mnemonic);

    String pOptions = await JsonLdProcessor.normalize(proofOptions,
        options: JsonLdOptions(safeMode: false, documentLoader: loadDocument));

    List<int> hashToSign = await _dataToHash(credential);

    var pOptionsHash = sha256.convert(utf8.encode(pOptions)).bytes;
    var hash = pOptionsHash + hashToSign;

    var signature =
        ed.sign(ed.PrivateKey(privateKey), Uint8List.fromList(hash));

    proofOptions['proofValue'] = 'z${base58BitcoinEncode(signature)}';
    proofOptions.remove('@context');
    credential["proof"] = proofOptions;
    return credential;
  }

  Future<bool> verifyVc(Map<String, dynamic> verifiableCredential,
      InfraSS58DIDResolver resolver) async {
    var proofOptions = verifiableCredential['proof'];

    var issuerKeyId = proofOptions['verificationMethod'];
    InfraSS58DIDDocument issuerDocument =
        await resolver.resolve(issuerKeyId.split('#')[0]);
    VerificationMethod verificationMethod = issuerDocument.verificationMethod
        .firstWhere((key) => key.id == issuerKeyId,
            orElse: () => throw InfraDIDException(1, 'Key not found'));

    List<int> decodedKey = switch (verificationMethod.type) {
      "Ed25519VerificationKey2018" =>
        ed25519PublicKeyFromBase58(verificationMethod.publicKeyBase58!),
      "Ed25519VerificationKey2020" =>
        ed25519PublicKeyFromMultibase(verificationMethod.publicKeyMultibase!),
      "JsonWebKey2020" =>
        ed25519PublicKeyFromEd25519Jwk(verificationMethod.publicKeyJwk!),
      _ => throw InfraDIDException(1, 'Key Type not supported')
    };

    var proofValue = proofOptions['proofValue'];

    if (proofOptions["@context"] == null) {
      proofOptions["@context"] = "https://w3id.org/security/v2";
    }
    proofOptions.remove('proofValue');

    String pOptions = await JsonLdProcessor.normalize(proofOptions,
        options: JsonLdOptions(safeMode: true, documentLoader: loadDocument));

    verifiableCredential.remove('proof');
    List<int> hashToSign = await _dataToHash(verifiableCredential);

    var pOptionsHash = sha256.convert(utf8.encode(pOptions)).bytes;
    var hash = pOptionsHash + hashToSign;

    return ed.verify(ed.PublicKey(decodedKey), Uint8List.fromList(hash),
        base58BitcoinDecode(proofValue.substring(1)));
  }

  FutureOr<List<int>> _dataToHash(dynamic data) async {
    if (data is Uint8List) {
      return data.toList();
    } else if (data is List<int>) {
      return data;
    } else if (data is Map<String, dynamic>) {
      var c14nDoc = await JsonLdProcessor.normalize(
          Map<String, dynamic>.from(data),
          options:
              JsonLdOptions(safeMode: false, documentLoader: loadDocument));
      return sha256.convert(utf8.encode(c14nDoc)).bytes;
    } else if (data is String) {
      return sha256.convert(utf8.encode(data)).bytes;
    } else {
      throw Exception('Unknown datatype for data');
    }
  }
}
