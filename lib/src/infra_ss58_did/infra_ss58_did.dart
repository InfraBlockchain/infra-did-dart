import 'package:convert/convert.dart' show hex;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/did.dart';
import 'package:infra_did_dart/src/infra_ss58_did/model/exception.dart';
import 'package:infra_did_dart/src/infra_ss58_did/model/infra_ss58_did_set.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/util.dart';
import 'package:polkadart/polkadart.dart';
import 'package:substrate_bip39/substrate_bip39.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart';

class InfraSS58DID {
  late String chainEndpoint;
  late Provider provider;
  late Did api;
  late StateApi stateApi;
  late InfraSS58DIDSet didSet;
  late String controllerDID;
  late String controllerMnemonic;
  late String? txfeePayerAccountSeed;

  InfraSS58DID(
      {required this.chainEndpoint,
      required this.didSet,
      required this.controllerDID,
      required this.controllerMnemonic,
      this.txfeePayerAccountSeed}) {
    provider = Provider.fromUri(Uri.parse(this.chainEndpoint));
    api = Did(provider);
    stateApi = StateApi(provider);
  }

  static Future<InfraSS58DIDSet> generateSS58DID(String networkId) async {
    try {
      Mnemonic mnemonic = CryptoScheme.generate();

      String phrase = mnemonic.words.join(' ');
      String seed =
          hex.encode(await SubstrateBip39.ed25519.seedFromUri(phrase));
      final ed25519Wallet = await KeyPair.ed25519.fromMnemonic(phrase);
      final did = ss58AddressToDID(ed25519Wallet.address, networkId);

      return InfraSS58DIDSet(
          address: ed25519Wallet.address,
          seed: seed,
          did: did,
          mnemonic: phrase);
    } catch (e) {
      throw InfraDIDException(1, e.toString());
    }
  }

  static Future<InfraSS58DIDSet> generateSS58DIDFromPhrase(
      String suri, String networkId) async {
    try {
      String seed = hex.encode(await SubstrateBip39.ed25519.seedFromUri(suri));
      final ed25519Wallet = await KeyPair.ed25519.fromMnemonic(suri);
      final did = ss58AddressToDID(ed25519Wallet.address, networkId);

      return InfraSS58DIDSet(
          address: ed25519Wallet.address, seed: seed, did: did, mnemonic: suri);
    } catch (e) {
      throw InfraDIDException(1, e.toString());
    }
  }
}
