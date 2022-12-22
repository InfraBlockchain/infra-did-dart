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
    EOSPublicKey eosPublicKey = EOSPublicKey.fromString(didPubKey);

    IKey publicKey = stringToPublicKey(eosPublicKey.toString());
    Uint8List sliceKey = publicKey.data.sublist(1, publicKey.data.length);
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

  Future<List<Map<String, dynamic>>> getTrustedPubKeyDIDByAuthorizer(
      String authorizer) async {
    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        this.registryContract, this.registryContract, 'trstdpkdid',
        lower: authorizer, upper: authorizer, indexPosition: 2, keyType: "i64");

    return rows;
  }

  Future<List<Map<String, dynamic>>> getTrustedPubKeyDIDByTarget(
      String didPubKey) async {
    EOSPublicKey eosPublicKey = EOSPublicKey.fromString(didPubKey);

    IKey publicKey = stringToPublicKey(eosPublicKey.toString());
    Uint8List sliceKey = publicKey.data.sublist(1, publicKey.data.length);
    String sliceKeyHex = arrayToHex(sliceKey);

    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        this.registryContract, this.registryContract, 'trstdpkdid',
        lower: sliceKeyHex,
        upper: sliceKeyHex,
        indexPosition: 3,
        keyType: "sha256");

    return rows;
  }

  Future<List<Map<String, dynamic>>> getTrustedPubKeyDID(
      String authorizer, String didPubKey) async {
    BigInt authorizerIndex = encodeName(authorizer);
    String hexAuthorizerIndex = authorizerIndex.toRadixString(16);
    Uint8List reveredHexAuthorizerArray =
        Uint8List.fromList(stringToHex(hexAuthorizerIndex).reversed.toList());

    EOSPublicKey eosPublicKey = EOSPublicKey.fromString(didPubKey);
    IKey publicKey = stringToPublicKey(eosPublicKey.toString());

    Uint8List sliceKey = concatUint8List([
      reveredHexAuthorizerArray,
      publicKey.data.sublist(9, publicKey.data.length)
    ]);
    String sliceKeyHex = arrayToHex(sliceKey);
    print(sliceKeyHex);
    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        this.registryContract, this.registryContract, 'trstdpkdid',
        lower: sliceKeyHex,
        upper: sliceKeyHex,
        indexPosition: 4,
        keyType: "sha256");

    return rows;
  }

  Future<List<Map<String, dynamic>>> getTrustedAccountDIDByAuthorizer(
      String authorizer) async {
    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        this.registryContract, this.registryContract, 'trstdaccdid',
        lower: authorizer, upper: authorizer, indexPosition: 2, keyType: "i64");

    return rows;
  }

  Future<List<Map<String, dynamic>>> getTrustedAccountDIDByTarget(
      String account) async {
    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        this.registryContract, this.registryContract, 'trstdaccdid',
        lower: account, upper: account, indexPosition: 3, keyType: "i64");

    return rows;
  }

  Future<List<Map<String, dynamic>>> getTrustedAccountDID(
      String authorizer, String account) async {
    assert(this.jsonRpc != Null, "jsonRpc should not be null");
    BigInt authorizerIndex = encodeName(authorizer);
    BigInt nameIndex = encodeName(account);
    BigInt index = authorizerIndex * BigInt.from(2).pow(64) + nameIndex;

    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        this.registryContract, this.registryContract, 'trstdaccdid',
        lower: index.toString(),
        upper: index.toString(),
        indexPosition: 4,
        keyType: "i128");

    return rows;
  }
}
