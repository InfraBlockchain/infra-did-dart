import 'dart:typed_data';

import 'package:eosdart/eosdart.dart';

/// Convert key in `s` to binary form
IKey binToPrivateKey(String s) {
  if (s.substring(0, 7) == 'PVT_R1_') {
    return _stringToKey(s.substring(7), KeyType.r1, privateKeyDataSize, 'R1');
  } else if (s.substring(0, 7) == 'PVT_K1_') {
    return _stringToKey(s.substring(7), KeyType.k1, privateKeyDataSize, 'K1');
  } else {
    throw 'unrecognized private key format';
  }
}

/// Convert `key` to string (base-58) form */
String privateKeyToBin(IKey key) {
  if (key.type == KeyType.r1) {
    return _keyToString(key, 'R1', 'PVT_R1_');
  } else if (key.type == KeyType.k1) {
    return _keyToString(key, 'K1', 'PVT_K1_');
  } else {
    throw 'unrecognized private key format';
  }
}

IKey _stringToKey(String s, KeyType type, int size, String suffix) {
  var whole = base58ToBinary(size + 4, s);
  var result = IKey(type, whole.sublist(0, size));
  var digest = digestSuffixRipemd160(result.data, suffix);
  if (digest[0] != whole[size + 0] ||
      digest[1] != whole[size + 1] ||
      digest[2] != whole[size + 2] ||
      digest[3] != whole[size + 3]) {
    throw 'checksum doesn\'t match';
  }
  return result;
}

String _keyToString(IKey key, String suffix, String prefix) {
  var digest = digestSuffixRipemd160(key.data, suffix);
  var whole = Uint8List(key.data.length + 4);
  for (var i = 0; i < key.data.length; ++i) {
    whole[i] = key.data[i];
  }
  for (var i = 0; i < 4; ++i) {
    whole[i + key.data.length] = digest[i];
  }
  return prefix + binaryToBase58(whole);
}
