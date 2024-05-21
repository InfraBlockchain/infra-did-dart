import 'dart:convert';
import 'dart:typed_data';

import 'package:infra_did_dart/src/infra_ss58_did/chain/did.dart';
import 'package:infra_did_dart/src/infra_ss58_did/generated/did/did.dart';
import 'package:infra_did_dart/src/infra_ss58_did/model/infra_ss58_did_document.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/key_convert.dart';
import 'package:polkadart/polkadart.dart';
import 'package:ss58/ss58.dart';

import '../model/did/onchain_did_detail.dart';
import '../model/did/verification_relationship.dart';

class InfraSS58DIDResolver {
  late Provider provider;
  late StateApi stateApi;
  late Did api;

  InfraSS58DIDResolver(String chainEndpoint) {
    provider = Provider.fromUri(Uri.parse(chainEndpoint));
    stateApi = StateApi(provider);
    api = Did(provider);
  }

  static InfraSS58DIDDocument resolveDefaultDocument(String did) {
    final publicKey = publicKeyFromAddress(did.split(":").last);

    return InfraSS58DIDDocument(
      context: ["https://www.w3.org/ns/did/v1"],
      id: did,
      controller: [did],
      verificationMethod: [
        VerificationMethod(
            id: did + "#key-1",
            controller: did,
            type: "Ed25519VerificationKey2018",
            publicKeyBase58: base58FromEd25519PublicKey(publicKey)),
        VerificationMethod(
            id: did + "#key-2",
            controller: did,
            type: "Ed25519VerificationKey2020",
            publicKeyMultibase: multibaseFromEd25519PublicKey(publicKey)),
        VerificationMethod(
            id: did + "#key-3",
            controller: did,
            type: "JsonWebKey2020",
            publicKeyJwk: ed25519JwkFromEd25519PublicKey(publicKey, "key-3")),
        VerificationMethod(
            id: did + "#key-4",
            controller: did,
            type: "JsonWebKey2020",
            publicKeyJwk: x25519JwkFromEd25519PublicKey(publicKey, "key-4"))
      ],
      authentication: [did + "#key-1", did + "#key-2", did + "#key-3"],
      assertionMethod: [did + "#key-1", did + "#key-2", did + "#key-3"],
      keyAgreement: [did + "#key-4"],
      capabilityInvocation: [did + "#key-1", did + "#key-2", did + "#key-3"],
      service: [],
    );
  }

  Future<InfraSS58DIDDocument> resolve(String did) async {
    String address = did.split(":").last;
    List<int> publicKey = publicKeyFromAddress(address);

    OnchainDIDDetail didDetails = await getOnchainDIDDetail(api, publicKey);

    List<String> controllers = [];
    if (didDetails.onChain.data.activeControllers > 0) {
      final controllerPrefix =
          await api.query.dIDModule.didControllersMapPrefix(publicKey);
      final cnts =
          await api.rpc.state.getKeysPaged(key: controllerPrefix, count: 100);
      for (var cnt in cnts) {
        controllers.add("did:infra:01:" +
            Address(prefix: 42, pubkey: cnt.sublist(cnt.length - 32)).encode());
      }
    }

    List<Service> services = [];
    final servicesPrefix =
        await api.query.dIDModule.didServiceEndpointsMapPrefix(publicKey);
    final svs =
        await api.rpc.state.getKeysPaged(key: servicesPrefix, count: 100);
    for (var sv in svs) {
      Uint8List serviceId = sv.sublist(sv.length - 65);
      final serviceEndpoint =
          await api.query.dIDModule.didServiceEndpoints(publicKey, serviceId);
      if (serviceEndpoint != null) {
        List<String> endpoints = [];
        for (var endpoint in serviceEndpoint.toJson()["origins"]) {
          endpoints.add(utf8.decode(endpoint));
        }
        services.add(Service(
          id: utf8.decode(serviceId),
          type: "LinkedDomains",
          serviceEndpoint: endpoints,
        ));
      }
    }

    List<VerificationMethod> verificationMethods = [];
    List<String> authentications = [];
    List<String> assertionMethods = [];
    List<String> keyAgreements = [];
    List<String> capabilityInvocations = [];

    final keysPrefix = await api.query.dIDModule.didKeysMapPrefix(publicKey);
    final keys = await api.rpc.state.getKeysPaged(key: keysPrefix, count: 100);
    int keyNumber = 1;
    for (var k in keys) {
      Uint8List keyIdArray = k.sublist(k.length - 4);
      ByteData byteData = ByteData.sublistView(keyIdArray);
      int keyId = byteData.getUint32(0, Endian.little);

      final key = await api.query.dIDModule.didKeys(publicKey, keyId);
      if (key != null) {
        final keyJson = key.toJson();
        final publicKey = keyJson["publicKey"];
        var verRels = VerificationRelationship(keyJson["verRels"]);

        if (publicKey["Ed25519"] != null) {
          verificationMethods.add(VerificationMethod(
              id: did + "#key-" + keyNumber.toString(),
              controller: did,
              type: "Ed25519VerificationKey2018",
              publicKeyBase58:
                  base58FromEd25519PublicKey(publicKey["Ed25519"])));
          verificationMethods.add(VerificationMethod(
              id: did + "#key-" + (keyNumber + 1).toString(),
              controller: did,
              type: "Ed25519VerificationKey2020",
              publicKeyMultibase:
                  multibaseFromEd25519PublicKey(publicKey["Ed25519"])));
          verificationMethods.add(VerificationMethod(
              id: did + "#key-" + (keyNumber + 2).toString(),
              controller: did,
              type: "JsonWebKey2020",
              publicKeyJwk: ed25519JwkFromEd25519PublicKey(
                  publicKey["Ed25519"], "key-" + (keyNumber + 2).toString())));
          if (verRels.isAssertion()) {
            assertionMethods.add(did + "#key-" + keyNumber.toString());
            assertionMethods.add(did + "#key-" + (keyNumber + 1).toString());
            assertionMethods.add(did + "#key-" + (keyNumber + 2).toString());
          }
          if (verRels.isAuthentication()) {
            authentications.add(did + "#key-" + keyNumber.toString());
            authentications.add(did + "#key-" + (keyNumber + 1).toString());
            authentications.add(did + "#key-" + (keyNumber + 2).toString());
          }
          if (verRels.isCapabilityInvocation()) {
            capabilityInvocations.add(did + "#key-" + keyNumber.toString());
            capabilityInvocations
                .add(did + "#key-" + (keyNumber + 1).toString());
            capabilityInvocations
                .add(did + "#key-" + (keyNumber + 2).toString());
          }
          keyNumber += 3;
        }
        if (publicKey["X25519"] != null) {
          verificationMethods.add(VerificationMethod(
              id: did + "#key-" + keyNumber.toString(),
              controller: did,
              type: "JsonWebKey2020",
              publicKeyJwk: x25519JwkFromEd25519PublicKey(
                  publicKey["X25519"], "key-" + keyNumber.toString())));
          if (verRels.isKeyAgreement()) {
            keyAgreements.add(did + "#key-" + keyNumber.toString());
          }
          keyNumber += 1;
        }
      }
    }

    return InfraSS58DIDDocument(
      context: ["https://www.w3.org/ns/did/v1"],
      id: did,
      controller: controllers,
      verificationMethod: verificationMethods,
      authentication: authentications,
      assertionMethod: assertionMethods,
      keyAgreement: keyAgreements,
      capabilityInvocation: capabilityInvocations,
      service: services,
    );
  }
}
