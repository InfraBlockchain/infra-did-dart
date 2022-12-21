import 'dart:typed_data';

import 'package:eosdart/eosdart.dart';
import 'package:eosdart_ecc/eosdart_ecc.dart';

import '../infra_did_dart.dart';

class InfraDID {
  String defaultPubKeyDidSignDataPrefix = "infra-mainnet";
  late String registryContract;
  late String didPubKey;
  late String didAccount;
  late String did;
  late EOSClient jsonRpc;
  late String txfeePayerAccount;
  late List<String> sigProviderPrivKeys;
  late String didOwnerPrivateKeyObj;

  InfraDID(this.did, String didOwnerPrivateKey, this.registryContract,
      String rpcEndpoint,
      [String txfeePayerAccount = "",
      String txfeePayerPricateKey = "",
      String pubKeyDidSignDataPrefix = ""]) {
    defaultPubKeyDidSignDataPrefix = pubKeyDidSignDataPrefix.isEmpty
        ? "infra-mainnet"
        : pubKeyDidSignDataPrefix;

    txfeePayerAccount = txfeePayerAccount.isEmpty ? "" : txfeePayerAccount;

    sigProviderPrivKeys = txfeePayerPricateKey.isNotEmpty
        ? [txfeePayerPricateKey, didOwnerPrivateKey]
        : [didOwnerPrivateKey];

    jsonRpc = EOSClient(rpcEndpoint, 'v1', privateKeys: sigProviderPrivKeys);
    List<String> splitedDID = did.split(":");
    assert(splitedDID.length != 4, "Wrong DID format");
    String idNetwork = splitedDID[3];
    if (idNetwork.startsWith("PUB_K1") ||
        idNetwork.startsWith("PUB_R1") ||
        idNetwork.startsWith("EOS")) {
      didPubKey = idNetwork;
    } else {
      didAccount = idNetwork;
    }
    IKey privateKey = binToPrivateKey(didOwnerPrivateKey);
    didOwnerPrivateKeyObj = arrayToHex(privateKey.data);
  }

  Future<int> getNonceForPubKeyDid() async {
    assert(this.jsonRpc != Null, "jsonRpc should not be null");
    IKey publicKey = stringToPublicKey(didPubKey);
    Uint8List sliceKey = publicKey.data.sublist(1, publicKey.data.length - 1);
    String sliceKeyHex = arrayToHex(sliceKey);

    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        this.registryContract, this.registryContract, 'pubkeydid',
        lower: sliceKeyHex,
        upper: sliceKeyHex,
        indexPosition: 2,
        keyType: "sha256");

    if (rows.length != 0) {
      return rows[0]['nonce'];
    } else {
      return 0;
    }
  }

  String _digestForPubKeyDIDSetAttributeSig() {
    return "";
  }

  String _digestForPubKeyDIDChangeOwnerSig() {
    return "";
  }

  String _digestForPubKeyDIDRevokeSig() {
    return "";
  }

  String _digestForPubKeyDIDClearSig() {
    return "";
  }

  void setAttributePubKeyDID() {}

  void changeOwnerPubKeyDID() {}

  void revokePubKeyDID() {}

  void clearPubKeyDID() {}

  void setAttributeAccountDID() {}

  void registerTrustedPubKeyDID() {}

  void updateTrustedPubKeyDID() {}

  void removeTrustedPubKeyDID() {}

  void registerTrustedAccountDID() {}

  void updateTrustedAccountDID() {}

  void removeTrustedAccountDID() {}

  getTrustedPubKeyDIDByAuthorizer() {}
  getTrustedPubKeyDIDByTarget() {}
  getTrustedPubKeyDID() {}
  getTrustedAccountDIDByAuthorizer() {}
  getTrustedAccountDIDByTarget() {}
  getTrustedAccountDID() {}
}
