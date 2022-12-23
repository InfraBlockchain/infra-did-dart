import 'dart:typed_data';

import 'package:eosdart/eosdart.dart';
import 'package:eosdart_ecc/eosdart_ecc.dart';

class Resolver {
  String INFRA_DID_NONCE_VALUE_FOR_REVOKED_PUB_KEY_DID = "65535";

  String networkId;
  String registryContract;
  String rpcEndpoint;
  late EOSClient jsonRpc;

  Resolver(this.registryContract, this.networkId, this.rpcEndpoint) {
    jsonRpc = EOSClient(rpcEndpoint, 'v1');
  }

  Future<Map> resolve(String did) async {
    List<String> splitId = did.split(":");
    if (splitId.length != 4) {
      return {
        "didResolutionMetadata": {
          "error": "invalidDid",
          "message":
              "invalid did, needs network identifier part and id part ($did)"
        },
        "didDocument": null,
        "didDocumentMetadata": {}
      };
    }

    String network = splitId[2];
    String idInNetwork = splitId[3];

    if (network != networkId) {
      return {
        "didResolutionMetadata": {
          "error": "unknownNetwork",
          "message":
              "no chain network configured for network identifier ${network[0]}"
        },
        "didDocument": null,
        "didDocumentMetadata": {}
      };
    }

    Map result = {};
    Map didResolutionMetadata = {"contentType": "application/did+ld+json"};
    Map resolveNetwork = {};

    if (idInNetwork.startsWith("PUB_K1_") ||
        idInNetwork.startsWith("PUB_R1_") ||
        idInNetwork.startsWith("EOS")) {
      resolveNetwork = await _resolvePubKeyDID(did, idInNetwork);
    } else {
      resolveNetwork = await _resolveAccountDID(did, idInNetwork);
    }

    result["didDocument"] = resolveNetwork;
    result["didResolutionMetadata"] = didResolutionMetadata;

    return result;
  }

  Future<Map> _resolvePubKeyDID(String did, String didPubKey) async {
    if (!didPubKey.startsWith("PUB_K1_")) {
      throw UnsupportedError('unsupported public key type');
    }
    EOSPublicKey eosPublicKey = EOSPublicKey.fromString(didPubKey);

    IKey publicKey = stringToPublicKey(eosPublicKey.toString());
    Uint8List sliceKey = publicKey.data.sublist(1, publicKey.data.length);
    String sliceKeyHex = arrayToHex(sliceKey);

    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        registryContract, registryContract, 'pubkeydid',
        lower: sliceKeyHex,
        upper: sliceKeyHex,
        indexPosition: 2,
        keyType: "sha256");

    List<Map> pkDidAttr = [];
    bool deactivated = false;
    String ownerPubKey = didPubKey;

    if (rows.isNotEmpty) {
      var pubKeyDidRow = rows[0];
      pkDidAttr = pubKeyDidRow["attr"];
      if (pubKeyDidRow["nonce"] ==
          INFRA_DID_NONCE_VALUE_FOR_REVOKED_PUB_KEY_DID) {
        deactivated = true;
      }

      List<Map<String, dynamic>> resPubKeyDIDOwner = await jsonRpc.getTableRows(
          registryContract, registryContract, 'pkdidowner',
          lower: pubKeyDidRow["pkid"],
          upper: pubKeyDidRow["pkid"],
          indexPosition: 1,
          keyType: "i64");

      if (resPubKeyDIDOwner.length > 0 &&
          resPubKeyDIDOwner[0]["pkid"] == pubKeyDidRow["pkid"]) {
        var pubKeyDIDOwnerRow = resPubKeyDIDOwner[0];
        ownerPubKey = pubKeyDIDOwnerRow["owner_pk"];
      }
    }

    return _wrapDidDocument(did, ownerPubKey, pkDidAttr, deactivated);
  }

  Future<Map> _resolveAccountDID(String did, String didAccount) async {
    String activeKeyStr = "null";
    Account account = await jsonRpc.getAccount(didAccount);
    List<Permission> permissions = account.permissions!;
    for (Permission permission in permissions) {
      if (permission.permName == "active") {
        activeKeyStr = permission.requiredAuth!.keys![0].key!;
        break;
      }
    }

    if (!activeKeyStr.startsWith("PUB_K1_")) {
      throw UnsupportedError('unsupported public key type');
    }

    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        registryContract, registryContract, 'accdidattr',
        lower: didAccount, upper: didAccount, indexPosition: 1, keyType: "i64");

    List<Map> accDidAttr = [];
    bool deactivated = false;

    if (rows.isNotEmpty) {
      accDidAttr = rows[0]["attr"];
    }

    return _wrapDidDocument(did, activeKeyStr, accDidAttr, deactivated);
  }

  Map _wrapDidDocument(String did, String controllerPubKey, List<Map> didAttr,
      bool deactivated) {
    Map result = {};
    if (deactivated == true) {
      result["deactivated"] = true;
    } else {
      result["@context"] = "https://www.w3.org/ns/did/v1";
      result["id"] = did;

      EOSPublicKey eosPublicKey = EOSPublicKey.fromString(controllerPubKey);
      IKey publicKey = stringToPublicKey(eosPublicKey.toString());
      String keyHex = arrayToHex(publicKey.data);

      Map verificationMethods = {};
      verificationMethods["id"] = "$did#controller";
      verificationMethods["type"] = "EcdsaSecp256k1VerificationKey2019";
      verificationMethods["controller"] = did;
      verificationMethods["publicKeyHex"] = keyHex;

      List<String> authentication = [];
      authentication.add("${did}#controller");

      List<Map> serviceEndpoints = [];
      List<Map> attrs = didAttr;
      int i = 0;
      for (Map attr in attrs) {
        String value = attr["value"];
        String key = attr["key"];
        var split = key.split("/");
        if (split.length > 1) {
          String attrType = split[0];
          if (attrType == "svc") {
            Map serviceEndpoint = {};
            serviceEndpoint["id"] = "${did}service-${i + 1}";
            serviceEndpoint["type"] =
                split.length > 1 ? split[1] : "AgentService";
            serviceEndpoint["serviceEndpoint"] = value;
            serviceEndpoints.add(serviceEndpoint);
          }
        }
        i++;
      }

      result["verificationMethods"] = verificationMethods;
      result["authentication"] = authentication;
      result["service"] = serviceEndpoints;
    }
    return result;
  }
}
