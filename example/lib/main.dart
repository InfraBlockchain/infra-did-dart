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
  late final InfraDidSet didSet;

  void _generateSS58DID() {
    setState(() {
      didSet = InfraSS58DID.generateSS58DID("01");
      data = didSet.did;
      print(data);
    });
  }

  void _didToHexPublicKey() {
    setState(() {
      data = InfraSS58DID.didToHexPublicKey(didSet.did);
    });
  }

  void _ss58AddressToDID() {
    setState(() {
      data = InfraSS58DID.ss58AddressToDID(didSet.address, "01");
    });
  }

  void _resolve() {
    setState(() {
      data = InfraSS58DID.resolve(
          "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW");
    });
  }

  void _issueCredential() {
    String did =
        "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW";
    String privateKey =
        "8006aaa5985f1d72e916167bdcbc663232cef5823209b1246728f73137888170";
    String credential = """{
            "@context": [
                "https://www.w3.org/2018/credentials/v1"
            ],
            "id": "did:infra:01:5FDseiC76zPek2YYkuyenu4ZgxZ7PUWXt9d19HNB5CaQXt5U",
            "type": [
                "VerifiableCredential"
            ],
            "credentialSubject": [
                {
                    "id": "did:example:d23dd687a7dc6787646f2eb98d0"
                }
            ],
            "issuanceDate": "2023-04-24T06:08:03.039Z",
            "issuer": "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW"
        }""";
    setState(() {
      data = InfraSS58DID.issueCredential(did, credential, privateKey);
      print(data);
    });
  }

  void _verifyCredential() {
    String credential = """{
      "@context": [
        "https://www.w3.org/2018/credentials/v1"
      ],
      "id": "did:infra:01:5FDseiC76zPek2YYkuyenu4ZgxZ7PUWXt9d19HNB5CaQXt5U",
      "type": [
        "VerifiableCredential"
      ],
      "credentialSubject": [
        {
          "id": "did:example:d23dd687a7dc6787646f2eb98d0"
        }
      ],
      "issuer": "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW",
      "issuanceDate": "2023-04-24T06:08:03.039Z",
      "proof": {
        "type": "Ed25519Signature2018",
        "proofPurpose": "assertionMethod",
        "verificationMethod": "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-1",
        "created": "2024-04-03T01:13:18.220667Z",
        "jws": "eyJhbGciOiJFZERTQSIsImNyaXQiOlsiYjY0Il0sImI2NCI6ZmFsc2V9..VZU_0mj3fD-Nrcq1Zu4r_tqOhQERfI8RMpPeDHX3dQkmTyvOG5AUFtgebrr-wS1RqHIRgvxqIBaSE51dHwUtBA"
      }
    }""";
    setState(() {
      data = InfraSS58DID.verifyCredential(credential) ? 'True': 'False';
    });
  }

  void _issuePresentation() {
    String did =
        "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW";
    String privateKey =
        "8006aaa5985f1d72e916167bdcbc663232cef5823209b1246728f73137888170";
    String credential = """{
            "@context": [
              "https://www.w3.org/2018/credentials/v1"
            ],
            "id": "did:infra:01:5FDseiC76zPek2YYkuyenu4ZgxZ7PUWXt9d19HNB5CaQXt5U",
            "type": [
              "VerifiableCredential"
            ],
            "credentialSubject": [
              {
                "id": "did:example:d23dd687a7dc6787646f2eb98d0"
              }
            ],
            "issuer": "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW",
            "issuanceDate": "2023-04-24T06:08:03.039Z",
            "proof": {
              "type": "Ed25519Signature2018",
              "proofPurpose": "assertionMethod",
              "verificationMethod": "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-1",
              "created": "2024-04-03T01:13:18.220667Z",
              "jws": "eyJhbGciOiJFZERTQSIsImNyaXQiOlsiYjY0Il0sImI2NCI6ZmFsc2V9..VZU_0mj3fD-Nrcq1Zu4r_tqOhQERfI8RMpPeDHX3dQkmTyvOG5AUFtgebrr-wS1RqHIRgvxqIBaSE51dHwUtBA"
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
        "id": "did:infra:01:5F9myCAKW52XUU38Z4uhttmYYLoLFWe9AnEVpv1aGpx9Q3Bp",
        "type": "VerifiablePresentation",
        "verifiableCredential": {
          "@context": [
            "https://www.w3.org/2018/credentials/v1"
          ],
          "id": "did:infra:01:5FDseiC76zPek2YYkuyenu4ZgxZ7PUWXt9d19HNB5CaQXt5U",
          "type": [
            "VerifiableCredential"
          ],
          "credentialSubject": [
            {
              "id": "did:example:d23dd687a7dc6787646f2eb98d0"
            }
          ],
          "issuer": "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW",
          "issuanceDate": "2023-04-24T06:08:03.039Z",
          "proof": {
            "type": "Ed25519Signature2018",
            "proofPurpose": "assertionMethod",
            "verificationMethod": "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-1",
            "created": "2024-04-03T01:13:18.220667Z",
            "jws": "eyJhbGciOiJFZERTQSIsImNyaXQiOlsiYjY0Il0sImI2NCI6ZmFsc2V9..VZU_0mj3fD-Nrcq1Zu4r_tqOhQERfI8RMpPeDHX3dQkmTyvOG5AUFtgebrr-wS1RqHIRgvxqIBaSE51dHwUtBA"
          }
        },
        "proof": {
          "type": "Ed25519Signature2018",
          "proofPurpose": "assertionMethod",
          "verificationMethod": "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW#keys-1",
          "created": "2024-04-03T01:16:09.837873Z",
          "jws": "eyJhbGciOiJFZERTQSIsImNyaXQiOlsiYjY0Il0sImI2NCI6ZmFsc2V9..XMUnK1nLJI3jahunuS-ooEVWAKgN3VwiUc0cm2xiFNMdgnBqYi6-n-uPdpDJls6-7BXlLhR4W4nGlPrptQFTBA"
        },
        "holder": "did:infra:01:5GpEYnXBoLgvzyWe4Defitp5UV25xZUiUCJM2xNgkDXkM4NW"
      }""";
    setState(() {
      data = InfraSS58DID.verifyPresentation(credential) ? 'True': 'False';
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
                onPressed: _generateSS58DID,
                child: const Text("generateSS58DID")),
            ElevatedButton(
                onPressed: _didToHexPublicKey,
                child: const Text("didToHexPublicKey")),
            ElevatedButton(
                onPressed: _ss58AddressToDID,
                child: const Text("ss58AddressToDID")),
            ElevatedButton(
                onPressed: _issueCredential,
                child: const Text("issueCredential")),
            ElevatedButton(
                onPressed: _verifyCredential,
                child: const Text("verifyCredential")),
            ElevatedButton(
                onPressed: _issuePresentation,
                child: const Text("issuePresentation")),
            ElevatedButton(
                onPressed: _verifyPresentation,
                child: const Text("verifyPresentation")),
            ElevatedButton(onPressed: _resolve, child: const Text("resolve")),
            Text(data)
          ],
        ),
      ),
    );
  }
}
