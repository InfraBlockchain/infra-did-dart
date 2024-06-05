import 'package:infra_did_dart/src/infra_ss58_did/model/exception.dart';

class DIDKey {
  final List<int> publicKey;
  final int verRels;

  DIDKey({required this.publicKey, required this.verRels});

  factory DIDKey.fromJson(Map<String, dynamic> json) {
    return DIDKey(
      publicKey: json['publicKey'],
      verRels: json['verRels'],
    );
  }

  Map<String, dynamic> toJson() {
    if (verRels < 8) {
      return {
        'publicKey': {
          'Ed25519': publicKey,
        },
        'verRels': verRels,
      };
    }
    if (verRels == 8) {
      return {
        'publicKey': {
          'X25519': publicKey,
        },
        'verRels': verRels,
      };
    } else {
      throw InfraDIDException(1, 'Invalid verRels');
    }
  }
}
