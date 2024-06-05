import "package:infra_did_dart/infra_did_dart.dart";
import "package:infra_did_dart/src/infra_ss58_did/chain/revocation.dart";
import "package:infra_did_dart/src/infra_ss58_did/model/infra_ss58_did_set.dart";
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

  String id =
      "ee34f8f139215b34dfb9179d786fdff5b647917a07d99334e78a35591bebf348";
  String revokeId =
      "ee34f8f139215b34dfb9179d786fdff5b647917a07d99334e78a35591bebf347";

  test("Should send registerRegistry extrinsic", () async {
    final response = await registerRegistry(infraSS58DID, id, false);
    print(response);
  });

  test("Should send revokeCredential extrinsic", () async {
    final response = await revokeCredential(infraSS58DID, id, revokeId);
    print(response);
  });

  test("Should send unrevokeCredential extrinsic", () async {
    final response = await unrevokeCredential(infraSS58DID, id, revokeId);
    print(response);
  });

  test("Should send unregisterRegistry extrinsic", () async {
    final response = await unregisterRegistry(infraSS58DID, id);
    print(response);
  });
}
