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

  Future<double> getNonceForPubKeyDid() async {
    assert(this.jsonRpc != Null, "jsonRpc should not be null");
    var rows = jsonRpc.getTableRows(
        this.registryContract, this.registryContract, 'pubkeydid',
        lower: "", upper: "", indexPosition: 2, keyType: "sha256");

    return 1;
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
