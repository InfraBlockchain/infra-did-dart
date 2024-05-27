import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart' show hex;
import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:infra_did_dart/src/infra_ss58_did/chain/did.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/AddBlob/add_blob.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/Blob/blob.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/chain.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/key_convert.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/StateChange/state_change.dart'
    as state_change;
import 'package:infra_did_dart/src/infra_ss58_did/util/util.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart' as keyring;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/SigValue/sig_value.dart'
    as sig_value;

import '../generated/did/types/DidSignature/did_signature_3.dart';

writeSchemaOnChainByBlob(
    InfraSS58DID infraSS58DID, Map<String, dynamic> blobSchema) async {
  final api = infraSS58DID.api;
  String address = infraSS58DID.didSet.did.split(":").last;
  List<int> hexDID = publicKeyFromAddress(address);

  final didDetails = await getOnchainDIDDetail(api, hexDID);
  final nonce = didDetails.onChain.nonce;

  final addBlob = AddBlob(
      blob: Blob(
          blob: hex.decode(jsonToHex(blobSchema)),
          id: utf8.encode(blobSchema["id"])),
      nonce: nonce + 1);
  final stateMessage = state_change.AddBlob(addBlob);
  final controllerWallet = await keyring.KeyPair.ed25519
      .fromMnemonic(infraSS58DID.controllerMnemonic);

  final addBlobSig = DidSignature(
      did: hexDID,
      keyId: 1,
      sig: sig_value.Ed25519(controllerWallet.sign(stateMessage.encode())));

  final runtimeCall =
      await api.tx.blobStore.new_(blob: addBlob, signature: addBlobSig);
  return sendExtrinsic(infraSS58DID, runtimeCall);
}

getSchema(InfraSS58DID infraSS58DID, String blobId) {}
