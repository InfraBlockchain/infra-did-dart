import 'dart:typed_data';

import 'package:eosdart_ecc/eosdart_ecc.dart';

import '../../infra_did_dart.dart';

class InfraKey {
  late String privateKey;
  late String publicKey;
  late String did;

  String generateDid(String networkId) {
    EOSPrivateKey sk = EOSPrivateKey.fromRandom();
    EOSPublicKey pk = sk.toEOSPublicKey();
    privateKey = privateKeyToString(stringToPrivateKey(sk.toString()));
    publicKey = convertLegacyPublicKey(pk.toString());
    did = "did:infra:${networkId}:${publicKey}";
    return did;
  }

  Map<String, dynamic> toJson() =>
      {'privateKey': privateKey, 'publicKey': publicKey, 'did': did};
}
