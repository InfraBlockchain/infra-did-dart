import 'package:infra_did_dart/infra_did_dart.dart';
import 'dart:convert';

Future<void> main() async {
  InfraKey a = InfraKey();
  a.generateDid("01");
  print(a.toJson());
  /*
    {
      "privateKey": "PVT_K1_tJNUdraxcUjn2rACZSWLFbUcj3DeVjDC5ZjG8Q3yztTZZg3N7",
      "publicKey": "PUB_K1_5JXbkkMg4o2P9Zm7ZuSkmb4zegbygvfYPMgXTxcTTyjBuDxRgs",
      "did":
          "did:infra:01:PUB_K1_5JXbkkMg4o2P9Zm7ZuSkmb4zegbygvfYPMgXTxcTTyjBuDxRgs"
    };
   */
}
