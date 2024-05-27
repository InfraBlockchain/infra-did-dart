import "package:infra_did_dart/infra_did_dart.dart";
import "package:infra_did_dart/src/infra_ss58_did/chain/trust_entity.dart";
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
  String did = "did:infra:01:5GLUTstG2RDzweVE81ynFSzFkQezgh1oBdPuov35hcxgg7Jx";

  test("Should send registerAuthorizer extrinsic", () async {
    final response = await registerAuthorizer(infraSS58DID, id, false);
    print(response);
  });

  test("Should send addIssuer extrinsic", () async {
    final response = await addIssuer(infraSS58DID, id, did);
    print(response);
  });

  test("Should send removeIssuer extrinsic", () async {
    final response = await removeIssuer(infraSS58DID, id, did);
    print(response);
  });

  test("Should send addVerifier extrinsic", () async {
    final response = await addVerifier(infraSS58DID, id, did);
    print(response);
  });

  test("Should send removeVerifier extrinsic", () async {
    final response = await removeVerifier(infraSS58DID, id, did);
    print(response);
  });

  test("Should send unregisterAuthorizer extrinsic", () async {
    final response = await unregisterAuthorizer(infraSS58DID, id);
    print(response);
  });
}
