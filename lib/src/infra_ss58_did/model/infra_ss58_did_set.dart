import 'dart:convert';

class InfraSS58DIDSet {
  String address;
  String seed;
  String did;
  String mnemonic;

  InfraSS58DIDSet(
      {required this.address,
      required this.seed,
      required this.did,
      required this.mnemonic});

  factory InfraSS58DIDSet.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return InfraSS58DIDSet(
        address: json['address'],
        seed: json["seed"],
        did: json['did'],
        mnemonic: json['mnemonic']);
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'seed': seed,
      'did': did,
      'mnemonic': mnemonic,
    };
  }
}
