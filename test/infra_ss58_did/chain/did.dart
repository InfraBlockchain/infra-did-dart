import "package:infra_did_dart/infra_did_dart.dart";
import "package:infra_did_dart/src/infra_ss58_did/chain/did.dart";
import "package:infra_did_dart/src/infra_ss58_did/model/did/did_key.dart";
import "package:infra_did_dart/src/infra_ss58_did/model/infra_ss58_did_set.dart";
import "package:infra_did_dart/src/infra_ss58_did/util/key_convert.dart";
import "package:test/test.dart";

Future<void> main() async {
  String phrase =
      "bottom drive obey lake curtain smoke basket hold race lonely fit walk//Alice";
  InfraSS58DIDSet didSet =
      await InfraSS58DID.generateSS58DIDFromPhrase(phrase, "01");

  InfraSS58DID infraSS58DID = InfraSS58DID(
    didSet: didSet,
    chainEndpoint: "ws://localhost:10021",
    controllerDID: didSet.did,
    controllerMnemonic: didSet.mnemonic,
  );

  InfraSS58DIDSet newDID = await InfraSS58DID.generateSS58DID("01");

  test("Should send newOnchain extrinsic", () async {
    final response = await registerDIDOnChain(infraSS58DID);
    print(response);
  });

  test("Should send addKeys extrinsic", () async {
    DIDKey key = DIDKey(publicKey: publicKeyFromSeed(newDID.seed), verRels: 7);
    final response = await addKeys(infraSS58DID, [key]);
    print(response);
  });

  test("Should send removeKeys extrinsic", () async {
    final response = await removeKeys(infraSS58DID, [2]);
    print(response);
  });

  test("Should send addController extrinsic", () async {
    final response = await addControllers(
        infraSS58DID, ["5GLUTstG2RDzweVE81ynFSzFkQezgh1oBdPuov35hcxgg7Jx"]);
    print(response);
  });

  test("Should send removeController extrinsic", () async {
    final response = await removeControllers(
        infraSS58DID, ["5GLUTstG2RDzweVE81ynFSzFkQezgh1oBdPuov35hcxgg7Jx"]);
    print(response);
  });

  test("Should send addServiceEndpoint extrinsic", () async {
    final response =
        await addServiceEndpoint(infraSS58DID, ["http://localhost:8000"]);
    print(response);
  });

  test("Should send removeSerivceEndpoint extrinsic", () async {
    final response = await removeServiceEndpoint(infraSS58DID);
    print(response);
  });

  test("Should send removeOnchain extrinsic", () async {
    final response = await unregisterDIDOnChain(infraSS58DID);
    print(response);
  });
}
