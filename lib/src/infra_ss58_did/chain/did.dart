import 'dart:convert';
import 'package:convert/convert.dart' show hex;

import 'package:infra_did_dart/src/infra_ss58_did/generated/did/did.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/AddControllers/add_controllers.dart'
    as add_controllers;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/AddKeys/add_keys.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/AddServiceEndpoint/add_service_endpoint.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/DidRemoval/did_removal.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/RemoveControllers/remove_controllers.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/RemoveKeys/remove_keys.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/RemoveServiceEndpoint/remove_service_endpoint.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/ServiceEndpoint/service_endpoint.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/SigValue/sig_value.dart'
    as sig_value;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/StateChange/state_change.dart'
    as state_change;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/UncheckedDidKey/unchecked_did_key.dart';
import 'package:infra_did_dart/src/infra_ss58_did/model/did/did_key.dart';
import 'package:infra_did_dart/src/infra_ss58_did/model/did/onchain_did_detail.dart';
import 'package:infra_did_dart/src/infra_ss58_did/model/did/service_endpoint_type.dart';
import 'package:infra_did_dart/src/infra_ss58_did/model/exception.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/chain.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/key_convert.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart';

import '../../../infra_did_dart.dart';
import '../generated/did/types/DidSignature/did_signature_1.dart';
import '../generated/did/types/PublicKey/public_key.dart';

Future<OnchainDIDDetail> getOnchainDIDDetail(Did api, List<int> hexDid) async {
  final didDetails = await api.query.dIDModule.dids(hexDid);
  if (didDetails != null) {
    return OnchainDIDDetail.fromJson(didDetails.toJson());
  } else {
    throw InfraDIDException(1, "Onchain DID not exist");
  }
}

Future<String> registerDIDOnChain(InfraSS58DID infraSS58DID) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);
    List<int> x25519PublicKey = x25519PublicKeyFromEd25519PublicKey(hexDID);

    UncheckedDidKey key1 =
        UncheckedDidKey(publicKey: $PublicKey().ed25519(hexDID), verRels: 7);
    UncheckedDidKey key2 = UncheckedDidKey(
        publicKey: $PublicKey().x25519(x25519PublicKey), verRels: 8);

    final runtimeCall = await api.tx.dIDModule
        .newOnchain(did: hexDID, keys: [key1, key2], controllers: [hexDID]);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> unregisterDIDOnChain(InfraSS58DID infraSS58DID) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;

    final didRemoval = DidRemoval(did: hexDID, nonce: nonce + 1);
    final stateMessage = state_change.DidRemoval(didRemoval);
    final controllerWallet =
        await KeyPair.ed25519.fromMnemonic(infraSS58DID.controllerMnemonic);

    final removeOnchainSig = DidSignature(
        did: hexDID,
        keyId: 1,
        sig: sig_value.Ed25519(controllerWallet.sign(stateMessage.encode())));

    final runtimeCall = await api.tx.dIDModule
        .removeOnchainDid(removal: didRemoval, sig: removeOnchainSig);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> addControllers(
    InfraSS58DID infraSS58DID, List<String> controllers) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;

    List<List<int>> cnts = [];
    for (var controller in controllers) {
      cnts.add(publicKeyFromAddress(controller));
    }

    final addControllers = add_controllers.AddControllers(
        did: hexDID, controllers: cnts, nonce: nonce + 1);
    final stateMessage = state_change.AddControllers(addControllers);
    final controllerWallet =
        await KeyPair.ed25519.fromMnemonic(infraSS58DID.controllerMnemonic);

    final controllerDIDsig = DidSignature(
        did: hexDID,
        keyId: 1,
        sig: sig_value.Ed25519(controllerWallet.sign(stateMessage.encode())));

    final runtimeCall = await api.tx.dIDModule
        .addControllers(controllers: addControllers, sig: controllerDIDsig);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> removeControllers(
    InfraSS58DID infraSS58DID, List<String> controllers) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;

    List<List<int>> cnts = [];
    for (var controller in controllers) {
      cnts.add(publicKeyFromAddress(controller));
    }

    final removeControllers =
        RemoveControllers(did: hexDID, controllers: cnts, nonce: nonce + 1);
    final stateMessage = state_change.RemoveControllers(removeControllers);
    final controllerWallet =
        await KeyPair.ed25519.fromMnemonic(infraSS58DID.controllerMnemonic);

    final removeControllerSig = DidSignature(
        did: hexDID,
        keyId: 1,
        sig: sig_value.Ed25519(controllerWallet.sign(stateMessage.encode())));

    final runtimeCall = await api.tx.dIDModule.removeControllers(
        controllers: removeControllers, sig: removeControllerSig);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> addKeys(InfraSS58DID infraSS58DID, List<DIDKey> didKeys) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;

    List<UncheckedDidKey> keys = [];
    for (var didKey in didKeys) {
      if (didKey.verRels == 8) {
        keys.add(UncheckedDidKey(
            publicKey: $PublicKey().x25519(didKey.publicKey),
            verRels: didKey.verRels));
      } else {
        keys.add(UncheckedDidKey(
            publicKey: $PublicKey().ed25519(didKey.publicKey),
            verRels: didKey.verRels));
      }
    }

    final addKeys = AddKeys(did: hexDID, keys: keys, nonce: nonce + 1);
    final stateMessage = state_change.AddKeys(addKeys);
    final controllerWallet =
        await KeyPair.ed25519.fromMnemonic(infraSS58DID.controllerMnemonic);

    final addKeysSig = DidSignature(
        did: hexDID,
        keyId: 1,
        sig: sig_value.Ed25519(controllerWallet.sign(stateMessage.encode())));

    final runtimeCall =
        await api.tx.dIDModule.addKeys(keys: addKeys, sig: addKeysSig);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> removeKeys(InfraSS58DID infraSS58DID, List<int> keyIds) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;

    final removeKeys = RemoveKeys(did: hexDID, keys: keyIds, nonce: nonce + 1);
    final stateMessage = state_change.RemoveKeys(removeKeys);
    final controllerWallet =
        await KeyPair.ed25519.fromMnemonic(infraSS58DID.controllerMnemonic);

    final removeKeysSig = DidSignature(
        did: hexDID,
        keyId: 1,
        sig: sig_value.Ed25519(controllerWallet.sign(stateMessage.encode())));

    final runtimeCall =
        await api.tx.dIDModule.removeKeys(keys: removeKeys, sig: removeKeysSig);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> addServiceEndpoint(
  InfraSS58DID infraSS58DID,
  List<String> originsTexts, {
  ServiceEndpointType? endpointType,
  String? endpointIdText,
}) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;

    if (endpointIdText == null)
      endpointIdText = infraSS58DID.didSet.did + "#linked-domain";
    if (endpointType == null) {
      endpointType = new ServiceEndpointType(1);
    }

    final origins = originsTexts.map((origin) => utf8.encode(origin)).toList();
    final endpoint =
        ServiceEndpoint(origins: origins, types: endpointType.value);

    final addServiceEndpoint = AddServiceEndpoint(
        did: hexDID,
        id: utf8.encode(endpointIdText),
        endpoint: endpoint,
        nonce: nonce + 1);
    final stateMessage = state_change.AddServiceEndpoint(addServiceEndpoint);
    final controllerWallet =
        await KeyPair.ed25519.fromMnemonic(infraSS58DID.controllerMnemonic);

    final addServiceEndpointSig = DidSignature(
        did: hexDID,
        keyId: 1,
        sig: sig_value.Ed25519(controllerWallet.sign(stateMessage.encode())));

    final runtimeCall = await api.tx.dIDModule.addServiceEndpoint(
        serviceEndpoint: addServiceEndpoint, sig: addServiceEndpointSig);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> removeServiceEndpoint(
  InfraSS58DID infraSS58DID, {
  String? endpointIdText,
}) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;

    if (endpointIdText == null)
      endpointIdText = infraSS58DID.didSet.did + "#linked-domain";

    final removeServiceEndpoint = RemoveServiceEndpoint(
        did: hexDID, id: utf8.encode(endpointIdText), nonce: nonce + 1);
    final stateMessage =
        state_change.RemoveServiceEndpoint(removeServiceEndpoint);
    final controllerWallet =
        await KeyPair.ed25519.fromMnemonic(infraSS58DID.controllerMnemonic);

    final removeServiceEndpointSig = DidSignature(
        did: hexDID,
        keyId: 1,
        sig: sig_value.Ed25519(controllerWallet.sign(stateMessage.encode())));

    final runtimeCall = await api.tx.dIDModule.removeServiceEndpoint(
        serviceEndpoint: removeServiceEndpoint, sig: removeServiceEndpointSig);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}
