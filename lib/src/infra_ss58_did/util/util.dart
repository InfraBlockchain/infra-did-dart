import 'dart:convert';
import 'dart:typed_data';

import 'package:infra_did_dart/src/infra_ss58_did/model/exception.dart';
import 'package:ss58/ss58.dart';

Uint8List didToHexPublicKey(String did) {
  try {
    String address = didToSS58Address(did);
    Address decode = Address.decode(address);
    return decode.pubkey;
  } catch (e) {
    throw InfraDIDException(3, e.toString());
  }
}

String didToSS58Address(String did) {
  try {
    return did.split(":").last;
  } catch (e) {
    throw InfraDIDException(3, e.toString());
  }
}

String ss58AddressToDID(String address, String networkId) {
  try {
    final did = "did:infra:" + networkId + ":" + address;
    return did;
  } catch (e) {
    throw InfraDIDException(4, e.toString());
  }
}

String jsonToHex(Map<String, dynamic> json) {
  List<int> bytes = utf8.encode(jsonEncode(json));

  String hex =
      bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();

  return hex;
}

String addPaddingToBase64(String base64Input) {
  while (base64Input.length % 4 != 0) {
    base64Input += '=';
  }
  return base64Input;
}
