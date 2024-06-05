import 'package:infra_did_dart/src/infra_ss58_did/generated/did/did.dart';
import 'package:polkadart/polkadart.dart' show Provider;
import 'package:polkadart_keyring/polkadart_keyring.dart';

void main() async {
  final mnemonic = "//Alice";

  final sr25519Wallet = await KeyPair.sr25519.fromMnemonic(mnemonic);
  print('Sr25519 Wallet: ${sr25519Wallet.address}');

  final provider =
      Provider.fromUri(Uri.parse('wss://did.stage.infrablockspace.net'));
  final api = Did(provider);

  var data = await api.query.balances.account(sr25519Wallet.bytes());
  print(data.toJson());
}
