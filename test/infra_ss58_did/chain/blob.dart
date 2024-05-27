import "package:infra_did_dart/infra_did_dart.dart";
import "package:infra_did_dart/src/infra_ss58_did/chain/blob.dart";
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

  test("Should send write extrinsic", () async {
    Map<String, dynamic> blob = {
      "name": "Alice",
      "id": "8215b21c3ab945b691d8e8e8cd0e547d"
    };
    final response = await writeSchemaOnChainByBlob(infraSS58DID, blob);
    print(response);
  });
}
