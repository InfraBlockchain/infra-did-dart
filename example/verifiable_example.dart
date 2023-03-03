import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:eosdart_ecc/eosdart_ecc.dart';

Future<void> main() async {
  Resolver resolver = Resolver("fmapkumrotfc", "01", "http://localhost:8888");
  Map credentials = {
    "vc": {
      "id":
          "did:infra:01:PUB_K1_584qGNgteYFppoisbDz6vBFArrw3As8qeeRCekLepG4pJVrhJt",
      "@context": [
        "https://www.w3.org/2018/credentials/v1",
        "https://coov.io/docs/vc/personal"
      ],
      "type": ["VerifiableCredential", "Personal"],
      "credentialSubject": {"dob": "19910405"}
    },
    "sub":
        "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
    "ver": "0.9",
    "iss":
        "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63"
  };

  String vc = await InfraVerifiable().createVerifiableCredential(
      credentials, "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V");
  print(vc + "\n");

  Map verifiedVc =
      await InfraVerifiable().verifyVerifiableCredential(vc, resolver);
  print(verifiedVc);
  print("");

  Map options = {
    'challenge': "this is challenge",
    'nbf': DateTime.now().millisecondsSinceEpoch ~/ 1000
  };

  String vp = await InfraVerifiable().createVerifiablePresentation(
      vc,
      "PVT_K1_2bfGi9rYsXQSXXTvJbDAPhHLQUojjaNLomdm3cEJ1XTzMqUt3V",
      "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
      "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63",
      options);
  print(vp + "\n");

  Map verifiedVp = await InfraVerifiable()
      .verifyVerifiablePresentation(vp, resolver, options);
  print(verifiedVp);
  print("");
}
