import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart' show hex;
import 'package:cryptography/cryptography.dart';
import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:infra_did_dart/src/infra_ss58_did/chain/did.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/AddRegistry/add_registry.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/DidSignature/did_signature_2.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/DidSignatureWithNonce/did_signature_with_nonce.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/Policy/policy.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/Registry/registry.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/RemoveRegistryRaw/remove_registry_raw.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/RevokeRaw/revoke_raw.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/StateChange/state_change.dart'
    as state_change;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/SigValue/sig_value.dart'
    as sig_value;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/UnRevokeRaw/un_revoke_raw.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/WithNonce/with_nonce_1.dart'
    as with_nonce_1;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/WithNonce/with_nonce_2.dart'
    as with_nonce_2;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/WithNonce/with_nonce_3.dart'
    as with_nonce_3;
import 'package:infra_did_dart/src/infra_ss58_did/model/exception.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/chain.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/key_convert.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart' as keyring;

String createNewRegistryId() {
  final Random _random = Random.secure();
  final List<int> values = List<int>.generate(16, (i) => _random.nextInt(256));
  return hex.encode(values);
}

Future<String> getRevokeId(String vcId) async {
  final algorithm = Blake2b(hashLengthInBytes: 32);
  final hash = await algorithm.hash(hex.decode(vcId));

  return hex.encode(hash.bytes);
}

Future<String> registerRegistry(
    InfraSS58DID infraSS58DID, String id, bool addOnly) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final addRegistry = AddRegistry(
        id: hex.decode(id),
        newRegistry: Registry(addOnly: addOnly, policy: OneOf([hexDID])));

    final runtimeCall =
        await api.tx.revoke.newRegistry(addRegistry: addRegistry);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> revokeCredential(
    InfraSS58DID infraSS58DID, String registryId, String revokeId) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;
    final revoke = RevokeRaw(
        registryId: hex.decode(registryId), revokeIds: [hex.decode(revokeId)]);

    final stateMessage = state_change.Revoke(
        with_nonce_1.WithNonce(data: revoke, nonce: nonce + 1));
    final controllerWallet = await keyring.KeyPair.ed25519
        .fromMnemonic(infraSS58DID.controllerMnemonic);
    String jsonString = jsonEncode(stateMessage.toJson());
    List<int> utf8Bytes = utf8.encode(jsonString);
    Uint8List uint8List = Uint8List.fromList(utf8Bytes);

    final revokeSig = DidSignatureWithNonce(
        nonce: nonce + 1,
        sig: DidSignature(
            did: hexDID,
            keyId: 1,
            sig: sig_value.Ed25519(controllerWallet.sign(uint8List))));

    final runtimeCall =
        await api.tx.revoke.revoke(revoke: revoke, proof: [revokeSig]);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> unrevokeCredential(
    InfraSS58DID infraSS58DID, String registryId, String revokeId) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;
    final unrevoke = UnRevokeRaw(
        registryId: hex.decode(registryId), revokeIds: [hex.decode(revokeId)]);

    final stateMessage = state_change.UnRevoke(
        with_nonce_2.WithNonce(data: unrevoke, nonce: nonce + 1));
    final controllerWallet = await keyring.KeyPair.ed25519
        .fromMnemonic(infraSS58DID.controllerMnemonic);
    String jsonString = jsonEncode(stateMessage.toJson());
    List<int> utf8Bytes = utf8.encode(jsonString);
    Uint8List uint8List = Uint8List.fromList(utf8Bytes);

    final unrevokeSig = DidSignatureWithNonce(
        nonce: nonce + 1,
        sig: DidSignature(
            did: hexDID,
            keyId: 1,
            sig: sig_value.Ed25519(controllerWallet.sign(uint8List))));

    final runtimeCall =
        await api.tx.revoke.unrevoke(unrevoke: unrevoke, proof: [unrevokeSig]);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> unregisterRegistry(
    InfraSS58DID infraSS58DID, String registryId) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;
    final removeRegistry =
        RemoveRegistryRaw(registryId: hex.decode(registryId));

    final stateMessage = state_change.RemoveRegistry(
        with_nonce_3.WithNonce(data: removeRegistry, nonce: nonce + 1));
    final controllerWallet = await keyring.KeyPair.ed25519
        .fromMnemonic(infraSS58DID.controllerMnemonic);
    String jsonString = jsonEncode(stateMessage.toJson());
    List<int> utf8Bytes = utf8.encode(jsonString);
    Uint8List uint8List = Uint8List.fromList(utf8Bytes);

    final removeRegistrySig = DidSignatureWithNonce(
        nonce: nonce + 1,
        sig: DidSignature(
            did: hexDID,
            keyId: 1,
            sig: sig_value.Ed25519(controllerWallet.sign(uint8List))));

    final runtimeCall = await api.tx.revoke
        .removeRegistry(removal: removeRegistry, proof: [removeRegistrySig]);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

getRegistry(InfraSS58DID infraSS58DID, String registryId) async {
  final response =
      await infraSS58DID.api.query.revoke.registries(hex.decode(registryId));
  return response;
}

getIsRevoked(
    InfraSS58DID infraSS58DID, String registryId, String revokeId) async {
  final response = await infraSS58DID.api.query.revoke
      .revocations(hex.decode(registryId), hex.decode(revokeId));
  return response;
}
