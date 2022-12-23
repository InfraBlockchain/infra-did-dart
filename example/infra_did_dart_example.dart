import 'package:eosdart/eosdart.dart';
import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:eosdart_ecc/eosdart_ecc.dart';

Future<void> main() async {
  var infra = InfraDID(
      "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
      "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
      "fmapkumrotfc",
      "http://localhost:8888",
      "fmapkumrotfc",
      "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");

  print(await infra.getTrustedAccountDID("qwexfhmvvdci", "fmapkumrotfc"));
  print(await infra.getTrustedPubKeyDID("qwexfhmvvdci",
      "PUB_K1_584qGNgteYFppoisbDz6vBFArrw3As8qeeRCekLepG4pJVrhJt"));
  await infra.setAttributePubKeyDID("fmapkumrotfc", "fmapkumrotfc");
}
