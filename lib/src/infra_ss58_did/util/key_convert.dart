import "dart:typed_data";
import "package:convert/convert.dart";
import "package:substrate_bip39/substrate_bip39.dart";
import "dart:convert";
import "package:pinenacl/tweetnacl.dart";
import "package:polkadart_keyring/polkadart_keyring.dart" show KeyPair, Keyring;
import 'package:bs58/bs58.dart';

/// Converts a URI to a public key.
///
/// Takes a URI as input and returns the corresponding public key as a list of integers.
/// The URI is used to generate a key pair using the ed25519 algorithm, and then the public key is extracted from the key pair.
Future<List<int>> publicKeyFromUri(String uri) async {
  final keypair = await KeyPair.ed25519.fromUri(uri);
  return keypair.publicKey.bytes;
}

/// Converts a seed to a public key.
///
/// Takes a seed as input and returns the corresponding public key as a list of integers.
/// The seed is used to generate a key pair using the ed25519 algorithm, and then the public key is extracted from the key pair.
List<int> publicKeyFromSeed(String seed) {
  final keypair =
      KeyPair.ed25519.fromSeed(Uint8List.fromList(hex.decode(seed)));
  return keypair.publicKey.bytes;
}

/// Converts a URI to a private key.
///
/// Takes a URI as input and returns the corresponding private key as a list of integers.
/// The URI is used to generate a seed using the ed25519 algorithm, and then the seed is returned as the private key.
Future<List<int>> privateKeyFromUri(String uri) async {
  final seed = await SubstrateBip39.ed25519.seedFromUri(uri);
  return seed;
}

/// Converts a URI to an extended private key.
///
/// Takes a URI as input and returns the corresponding extended private key as a list of integers.
/// The URI is used to generate a public key and a private key using the ed25519 algorithm.
/// The public key and private key are then concatenated to form the extended private key.
Future<List<int>> extendedPrivateKeyFromUri(String uri) async {
  final publicKey = await publicKeyFromUri(uri);
  final privateKey = await privateKeyFromUri(uri);
  List<int> extendedPrivateKey = [];
  extendedPrivateKey.addAll(privateKey);
  extendedPrivateKey.addAll(publicKey);
  return extendedPrivateKey;
}

/// Converts a seed to an extended private key.
///
/// Takes a seed as input and returns the corresponding extended private key as a list of integers.
/// The seed is used to generate a public key and a private key using the ed25519 algorithm.
/// The public key and private key are then concatenated to form the extended private key.
List<int> extendedPrivateKeyFromSeed(String seed) {
  final publicKey = publicKeyFromSeed(seed);
  final privateKey = hex.decode(seed);
  List<int> extendedPrivateKey = [];
  extendedPrivateKey.addAll(privateKey);
  extendedPrivateKey.addAll(publicKey);
  return extendedPrivateKey;
}

/// Converts an address to a public key.
///
/// Takes an address as input and returns the corresponding public key as a list of integers.
/// The address is decoded using the Keyring library, and then the decoded public key is returned.
List<int> publicKeyFromAddress(String address) {
  final keyring = Keyring();
  final decodedPublicKey = keyring.decodeAddress(address);
  return decodedPublicKey.toList();
}

String base58FromEd25519PublicKey(
  List<int> publicKey,
) {
  return base58.encode(Uint8List.fromList(publicKey));
}

String multibaseFromEd25519PublicKey(
  List<int> publicKey,
) {
  String base58Encoded = base58.encode(Uint8List.fromList(publicKey));
  return 'z$base58Encoded';
}

Map<String, dynamic> ed25519JwkFromEd25519PublicKey(
    List<int> publicKey, String keyId) {
  return {
    "alg": "EdDSA",
    "kty": "OKP",
    "crv": "Ed25519",
    "kid": keyId,
    "x": base64Url.encode(publicKey),
  };
}

List<int> ed25519PublicKeyFromBase58(String base58Encoded) {
  return base58.decode(base58Encoded);
}

List<int> ed25519PublicKeyFromMultibase(
  String multibase,
) {
  return base58.decode(multibase.substring(1));
}

List<int> ed25519PublicKeyFromEd25519Jwk(Map<String, dynamic> jwk) {
  var x = jwk["x"];
  return base64Url.decode(x);
}

Uint8List x25519PublicKeyFromEd25519PublicKey(List<int> publicKey) {
  Uint8List x25519Pk = Uint8List.fromList(List.filled(32, 0));
  Uint8List ed25519Pk = Uint8List.fromList(publicKey);
  TweetNaClExt.crypto_sign_ed25519_pk_to_x25519_pk(x25519Pk, ed25519Pk);
  return x25519Pk;
}

/// Converts an Ed25519 public key to a X25519 public key and then to a JWK (JSON Web Key) representation.
/// Returns the JWK.
Map<String, dynamic> x25519JwkFromEd25519PublicKey(
    List<int> publicKey, String keyId) {
  Uint8List x25519Pk = Uint8List.fromList(List.filled(32, 0));
  Uint8List ed25519Pk = Uint8List.fromList(publicKey);
  TweetNaClExt.crypto_sign_ed25519_pk_to_x25519_pk(x25519Pk, ed25519Pk);
  final jwk = {
    "kty": "OKP",
    "crv": "X25519",
    "kid": keyId,
    "x": base64Url.encode(x25519Pk),
  };
  return jwk;
}

/// Converts an Ed25519 private key to a X25519 private key and then to a JWK (JSON Web Key) representation.
/// Returns a Future that completes with the JWK.
Future<Map<String, dynamic>> x25519JwkFromEd25519PrivateKey(
  List<int> privateKey,
) async {
  Uint8List x25519Pk = Uint8List.fromList(List.filled(32, 0));
  Uint8List ed25519Pk =
      Uint8List.fromList(publicKeyFromSeed(hex.encode(privateKey)));
  TweetNaClExt.crypto_sign_ed25519_pk_to_x25519_pk(x25519Pk, ed25519Pk);
  Uint8List x25519Sk = Uint8List.fromList(List.filled(32, 0));
  Uint8List ed25519Sk = Uint8List.fromList(privateKey);
  TweetNaClExt.crypto_sign_ed25519_sk_to_x25519_sk(x25519Sk, ed25519Sk);

  final jwk = {
    "kty": "OKP",
    "crv": "X25519",
    "x": base64Url.encode(x25519Pk),
    "d": base64Url.encode(x25519Sk),
  };
  return jwk;
}

/// Converts a X25519 JWK (JSON Web Key) to a X25519 public key.
/// Returns the X25519 public key.
List<int> publicKeyfromX25519Jwk(Map<String, dynamic> jwk) {
  Base64Codec base64 = const Base64Codec();
  final nomalizeBase64 = base64.normalize(jwk["x"]);
  return base64Url.decode(nomalizeBase64);
}

/// Converts a X25519 JWK (JSON Web Key) to a X25519 private key.
/// Returns the X25519 private key.
List<int> privateKeyfromX25519Jwk(Map<String, dynamic> jwk) {
  Base64Codec base64 = const Base64Codec();
  final nomalizeBase64 = base64.normalize(jwk["d"]);
  return base64Url.decode(nomalizeBase64);
}
