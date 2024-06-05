import "dart:convert";

import "package:infra_did_dart/src/infra_ss58_did/model/infra_ss58_did_document.dart";
import "package:infra_did_dart/src/infra_ss58_did/resolver/resolver.dart";
import "package:test/test.dart";

void main() {
  test("Should get default DID Document", () async {
    final did = "did:infra:01:5DpboW3jm8AnkZxN1Jkdk1ZxisuQyYV6rDGGicYzXDdjETpe";
    InfraSS58DIDDocument document =
        InfraSS58DIDResolver.resolveDefaultDocument(did);
    print(document.toJson());
  });

  test("Should get DID Document", () async {
    final did = "did:infra:01:5EX1sTeRrA7nwpFmapyUhMhzJULJSs9uByxHTc6YTAxsc58z";
    InfraSS58DIDResolver resolver =
        InfraSS58DIDResolver("wss://did.stage.infrablockspace.net");

    InfraSS58DIDDocument document = await resolver.resolve(did);
    print(jsonEncode(document.toJson()));
  });
}
