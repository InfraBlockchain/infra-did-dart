import "dart:typed_data";
import 'package:convert/convert.dart' show hex;

import "package:infra_did_dart/src/infra_ss58_did/util/util.dart";
import "package:test/test.dart";

void main() {
  test("Should convert DID to hex public key", () async {
    String did =
        "did:infra:01:5D1vAs2qC6XS3Raxy3W38xo2TiZXBcrT6PN3WkrN4SZDZuVJ";
    Uint8List hexPublicKey = didToHexPublicKey(did);
    expect(hex.encode(hexPublicKey),
        "2a1bf2e812f10b4c64de5dd2e7a1835aaa3a0976be7c6fa21265ae5b9222eadd");
  });

  test("Should convert DID to SS58 address", () {
    String did =
        "did:infra:01:5D1vAs2qC6XS3Raxy3W38xo2TiZXBcrT6PN3WkrN4SZDZuVJ";
    String address = didToSS58Address(did);
    expect(address, "5D1vAs2qC6XS3Raxy3W38xo2TiZXBcrT6PN3WkrN4SZDZuVJ");
  });

  test("Should convert SS58 address to DID", () {
    String address = "5D1vAs2qC6XS3Raxy3W38xo2TiZXBcrT6PN3WkrN4SZDZuVJ";
    String networkId = "01";
    String did = ss58AddressToDID(address, networkId);
    expect(
        did, "did:infra:01:5D1vAs2qC6XS3Raxy3W38xo2TiZXBcrT6PN3WkrN4SZDZuVJ");
  });
}
