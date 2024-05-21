import "dart:math";

import "package:infra_did_dart/src/infra_ss58_did/infra_ss58_did.dart";
import "package:infra_did_dart/src/infra_ss58_did/model/infra_ss58_did_set.dart";
import "package:test/test.dart";

void main() {
  test("Should generate DID", () async {
    InfraSS58DIDSet didSet = await InfraSS58DID.generateSS58DID("01");
    print(didSet.toJson());
  });

  test("Should generate DID from mnemonic pharse", () async {
    String phrase =
        "biology other aware floor recall journey coin bubble dial hurdle coconut canoe";
    InfraSS58DIDSet didSet =
        await InfraSS58DID.generateSS58DIDFromPhrase(phrase, "01");
    print(didSet.toJson());
  });

  test("Should initialize InfraSS58DID class", () async {
    try {
      String phrase =
          "biology other aware floor recall journey coin bubble dial hurdle coconut canoe";
      InfraSS58DIDSet didSet =
          await InfraSS58DID.generateSS58DIDFromPhrase(phrase, "01");

      InfraSS58DID infraSS58DID = InfraSS58DID(
        didSet: didSet,
        chainEndpoint: "wss://did.stage.infrablockspace.net",
        controllerDID: didSet.did,
        controllerMnemonic: didSet.seed,
      );
      expect(infraSS58DID.didSet, didSet);
    } catch (e) {
      print(e.toString());
      expect(true, false);
    }
  });
}
