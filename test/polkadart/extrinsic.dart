import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/did.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/sp_runtime/multiaddress/multi_address.dart';
import 'package:polkadart/apis/apis.dart';
import 'package:polkadart/multisig/multisig_base.dart';
import 'package:polkadart/polkadart.dart'
    show
        AuthorApi,
        ExtrinsicPayload,
        Provider,
        SignatureType,
        SigningPayload,
        StateApi;
import 'package:polkadart/scale_codec.dart';
import 'package:ss58/ss58.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart';

void main() async {
  final mnemonic = "//Alice";

  final sr25519Wallet = await KeyPair.sr25519.fromMnemonic(mnemonic);
  print('Sr25519 Wallet: ${sr25519Wallet.address}');

  final provider =
      Provider.fromUri(Uri.parse('wss://did.stage.infrablockspace.net'));
  final api = Did(provider);

  // Get info necessary to build an extrinsic
  final stateApi = StateApi(provider);
  final runtimeVersion = await stateApi.getRuntimeVersion();
  final specVersion = runtimeVersion.specVersion;
  final transactionVersion = runtimeVersion.transactionVersion;
  final block = await provider.send('chain_getBlock', []);
  final blockNumber = int.parse(block.result['block']['header']['number']);
  print('Block Number: $blockNumber');

  final blockHash = (await provider.send('chain_getBlockHash', []))
      .result
      .replaceAll('0x', '');
  final genesisHash = (await provider.send('chain_getBlockHash', [0]))
      .result
      .replaceAll('0x', '');
  print('Block Hash: $blockHash');
  print('Genesis Hash: $genesisHash');

  // Initiate Author Api
  final author = AuthorApi(provider);

  var pubkey =
      Address.decode("13sAakEWhVJE9YVCKNGpvcFycgdD5UyUPjK9hvScxCqN9fpd").pubkey;
  final runtimeCall = api.tx.balances.transferKeepAlive(
      dest: $MultiAddress().id(pubkey), value: BigInt.from(100000000));
  final encodeCall = runtimeCall.encode();
  print("encodeCall:$encodeCall");
  print(encodeCall.toHex().split("0x")[0]);
  final nonce =
      await SystemApi(provider).accountNextIndex(sr25519Wallet.address);
  print("nonce:$nonce");
  final registry = await stateApi.getMetadata();

  SigningPayload payloadSign = SigningPayload(
    method: encodeCall,
    specVersion: specVersion,
    transactionVersion: transactionVersion,
    genesisHash: genesisHash,
    blockHash: blockHash,
    blockNumber: blockNumber,
    eraPeriod: 64,
    tip: 0,
    nonce: nonce,
    customSignedExtensions: <String, dynamic>{
      'ChargeSystemToken': {
        'tip': BigInt.zero,
        "vote_candidate": Option.none(),
        "system_token_id": Option.none()
      }, // A custom Signed Extensions
    },
  );

  // Build payload and sign with sr25519 wallet
  final srPayload = payloadSign.encode(registry.chainInfo.scaleCodec.registry);
  print('Payload: ${hex.encode(srPayload)}');

  final srSignature = sr25519Wallet.sign(srPayload);
  print('Signature: ${hex.encode(srSignature)}');

  // Build extrinsic with sr25519 wallet
  final srExtrinsic = ExtrinsicPayload(
    signer: Uint8List.fromList(sr25519Wallet.bytes()),
    method: encodeCall,
    signature: srSignature,
    eraPeriod: 64,
    blockNumber: blockNumber,
    nonce: nonce,
    tip: 0,
    customSignedExtensions: <String, dynamic>{
      'ChargeSystemToken': {
        'tip': BigInt.zero,
        "vote_candidate": Option.none(),
        "system_token_id": Option.none()
      }, // A custom Signed Extensions
    },
  ).encode(registry.chainInfo.scaleCodec.registry, SignatureType.sr25519);
  print('sr25519 wallet extrinsic: ${hex.encode(srExtrinsic)}');

  final srHash = await author.submitExtrinsic(srExtrinsic);
  print('Sr25519 extrinsic hash: ${hex.encode(srHash)}');
}
