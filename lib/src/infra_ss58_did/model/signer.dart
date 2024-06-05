import 'package:infra_did_dart/src/infra_ss58_did/model/exception.dart';

class CredentialSigner {
  final String did;
  final String keyId;
  final String keyType;
  final String seed;
  final String mnemonic;
  late String signatureType;
  late String signatureName;

  CredentialSigner({
    required this.did,
    required this.keyId,
    required this.keyType,
    required this.seed,
    required this.mnemonic,
  }) {
    if (this.keyType == "Ed25519VerificationKey2018") {
      this.signatureType = "Ed25519";
      this.signatureName = "Ed25519Signature2018";
    } else if (this.keyType == "Ed25519VerificationKey2020") {
      this.signatureType = "Ed25519";
      this.signatureName = "Ed25519Signature2020";
    } else if (this.keyType == "JsonWebKey2020") {
      this.signatureType = "Ed25519";
      this.signatureName = "JsonWebSignature2020";
    } else {
      throw InfraDIDException(1, 'Unknown keyType');
    }
  }
}
