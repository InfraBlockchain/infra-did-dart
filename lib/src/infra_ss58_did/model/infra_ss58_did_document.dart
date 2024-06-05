import 'dart:convert';

class InfraSS58DIDDocument {
  final List<String> context;
  final List<String> controller;
  final String id;
  final List<VerificationMethod> verificationMethod;
  final List<String> authentication;
  final List<String> assertionMethod;
  final List<String> keyAgreement;
  final List<String> capabilityInvocation;
  final List<Service> service;

  InfraSS58DIDDocument(
      {required this.context,
      required this.controller,
      required this.id,
      required this.verificationMethod,
      required this.authentication,
      required this.assertionMethod,
      required this.keyAgreement,
      required this.capabilityInvocation,
      required this.service});

  factory InfraSS58DIDDocument.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return InfraSS58DIDDocument(
      context: json['@context'],
      id: json['id'],
      controller: json['controller'],
      verificationMethod: (json['verificationMethod'] as List).map((e) {
        return VerificationMethod.fromJson(jsonEncode(e));
      }).toList(),
      authentication: json['authentication'],
      assertionMethod: json['assertionMethod'],
      keyAgreement: json['keyAgreement'],
      capabilityInvocation: json['capabilityInvocation'],
      service: (json['service'] as List).map((e) {
        return Service.fromJson(jsonEncode(e));
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '@context': context,
      'id': id,
      'controller': controller,
      'verificationMethod': verificationMethod.map((e) => e.toJson()).toList(),
      'authentication': authentication,
      'assertionMethod': assertionMethod,
      'keyAgreement': keyAgreement,
      'capabilityInvocation': capabilityInvocation,
      'service': service.map((e) => e.toJson()).toList(),
    };
  }
}

class VerificationMethod {
  final String id;
  final String type;
  final String controller;
  final String? publicKeyBase58;
  final String? publicKeyMultibase;
  final Map<String, dynamic>? publicKeyJwk;

  VerificationMethod(
      {required this.id,
      required this.type,
      required this.controller,
      this.publicKeyBase58,
      this.publicKeyMultibase,
      this.publicKeyJwk});

  factory VerificationMethod.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return VerificationMethod(
      id: json['id'],
      type: json['type'],
      controller: json['controller'],
      publicKeyBase58: json['publicKeyBase58'],
      publicKeyMultibase: json['publicKeyMultibase'],
      publicKeyJwk: json['publicKeyJwk'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = {
      'id': id,
      'type': type,
      'controller': controller,
      'publicKeyBase58': publicKeyBase58,
      'publicKeyMultibase': publicKeyMultibase,
      'publicKeyJwk': publicKeyJwk,
    };

    jsonMap.removeWhere((key, value) => value == null);

    return jsonMap;
  }
}

class Service {
  final String id;
  final String type;
  final List<String> serviceEndpoint;

  Service(
      {required this.id, required this.type, required this.serviceEndpoint});

  factory Service.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return Service(
      id: json['id'],
      type: json['type'],
      serviceEndpoint: json['serviceEndpoint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'serviceEndpoint': serviceEndpoint,
    };
  }
}
