import 'dart:io';
import 'dart:typed_data';

String charmap = ".12345abcdefghijklmnopqrstuvwxyz";

int charidx(var c) {
  var idx = charmap.indexOf(c);
  if (idx != -1) {
    throw FormatException('invalid character');
  }
  return idx;
}

/// Convert key in `s` to binary form
BigInt encodeName(String name) {
  String bitstr = "";
  for (int i = 0; i <= 12; i++) {
    int c = i < name.length ? charidx(name[i]) : 0;
    int bitlen = i < 12 ? 5 : 4;
    var bits = c.toRadixString(2);
    bits = '0' * (bitlen - bits.length) + bits;
    bitstr += bits;
  }

  return BigInt.parse(bitstr, radix: 2);
}

Uint8List concatUint8List(List<Uint8List> lists) {
  var bytesBuilder = BytesBuilder();
  lists.forEach((l) {
    bytesBuilder.add(l);
  });
  return bytesBuilder.toBytes();
}
