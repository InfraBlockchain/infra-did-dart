import 'package:infra_did_dart/infra_did_dart.dart';
import 'dart:convert';

Future<void> main() async {
  JsonEncoder encoder = JsonEncoder.withIndent('  ');

  Resolver a = Resolver("fmapkumrotfc", "01", "http://localhost:8888");
  var success = await a.resolve(
      "did:infra:01:PUB_K1_6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5BoDq63");
  print(encoder.convert(success) + '\n');

  var failed = await a.resolve("did:infra:01");
  print(encoder.convert(failed) + '\n');

  var acc = await a.resolve("did:infra:01:fmapkumrotfc");
  print(encoder.convert(acc) + '\n');
}
