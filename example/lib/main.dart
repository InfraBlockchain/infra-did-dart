import 'package:flutter/material.dart';
import 'package:infra_did_dart/infra_did_dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = "";

  void _generateSS58DID() {
    setState(() {
      data = InfraSS58DID.generateSS58DID("01");
    });
  }

  void _didToHexPublicKey() {
    setState(() {
      data = InfraSS58DID.didToHexPublicKey(
          "did:infra:01:5GM7RtekqU8cGiS4MKQ7tufoH4Q1itzmoFpVcvcPfjksyPrw");
    });
  }

  void _ss58AdressToDID() {
    setState(() {
      data = InfraSS58DID.ss58AdressToDID(
          "5H6PhTQ1ukXBE1pqYVt2BMLjiKD9pqVsoppp2g8eM4EENAfL", "01");
    });
  }

  void _resolve() {
    setState(() {
      data = InfraSS58DID.resolve(
          "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW");
    });
  }

  void _issueCredential() {
    String did =
        "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW";
    String privateKey =
        "8006aaa5985f1d72e916167bdcbc663232cef5823209b1246728f73137888170";
    String credential = """{
            "@context": [
                "https://www.w3.org/2018/credentials/v1"
            ],
            "id": "did:infra:space:5FDseiC76zPek2YYkuyenu4ZgxZ7PUWXt9d19HNB5CaQXt5U",
            "type": [
                "VerifiableCredential"
            ],
            "credentialSubject": [
                {
                    "id": "did:example:d23dd687a7dc6787646f2eb98d0"
                }
            ],
            "issuanceDate": "2023-04-24T06:08:03.039Z",
            "issuer": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW"
        }""";
    setState(() {
      data = InfraSS58DID.issueCredential(did, credential, privateKey);
    });
  }

  void _verifyCredential() {
    String credential = """{
            "@context": [
                "https://www.w3.org/2018/credentials/v1"
            ],
            "id": "did:infra:space:5FDseiC76zPek2YYkuyenu4ZgxZ7PUWXt9d19HNB5CaQXt5U",
            "type": [
                "VerifiableCredential"
            ],
            "credentialSubject": [
                {
                    "id": "did:example:d23dd687a7dc6787646f2eb98d0"
                }
            ],
            "issuer": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW",
            "issuanceDate": "2023-04-24T06:08:03.039Z",
            "proof": {
                "@context": [
                    "https://w3id.org/security/suites/ed25519-2020/v1"
                ],
                "type": "Ed25519Signature2020",
                "proofPurpose": "assertionMethod",
                "proofValue": "z3gFJvCvNYTVQJ7R7tXzbmAyZ62g3ZymbzwTrWJhgwatJouope5GnQmz7NW2zAVVYbor5KUW8TUa1V5KADPp8kBog",
                "verificationMethod": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-2",
                "created": "2023-04-25T23:52:13.770Z"
            }
        }""";
    setState(() {
      data = InfraSS58DID.verifyCredential(credential);
    });
  }

  void _issuePresentation() {
    String did =
        "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW";
    String privateKey =
        "8006aaa5985f1d72e916167bdcbc663232cef5823209b1246728f73137888170";
    String credential = """{
            "@context": [
                "https://www.w3.org/2018/credentials/v1"
            ],
            "id": "did:infra:space:5FDseiC76zPek2YYkuyenu4ZgxZ7PUWXt9d19HNB5CaQXt5U",
            "type": [
                "VerifiableCredential"
            ],
            "credentialSubject": [
                {
                    "id": "did:example:d23dd687a7dc6787646f2eb98d0"
                }
            ],
            "issuer": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW",
            "issuanceDate": "2023-04-24T06:08:03.039Z",
            "proof": {
                "@context": [
                    "https://w3id.org/security/suites/ed25519-2020/v1"
                ],
                "type": "Ed25519Signature2020",
                "proofPurpose": "assertionMethod",
                "proofValue": "z3gFJvCvNYTVQJ7R7tXzbmAyZ62g3ZymbzwTrWJhgwatJouope5GnQmz7NW2zAVVYbor5KUW8TUa1V5KADPp8kBog",
                "verificationMethod": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-2",
                "created": "2023-04-25T23:52:13.770Z"
            }
        }""";
    setState(() {
      data = InfraSS58DID.issuePresentation(did, credential, privateKey);
    });
  }

  void _verifyPresentation() {
    String credential = """{
            "@context": [
                "https://www.w3.org/2018/credentials/v1"
            ],
            "id": "did:infra:01:5C65pZF9tBxUgRarjqNQRLUYaxhjDatawtJsPUFLsv8HrRDs",
            "type": "VerifiablePresentation",
            "verifiableCredential": {
                "@context": [
                    "https://www.w3.org/2018/credentials/v1"
                ],
                "id": "did:infra:space:5FDseiC76zPek2YYkuyenu4ZgxZ7PUWXt9d19HNB5CaQXt5U",
                "type": [
                    "VerifiableCredential"
                ],
                "credentialSubject": [
                    {
                        "id": "did:example:d23dd687a7dc6787646f2eb98d0"
                    }
                ],
                "issuer": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW",
                "issuanceDate": "2023-04-24T06:08:03.039Z",
                "proof": {
                    "@context": [
                        "https://w3id.org/security/suites/ed25519-2020/v1"
                    ],
                    "type": "Ed25519Signature2020",
                    "proofPurpose": "assertionMethod",
                    "proofValue": "z3gFJvCvNYTVQJ7R7tXzbmAyZ62g3ZymbzwTrWJhgwatJouope5GnQmz7NW2zAVVYbor5KUW8TUa1V5KADPp8kBog",
                    "verificationMethod": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-2",
                    "created": "2023-04-25T23:52:13.770Z"
                }
            },
            "proof": {
                "@context": [
                    "https://w3id.org/security/suites/ed25519-2020/v1"
                ],
                "type": "Ed25519Signature2020",
                "proofPurpose": "assertionMethod",
                "proofValue": "z5fwTSAD25dFq62rYCzeNUD5TfYwpgSB7HLa9eLtDMpPVB2hb83rbvDmydwPmwubiswWYvcZVmxqG34GxkkLkypDY",
                "verificationMethod": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-2",
                "created": "2023-04-26T00:21:22.810Z"
            },
            "holder": "did:infra:space:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW"
        }""";
    setState(() {
      data = InfraSS58DID.verifyPresentation(credential);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: _generateSS58DID, child: Text("_generateSS58DID")),
            ElevatedButton(
                onPressed: _didToHexPublicKey,
                child: Text("_didToHexPublicKey")),
            ElevatedButton(
                onPressed: _ss58AdressToDID, child: Text("_ss58AdressToDID")),
            ElevatedButton(
                onPressed: _issueCredential, child: Text("_issueCredential")),
            ElevatedButton(
                onPressed: _verifyCredential, child: Text("_verifyCredential")),
            ElevatedButton(
                onPressed: _issuePresentation,
                child: Text("_issuePresentation")),
            ElevatedButton(
                onPressed: _verifyPresentation,
                child: Text("_verifyPresentation")),
            ElevatedButton(onPressed: _resolve, child: Text("resolve")),
            Text(data)
          ],
        ),
      ),
    );
  }
}
