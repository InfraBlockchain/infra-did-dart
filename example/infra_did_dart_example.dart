import 'package:eosdart/eosdart.dart';
import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:eosdart_ecc/eosdart_ecc.dart';

Future<void> main() async {
  // EOSPrivateKey privateKey = EOSPrivateKey.fromString(
  //     '5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3');

  // // Get the related EOS public key
  // EOSPublicKey publicKey = privateKey.toEOSPublicKey();
  // // Print the EOS public key
  // print(publicKey.toString());

  // IKey a =
  //     binToPrivateKey("5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3");
  // String b = arrayToHex(a.data);
  // print(b);

  // print(privateKeyToBin(a));

  // IKey c = stringToPublicKey(publicKey.toString());
  // String d = arrayToHex(c.data);
  // print(d);

  var awesome = InfraDID(
      "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
      "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
      "fmapkumrotfc",
      "http://localhost:8888",
      "fmapkumrotfc",
      "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");

  // print(await awesome.getNonceForPubKeyDid());
  // print(await awesome.getTrustedAccountDID("qwexfhmvvdci", "fmapkumrotfc"));
  // print(await awesome.getTrustedPubKeyDID("qwexfhmvvdci",
  //     "PUB_K1_584qGNgteYFppoisbDz6vBFArrw3As8qeeRCekLepG4pJVrhJt"));
  await awesome.setAttributePubKeyDID("fmapkumrotfc", "fmapkumrotfc");

  // print(encodeName("eosio"));
  // BigInt authorizerIndex = BigInt.from(encodeName("eosio"));
  // BigInt nameIndex = BigInt.from(encodeName("eosio"));
  // BigInt index = authorizerIndex * BigInt.from(2).pow(64) + nameIndex;
  // print(index.toString());
  // EOSClient client = EOSClient('https://eos.greymass.com', 'v1');

  // Get Tables
  // List<Map<String, dynamic>> a =
  //     await client.getTableRows('eosio', 'eosio', 'abihash');
  // print(a[0]['hash']);
}
