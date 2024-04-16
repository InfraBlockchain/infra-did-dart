import 'dart:convert';

class InfraDidSet {
  String address;
  String did;
  List<String> mnemonic;
  String privateKey;
  String publicKey;

  InfraDidSet({required this.address, required this.did, required this.mnemonic, required this.privateKey, required this.publicKey});

  factory InfraDidSet.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return InfraDidSet(
      address: json['address'],
      did: json['did'],
      mnemonic: json['mnemonic'].split(' ').toList() as List<String>,
      privateKey: json['private_key'],
      publicKey: json['public_key'],
    );
  }
}
