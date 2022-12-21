import 'package:infra_did_dart/infra_did_dart.dart';
import 'package:eosdart_ecc/eosdart_ecc.dart';

void main() {
  EOSPrivateKey privateKey = EOSPrivateKey.fromString(
      '5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3');

  // Get the related EOS public key
  EOSPublicKey publicKey = privateKey.toEOSPublicKey();
  // Print the EOS public key
  print(publicKey.toString());

  // Going to sign the data
  String data = 'data';

  // Sign
  EOSSignature signature = privateKey.signString(data);
  // Print the EOS signature
  print(signature.toString());

  // Verify the data using the signature
  signature.verify(data, publicKey);

  // var awesome = InfraDID("http://localhost:8888");
  // print('awesome: ${awesome.defaultPubKeyDidSignDataPrefix}');
}
