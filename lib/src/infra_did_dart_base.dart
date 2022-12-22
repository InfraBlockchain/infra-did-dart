import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:eosdart/eosdart.dart';
import 'package:eosdart_ecc/eosdart_ecc.dart';
import 'package:secp256k1/secp256k1.dart';

import '../infra_did_dart.dart';

class InfraDID {
  String defaultPubKeyDidSignDataPrefix = "infra-mainnet";
  String registryContract;
  String didPubKey = "";
  String didAccount = "";
  String did;
  late EOSClient jsonRpc;
  String txfeePayerAccount;
  List<String> sigProviderPrivKeys = [];
  late EOSPrivateKey didOwnerPrivateKeyObj;

  InfraDID(this.did, String didOwnerPrivateKey, this.registryContract,
      String rpcEndpoint, this.txfeePayerAccount,
      [String txfeePayerPrivateKey = "", String pubKeyDidSignDataPrefix = ""]) {
    defaultPubKeyDidSignDataPrefix = pubKeyDidSignDataPrefix != ""
        ? "infra-mainnet"
        : pubKeyDidSignDataPrefix;

    sigProviderPrivKeys = txfeePayerPrivateKey != ""
        ? [txfeePayerPrivateKey, didOwnerPrivateKey]
        : [didOwnerPrivateKey];

    jsonRpc = EOSClient(rpcEndpoint, 'v1',
        privateKeys: sigProviderPrivKeys.toSet().toList());
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
    didOwnerPrivateKeyObj = EOSPrivateKey.fromString(didOwnerPrivateKey);
  }

  Future<int> getNonceForPubKeyDid() async {
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

    if (rows.isNotEmpty) {
      return rows[0]['nonce'];
    } else {
      return 0;
    }
  }

  Digest _digestForPubKeyDIDSetAttributeSig(
      String pubkey, String key, String value, int nonce) {
    String actionName = "pksetattr";
    int dataLength = defaultPubKeyDidSignDataPrefix.length +
        actionName.length +
        (1 + publicKeyDataSize) +
        2 +
        key.length +
        value.length;
    IKey pub = stringToPublicKey(pubkey);

    SerialBuffer buf = SerialBuffer(Uint8List(dataLength));
    buf.pushString(defaultPubKeyDidSignDataPrefix);
    buf.pushString(actionName);
    buf.pushPublicKey(pubkey);
    buf.pushUint16(nonce);
    buf.pushString(key);
    buf.pushString(value);

    var bufArray = buf.array?.toList();
    var digest = sha256.convert(bufArray!);

    return digest;
  }

  Digest _digestForPubKeyDIDChangeOwnerSig(
      String pubkey, String newOwnerPubKey, int nonce) {
    String actionName = "pkchowner";
    int dataLength = defaultPubKeyDidSignDataPrefix.length +
        actionName.length +
        (1 + publicKeyDataSize) +
        2 +
        (1 + publicKeyDataSize);

    IKey pub = stringToPublicKey(pubkey);
    IKey newPub = stringToPublicKey(newOwnerPubKey);

    SerialBuffer buf = SerialBuffer(Uint8List(0));
    buf.pushString(defaultPubKeyDidSignDataPrefix);
    buf.pushString(actionName);
    buf.push([pub.type.index]);
    buf.pushArray(pub.data);
    buf.pushUint16(nonce);
    buf.push([newPub.type.index]);
    buf.pushArray(newPub.data);

    var bufArray = buf.array?.toList();
    var digest = sha256.convert(bufArray!);

    return digest;
  }

  Digest _digestForPubKeyDIDRevokeSig(String pubkey, int nonce) {
    String actionName = "pkdidrevoke";
    int dataLength = defaultPubKeyDidSignDataPrefix.length +
        actionName.length +
        (1 + publicKeyDataSize) +
        2;

    IKey pub = stringToPublicKey(pubkey);

    SerialBuffer buf = SerialBuffer(Uint8List(0));
    buf.pushString(defaultPubKeyDidSignDataPrefix);
    buf.pushString(actionName);
    buf.push([pub.type.index]);
    buf.pushArray(pub.data);
    buf.pushUint16(nonce);

    var bufArray = buf.array?.toList();
    var digest = sha256.convert(bufArray!);

    return digest;
  }

  Digest _digestForPubKeyDIDClearSig(String pubkey, int nonce) {
    String actionName = "pkdidclear";
    int dataLength = defaultPubKeyDidSignDataPrefix.length +
        actionName.length +
        (1 + publicKeyDataSize) +
        2;

    IKey pub = stringToPublicKey(pubkey);

    SerialBuffer buf = SerialBuffer(Uint8List(0));
    buf.pushString(defaultPubKeyDidSignDataPrefix);
    buf.pushString(actionName);
    buf.push([pub.type.index]);
    buf.pushArray(pub.data);
    buf.pushUint16(nonce);

    var bufArray = buf.array?.toList();
    var digest = sha256.convert(bufArray!);

    return digest;
  }

  Future setAttributePubKeyDID(String key, String value) async {
    int nonce = await getNonceForPubKeyDid();
    Digest digest =
        _digestForPubKeyDIDSetAttributeSig(didPubKey, key, value, nonce);

    EOSSignature signature =
        didOwnerPrivateKeyObj.signString(digest.toString());

    List<Authorization> auth = [
      Authorization()
        ..actor = txfeePayerAccount
        ..permission = 'active'
    ];

    Map data = {
      'pk': didPubKey,
      'key': key,
      'value': value,
      'sig': signature.toString(),
      'ram_payer': txfeePayerAccount
    };

    List<Action> actions = [
      Action()
        ..account = registryContract
        ..name = 'pksetattr'
        ..authorization = auth
        ..data = data
    ];
    Transaction transaction = Transaction()..actions = actions;

    return await jsonRpc.pushTransaction(transaction, broadcast: true);
  }

  Future changeOwnerPubKeyDID(String newOwnerPubKey) async {
    int nonce = await getNonceForPubKeyDid();
    Digest digest =
        _digestForPubKeyDIDChangeOwnerSig(didPubKey, newOwnerPubKey, nonce);
    String signature = "";

    List<Authorization> auth = [
      Authorization()
        ..actor = txfeePayerAccount
        ..permission = 'active'
    ];

    Map data = {
      'pk': didPubKey,
      'sig': signature,
      'ram_payer': txfeePayerAccount
    };

    List<Action> actions = [
      Action()
        ..account = registryContract
        ..name = 'pkchowner'
        ..authorization = auth
        ..data = data
    ];
    Transaction transaction = Transaction()..actions = actions;

    return jsonRpc.pushTransaction(transaction, broadcast: true);
  }

  Future revokePubKeyDID() async {
    int nonce = await getNonceForPubKeyDid();
    Digest digest = _digestForPubKeyDIDRevokeSig(didPubKey, nonce);
    String signature = "";

    List<Authorization> auth = [
      Authorization()
        ..actor = txfeePayerAccount
        ..permission = 'active'
    ];

    Map data = {
      'pk': didPubKey,
      'sig': signature,
      'ram_payer': txfeePayerAccount
    };

    List<Action> actions = [
      Action()
        ..account = registryContract
        ..name = 'pkdidrevoke'
        ..authorization = auth
        ..data = data
    ];
    Transaction transaction = Transaction()..actions = actions;

    return jsonRpc.pushTransaction(transaction, broadcast: true);
  }

  Future clearPubKeyDID() {
    List<Authorization> auth = [
      Authorization()
        ..actor = txfeePayerAccount
        ..permission = 'active'
    ];

    Map data = {
      'pk': didPubKey,
      'sig': "key",
    };

    List<Action> actions = [
      Action()
        ..account = registryContract
        ..name = 'pkdidclear'
        ..authorization = auth
        ..data = data
    ];
    Transaction transaction = Transaction()..actions = actions;

    return jsonRpc.pushTransaction(transaction, broadcast: true);
  }

  Future setAttributeAccountDID(String key, String value) {
    List<Authorization> auth = [
      Authorization()
        ..actor = didAccount
        ..permission = 'active'
    ];

    Map data = {'account': didAccount, 'key': key, 'value': value};

    List<Action> actions = [
      Action()
        ..account = registryContract
        ..name = 'accsetattr'
        ..authorization = auth
        ..data = data
    ];
    Transaction transaction = Transaction()..actions = actions;

    return jsonRpc.pushTransaction(transaction, broadcast: true);
  }

  Future registerTrustedPubKeyDID(
      String authorizer, String didPubKey, String properties) {
    List<Authorization> auth = [
      Authorization()
        ..actor = authorizer
        ..permission = 'active'
    ];

    Map data = {
      'authorizer': authorizer,
      'pk': didPubKey,
      'properties': properties
    };

    List<Action> actions = [
      Action()
        ..account = registryContract
        ..name = 'registerTrusted'
        ..authorization = auth
        ..data = data
    ];
    Transaction transaction = Transaction()..actions = actions;

    return jsonRpc.pushTransaction(transaction, broadcast: true);
  }

  Future updateTrustedPubKeyDID(
      String authorizer, String didPubKey, String properties) {
    List<Authorization> auth = [
      Authorization()
        ..actor = authorizer
        ..permission = 'active'
    ];

    Map data = {
      'authorizer': authorizer,
      'pk': didPubKey,
      'properties': properties
    };

    List<Action> actions = [
      Action()
        ..account = registryContract
        ..name = 'updateTrusted'
        ..authorization = auth
        ..data = data
    ];
    Transaction transaction = Transaction()..actions = actions;

    return jsonRpc.pushTransaction(transaction, broadcast: true);
  }

  Future removeTrustedPubKeyDID(String authorizer, String didPubKey) {
    List<Authorization> auth = [
      Authorization()
        ..actor = authorizer
        ..permission = 'active'
    ];

    Map data = {
      'authorizer': authorizer,
      'pk': didPubKey,
    };

    List<Action> actions = [
      Action()
        ..account = registryContract
        ..name = 'pktrstdrmv'
        ..authorization = auth
        ..data = data
    ];
    Transaction transaction = Transaction()..actions = actions;

    return jsonRpc.pushTransaction(transaction, broadcast: true);
  }

  Future registerTrustedAccountDID(
      String authorizer, String account, String properties) {
    List<Authorization> auth = [
      Authorization()
        ..actor = authorizer
        ..permission = 'active'
    ];

    Map data = {
      'authorizer': authorizer,
      'account': account,
      'properties': properties
    };

    List<Action> actions = [
      Action()
        ..account = registryContract
        ..name = 'acctrstdreg'
        ..authorization = auth
        ..data = data
    ];
    Transaction transaction = Transaction()..actions = actions;

    return jsonRpc.pushTransaction(transaction, broadcast: true);
  }

  Future updateTrustedAccountDID(
      String authorizer, String account, String properties) {
    List<Authorization> auth = [
      Authorization()
        ..actor = authorizer
        ..permission = 'active'
    ];

    Map data = {
      'authorizer': authorizer,
      'account': account,
      'properties': properties
    };

    List<Action> actions = [
      Action()
        ..account = registryContract
        ..name = 'acctrstdupdt'
        ..authorization = auth
        ..data = data
    ];
    Transaction transaction = Transaction()..actions = actions;

    return jsonRpc.pushTransaction(transaction, broadcast: true);
  }

  Future removeTrustedAccountDID(String authorizer, String account) {
    List<Authorization> auth = [
      Authorization()
        ..actor = authorizer
        ..permission = 'active'
    ];

    Map data = {
      'authorizer': authorizer,
      'account': account,
    };

    List<Action> actions = [
      Action()
        ..account = registryContract
        ..name = 'acctrstdrmv'
        ..authorization = auth
        ..data = data
    ];
    Transaction transaction = Transaction()..actions = actions;

    return jsonRpc.pushTransaction(transaction, broadcast: true);
  }

  Future<List<Map<String, dynamic>>> getTrustedPubKeyDIDByAuthorizer(
      String authorizer) async {
    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        registryContract, registryContract, 'trstdpkdid',
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
        registryContract, registryContract, 'trstdpkdid',
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
        registryContract, registryContract, 'trstdpkdid',
        lower: sliceKeyHex,
        upper: sliceKeyHex,
        indexPosition: 4,
        keyType: "sha256");

    return rows;
  }

  Future<List<Map<String, dynamic>>> getTrustedAccountDIDByAuthorizer(
      String authorizer) async {
    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        registryContract, registryContract, 'trstdaccdid',
        lower: authorizer, upper: authorizer, indexPosition: 2, keyType: "i64");

    return rows;
  }

  Future<List<Map<String, dynamic>>> getTrustedAccountDIDByTarget(
      String account) async {
    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        registryContract, registryContract, 'trstdaccdid',
        lower: account, upper: account, indexPosition: 3, keyType: "i64");

    return rows;
  }

  Future<List<Map<String, dynamic>>> getTrustedAccountDID(
      String authorizer, String account) async {
    BigInt authorizerIndex = encodeName(authorizer);
    BigInt nameIndex = encodeName(account);
    BigInt index = authorizerIndex * BigInt.from(2).pow(64) + nameIndex;

    List<Map<String, dynamic>> rows = await jsonRpc.getTableRows(
        registryContract, registryContract, 'trstdaccdid',
        lower: index.toString(),
        upper: index.toString(),
        indexPosition: 4,
        keyType: "i128");

    return rows;
  }
}
