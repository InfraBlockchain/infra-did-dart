import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/did_runtime/runtime_call.dart';
import 'package:polkadart/apis/apis.dart';
import 'package:polkadart/extrinsic/extrinsic_payload.dart';
import 'package:polkadart/extrinsic/signature_type.dart';
import 'package:polkadart/extrinsic/signing_payload.dart';
import 'package:polkadart/scale_codec.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import '../../../infra_did_dart.dart';

Future<String> sendExtrinsic(
  InfraSS58DID infraSS58DID,
  RuntimeCall runtimeCall,
) async {
  final encodeCall = runtimeCall.encode();
  final controllerWallet =
      await KeyPair.sr25519.fromMnemonic(infraSS58DID.controllerMnemonic);

  final runtimeVersion = await infraSS58DID.stateApi.getRuntimeVersion();
  final specVersion = runtimeVersion.specVersion;
  final transactionVersion = runtimeVersion.transactionVersion;
  final block = await infraSS58DID.provider.send('chain_getBlock', []);
  final blockNumber = int.parse(block.result['block']['header']['number']);
  final blockHash = (await infraSS58DID.provider.send('chain_getBlockHash', []))
      .result
      .replaceAll('0x', '');
  final genesisHash =
      (await infraSS58DID.provider.send('chain_getBlockHash', [0]))
          .result
          .replaceAll('0x', '');

  final nonce = await SystemApi(infraSS58DID.provider)
      .accountNextIndex(controllerWallet.address);
  final registry = await infraSS58DID.stateApi.getMetadata();

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

  final edSignature = controllerWallet.sign(srPayload);

  // Build extrinsic with sr25519 wallet
  final srExtrinsic = ExtrinsicPayload(
    signer: Uint8List.fromList(controllerWallet.bytes()),
    method: encodeCall,
    signature: edSignature,
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

  final author = AuthorApi(infraSS58DID.provider);
  final hash = await author.submitExtrinsic(srExtrinsic);
  return hex.encode(hash);
}
