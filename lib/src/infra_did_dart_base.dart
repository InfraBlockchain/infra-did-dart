import 'package:eosdart/eosdart.dart';
import 'package:eosdart_ecc/eosdart_ecc.dart';

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
  }
}
