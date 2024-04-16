import 'dart:convert';

class _PublicKeyJwk {
  final String kty;
  final String crv;
  final String x;

  _PublicKeyJwk({required this.kty, required this.crv, required this.x});

  Map<String, dynamic> toJson() {
    return {
      'kty': kty,
      'crv': crv,
      'x': x
    };
  }
}

class _VerificationMethod {
  final String id;
  final String type;
  final String controller;
  final String? publicKeyBase58;
  final String? publicKeyMultibase;
  final _PublicKeyJwk? publicKeyJwk;


  _VerificationMethod({required this.id, required this.type, required this.controller,
    this.publicKeyBase58, this.publicKeyMultibase, this.publicKeyJwk});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'controller': controller,
      'publicKeyBase58': publicKeyBase58 != null ? publicKeyBase58 : null,
      'publicKeyMultibase': publicKeyMultibase != null ? publicKeyMultibase : null,
      'publicKeyJwk': publicKeyJwk != null ? publicKeyJwk!.toJson() : null
    };
  }
}

class InfraDidDocument {
  final List<String> context;
  final String id;
  final List<_VerificationMethod> verificationMethod;
  final List<String> authentication;
  final List<String> assertionMethod;

  InfraDidDocument({required this.context, required this.id,
    required this.verificationMethod, required this.authentication,
    required this.assertionMethod});

  factory InfraDidDocument.fromStringJson(String json) {
    final Map<String, dynamic> map = jsonDecode(json);
    return InfraDidDocument(
      context: map['@context'].cast<String>(),
      id: map['id'],
      verificationMethod: (map['verificationMethod'] as List).map((e) {
        final publicKeyJwk = e['publicKeyJwk'] != null ? _PublicKeyJwk(
          kty: e['publicKeyJwk']['kty'],
          crv: e['publicKeyJwk']['crv'],
          x: e['publicKeyJwk']['x']
        ) : null;
        return _VerificationMethod(
          id: e['id'],
          type: e['type'],
          controller: e['controller'],
          publicKeyBase58: e['publicKeyBase58'],
          publicKeyMultibase: e['publicKeyMultibase'],
          publicKeyJwk: publicKeyJwk
        );
      }).toList(),
      assertionMethod: map['assertionMethod'].cast<String>(),
      authentication: map['authentication'].cast<String>()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '@context': context,
      'id': id,
      'verificationMethod': verificationMethod.map((e) => e.toJson()).toList(),
      'authentication': authentication,
      'assertionMethod': assertionMethod
    };
  }

  String toString() {
    return jsonEncode(this.toJson());
  }
}
