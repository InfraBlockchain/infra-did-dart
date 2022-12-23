import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:test/test.dart';

void main() {
  group('infra_did_dart test', () {
    var infra;
    setUp(() {
      infra = InfraDID(
          "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
          "fmapkumrotfc",
          "http://localhost:8888",
          "fmapkumrotfc",
          "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
    });

    test('setAttributePubKeyDID', () async {
      await infra.setAttributePubKeyDID("key", "value");
    });

    test('changeOwnerPubKeyDID', () async {
      await infra.changeOwnerPubKeyDID(
          "PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63");
    });

    test('revokePubKeyDID', () async {
      await infra.revokePubKeyDID();
    });

    test('clearPubKeyDID', () async {
      await infra.clearPubKeyDID();
    });

    test('setAttributeAccountDID', () async {
      await infra.setAttributeAccountDID("key", "value");
    });

    test('registerTrustedPubKeyDID', () async {
      await infra.registerTrustedPubKeyDID("fmapkumrotfc",
          "PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63", "?");
    });

    test('updateTrustedPubKeyDID', () async {
      await infra.updateTrustedPubKeyDID("fmapkumrotfc",
          "PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63", "?");
    });

    test('removeTrustedPubKeyDID', () async {
      await infra.removeTrustedPubKeyDID("fmapkumrotfc",
          "PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63");
    });

    test('registerTrustedAccountDID', () async {
      await infra.registerTrustedAccountDID("fmapkumrotfc", "eosio", "?");
    });

    test('updateTrustedAccountDID', () async {
      await infra.updateTrustedAccountDID("fmapkumrotfc", "eosio", "?");
    });

    test('removeTrustedAccountDID', () async {
      await infra.removeTrustedAccountDID("fmapkumrotfc", "eosio");
    });

    test('getTrustedPubKeyDIDByAuthorizer', () async {
      await infra.getTrustedPubKeyDIDByAuthorizer("fmapkumrotfc");
    });

    test('getTrustedPubKeyDIDByTarget', () async {
      await infra.getTrustedPubKeyDIDByTarget(
          "PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63");
    });

    test('getTrustedPubKeyDID', () async {
      await infra.getTrustedPubKeyDID("fmapkumrotfc",
          "PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63");
    });

    test('getTrustedAccountDIDByAuthorizer', () async {
      await infra.getTrustedAccountDIDByAuthorizer("fmapkumrotfc");
    });

    test('getTrustedAccountDIDByTarget', () async {
      await infra.getTrustedAccountDIDByTarget("eosio");
    });

    test('getTrustedAccountDID', () async {
      await infra.getTrustedAccountDID("fmapkumrotfc", "eosio");
    });
  });
}
