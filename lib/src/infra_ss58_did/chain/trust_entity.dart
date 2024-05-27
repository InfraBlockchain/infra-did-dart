import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart' show hex;
import 'package:cryptography/cryptography.dart';
import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:infra_did_dart/src/infra_ss58_did/chain/did.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/AddAuthorizer/add_authorizer.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/AddIssuerRaw/add_issuer_raw.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/AddVerifierRaw/add_verifier_raw.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/DidSignature/did_signature_2.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/DidSignatureWithNonce/did_signature_with_nonce.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/Policy/policy.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/Authorizer/authorizer.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/RemoveAuthorizerRaw/remove_authorizer_raw.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/RemoveIssuerRaw/remove_issuer_raw.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/RemoveVerifierRaw/remove_verifier_raw.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/StateChange/state_change.dart'
    as state_change;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/SigValue/sig_value.dart'
    as sig_value;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/WithNonce/with_nonce_6.dart'
    as with_nonce_6;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/WithNonce/with_nonce_8.dart'
    as with_nonce_8;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/WithNonce/with_nonce_9.dart'
    as with_nonce_9;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/WithNonce/with_nonce_7.dart'
    as with_nonce_7;
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/types/WithNonce/with_nonce_10.dart'
    as with_nonce_10;
import 'package:infra_did_dart/src/infra_ss58_did/model/exception.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/chain.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/key_convert.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart' as keyring;

String createNewAuthorizerId() {
  final Random _random = Random.secure();
  final List<int> values = List<int>.generate(16, (i) => _random.nextInt(256));
  return hex.encode(values);
}

Future<String> getRevokeId(String vcId) async {
  final algorithm = Blake2b(hashLengthInBytes: 32);
  final hash = await algorithm.hash(hex.decode(vcId));

  return hex.encode(hash.bytes);
}

Future<String> registerAuthorizer(
    InfraSS58DID infraSS58DID, String id, bool addOnly) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final addAuthorizer = AddAuthorizer(
        id: hex.decode(id),
        newAuthorizer: Authorizer(addOnly: addOnly, policy: OneOf([hexDID])));

    final runtimeCall =
        await api.tx.trustedEntity.newAuthorizer(addAuthorizer: addAuthorizer);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> addIssuer(
    InfraSS58DID infraSS58DID, String authorizerId, String issuerDID) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;
    final addIssuer = AddIssuerRaw(
        authorizerId: hex.decode(authorizerId),
        entityIds: [hex.decode(issuerDID.split(":").last)]);

    final stateMessage = state_change.AddIssuer(
        with_nonce_6.WithNonce(data: addIssuer, nonce: nonce + 1));
    final controllerWallet = await keyring.KeyPair.ed25519
        .fromMnemonic(infraSS58DID.controllerMnemonic);

    final addIssuerSig = DidSignatureWithNonce(
        nonce: nonce + 1,
        sig: DidSignature(
            did: hexDID,
            keyId: 1,
            sig: sig_value.Ed25519(
                controllerWallet.sign(stateMessage.encode()))));

    final runtimeCall = await api.tx.trustedEntity
        .addIssuer(addIssuer: addIssuer, proof: [addIssuerSig]);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> removeIssuer(
    InfraSS58DID infraSS58DID, String authorizerId, String issuerDID) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;
    final removeIssuer = RemoveIssuerRaw(
        authorizerId: hex.decode(authorizerId),
        entityIds: [hex.decode(issuerDID)]);

    final stateMessage = state_change.RemoveIssuer(
        with_nonce_7.WithNonce(data: removeIssuer, nonce: nonce + 1));
    final controllerWallet = await keyring.KeyPair.ed25519
        .fromMnemonic(infraSS58DID.controllerMnemonic);

    final removeIssuerSig = DidSignatureWithNonce(
        nonce: nonce + 1,
        sig: DidSignature(
            did: hexDID,
            keyId: 1,
            sig: sig_value.Ed25519(
                controllerWallet.sign(stateMessage.encode()))));

    final runtimeCall = await api.tx.trustedEntity
        .removeIssuer(removeIssuer: removeIssuer, proof: [removeIssuerSig]);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> addVerifier(
    InfraSS58DID infraSS58DID, String authorizerId, String verifierDiD) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;
    final addVerifier = AddVerifierRaw(
        authorizerId: hex.decode(authorizerId),
        entityIds: [hex.decode(verifierDiD.split(":").last)]);

    final stateMessage = state_change.AddVerifier(
        with_nonce_8.WithNonce(data: addVerifier, nonce: nonce + 1));
    final controllerWallet = await keyring.KeyPair.ed25519
        .fromMnemonic(infraSS58DID.controllerMnemonic);

    final addVerifierSig = DidSignatureWithNonce(
        nonce: nonce + 1,
        sig: DidSignature(
            did: hexDID,
            keyId: 1,
            sig: sig_value.Ed25519(
                controllerWallet.sign(stateMessage.encode()))));

    final runtimeCall = await api.tx.trustedEntity
        .addVerifier(addVerifier: addVerifier, proof: [addVerifierSig]);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> removeVerifier(
    InfraSS58DID infraSS58DID, String authorizerId, String verifierDID) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;
    final removeVerifier = RemoveVerifierRaw(
        authorizerId: hex.decode(authorizerId),
        entityIds: [hex.decode(verifierDID)]);

    final stateMessage = state_change.RemoveVerifier(
        with_nonce_9.WithNonce(data: removeVerifier, nonce: nonce + 1));
    final controllerWallet = await keyring.KeyPair.ed25519
        .fromMnemonic(infraSS58DID.controllerMnemonic);

    final removeVerifierSig = DidSignatureWithNonce(
        nonce: nonce + 1,
        sig: DidSignature(
            did: hexDID,
            keyId: 1,
            sig: sig_value.Ed25519(
                controllerWallet.sign(stateMessage.encode()))));

    final runtimeCall = await api.tx.trustedEntity.removeVerifier(
        removeVerifier: removeVerifier, proof: [removeVerifierSig]);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

Future<String> unregisterAuthorizer(
    InfraSS58DID infraSS58DID, String authorizerId) async {
  try {
    final api = infraSS58DID.api;
    String address = infraSS58DID.didSet.did.split(":").last;
    List<int> hexDID = publicKeyFromAddress(address);

    final didDetails = await getOnchainDIDDetail(api, hexDID);
    final nonce = didDetails.onChain.nonce;
    final removeAuthorizer =
        RemoveAuthorizerRaw(authorizerId: hex.decode(authorizerId));

    final stateMessage = state_change.RemoveAuthorizer(
        with_nonce_10.WithNonce(data: removeAuthorizer, nonce: nonce + 1));
    final controllerWallet = await keyring.KeyPair.ed25519
        .fromMnemonic(infraSS58DID.controllerMnemonic);

    final removeAuthorizerSig = DidSignatureWithNonce(
        nonce: nonce + 1,
        sig: DidSignature(
            did: hexDID,
            keyId: 1,
            sig: sig_value.Ed25519(
                controllerWallet.sign(stateMessage.encode()))));

    final runtimeCall = await api.tx.trustedEntity.removeAuthorizer(
        removal: removeAuthorizer, proof: [removeAuthorizerSig]);
    return sendExtrinsic(infraSS58DID, runtimeCall);
  } catch (e) {
    throw InfraDIDException(1, e.toString());
  }
}

getAuthorizer(InfraSS58DID infraSS58DID, String authorizerId) async {
  final response = await infraSS58DID.api.query.trustedEntity
      .authorizers(hex.decode(authorizerId));
  return response;
}

getIssuers(
    InfraSS58DID infraSS58DID, String authorizerId, String issuerId) async {
  final response = await infraSS58DID.api.query.trustedEntity
      .issuers(hex.decode(authorizerId), hex.decode(issuerId));
  return response;
}

getVerifiers(
    InfraSS58DID infraSS58DID, String authorizerId, String verifierId) async {
  final response = await infraSS58DID.api.query.trustedEntity
      .verifiers(hex.decode(authorizerId), hex.decode(verifierId));
  return response;
}
