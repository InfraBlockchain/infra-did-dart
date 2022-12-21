import 'package:eosdart/eosdart.dart';
import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:eosdart_ecc/eosdart_ecc.dart';

Future<void> main() async {
  // EOSPrivateKey privateKey = EOSPrivateKey.fromString(
  //     'PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V');

  // // Get the related EOS public key
  // EOSPublicKey publicKey = privateKey.toEOSPublicKey();
  // // Print the EOS public key
  // print(publicKey.toString());

  // IKey a = binToPrivateKey(
  //     "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
  // String b = arrayToHex(a.data);
  // print(b);

  // print(privateKeyToBin(a));

  // IKey c = stringToPublicKey(publicKey.toString());
  // String d = arrayToHex(c.data);
  // print(d);

  var awesome = InfraDID(
      "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
      "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
      "infradidregi",
      "https://hyperion-t1.bc-labs.net");

  print(await awesome.getNonceForPubKeyDid());

  // EOSClient client = EOSClient('https://eos.greymass.com', 'v1');

  // Get Tables
  // List<Map<String, dynamic>> a =
  //     await client.getTableRows('eosio', 'eosio', 'abihash');
  // print(a[0]['hash']);
}
