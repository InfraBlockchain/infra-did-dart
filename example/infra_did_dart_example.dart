import 'package:eosdart/eosdart.dart';
import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:eosdart_ecc/eosdart_ecc.dart';

void main() {
  EOSPrivateKey privateKey = EOSPrivateKey.fromString(
      'PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V');

  // Get the related EOS public key
  EOSPublicKey publicKey = privateKey.toEOSPublicKey();
  // Print the EOS public key
  print(publicKey.toString());

  IKey a = binToPrivateKey(
      "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
  String b = arrayToHex(a.data);
  print(b);

  print(privateKeyToBin(a));

  IKey c = stringToPublicKey(publicKey.toString());
  String d = arrayToHex(c.data);
  print(d);

  // var awesome = InfraDID("http://localhost:8888");
  // print('awesome: ${awesome.defaultPubKeyDidSignDataPrefix}');
}
