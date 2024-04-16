import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:infra_did_dart/src/infra_ss58_did/model/infra_did_set.dart';
import 'package:infra_did_dart/src/infra_ss58_did/util/util.dart';
import './bindings.dart';
import 'model/did_document.dart';

const DYNAMIC_LIBRARY_FILE_NAME_ANDROID = "libinfra_did_binding.so";
const DYNAMIC_LIBRARY_FILE_NAME_MACOS = "libinfra_did_binding.dylib";

/// Wraps the native functions and converts specific data types in order to
/// handle C strings.

class InfraSS58DID {
  static final InfraSS58DIDBindings _bindings =
      InfraSS58DIDBindings(InfraSS58DID._loadLibrary());

  static DynamicLibrary _loadLibrary() {
    return Platform.isAndroid
        ? DynamicLibrary.open(DYNAMIC_LIBRARY_FILE_NAME_ANDROID)
        : Platform.isMacOS
            ? DynamicLibrary.open(DYNAMIC_LIBRARY_FILE_NAME_MACOS)
            : DynamicLibrary.process();
  }
  
  static void _checkBinding() {
    if (_bindings == null) throw InfraDIDException(0, "The library is not initialized 🙁");
  }

  static InfraDidSet generateSS58DID(String networkId) {
    try {
      _checkBinding();

      final networkIdPtr = networkId.toNativeUtf8().cast<Utf8>();

      // Native call
      final ptrResult = _bindings.generate_ss58_did(networkIdPtr);
      if (ptrResult.address == nullptr.address) throw lastError();

      // Cast the result pointer to a Dart string
      final result = ptrResult.cast<Utf8>().toDartString();

      // Free the native value
      InfraSS58DID._free(result);

      return InfraDidSet.fromJson(result); 
    } catch(e) {
      throw InfraDIDException(1, e.toString());
    }
  }

  static String generateSS58DIDFromPhrase(String suri, String networkId) {
    try {
      _checkBinding();

      final suriPtr = suri.toNativeUtf8().cast<Utf8>();
      final networkIdPtr = networkId.toNativeUtf8().cast<Utf8>();

      // Native call
      final ptrResult =
      _bindings.generate_ss58_did_from_phrase(suriPtr, networkIdPtr);
      if (ptrResult.address == nullptr.address) throw lastError();

      // Cast the result pointer to a Dart string
      final result = ptrResult.cast<Utf8>().toDartString();

      // Free the native value
      InfraSS58DID._free(result);

      return result;
    } catch(e) {
      throw InfraDIDException(2, e.toString());
    }
  }

  static String didToHexPublicKey(String did) {
    try {
      _checkBinding();

      final didPtr = did.toNativeUtf8().cast<Utf8>();

      // Native call
      final ptrResult = _bindings.did_to_hex_public_key(didPtr);
      if (ptrResult.address == nullptr.address) throw lastError();

      // Cast the result pointer to a Dart string
      final result = ptrResult.cast<Utf8>().toDartString();

      // Free the native value
      InfraSS58DID._free(result);

      return result;
    } catch(e) {
      throw InfraDIDException(3, e.toString());
    }
  }

  static String ss58AddressToDID(String address, String networkId) {
    try {
      _checkBinding();

      final addressPtr = address.toNativeUtf8().cast<Utf8>();
      final networkIdPtr = networkId.toNativeUtf8().cast<Utf8>();

      // Native call
      final ptrResult = _bindings.ss58_address_to_did(addressPtr, networkIdPtr);
      if (ptrResult.address == nullptr.address) throw lastError();

      // Cast the result pointer to a Dart string
      final result = ptrResult.cast<Utf8>().toDartString();

      // Clone the given result, so that the original string can be freed
      final resultCopy = "" + result;

      // Free the native value
      InfraSS58DID._free(result);

      return result;
    } catch(e) {
      throw InfraDIDException(4, e.toString());
    }
  }

  static InfraDidDocument resolve(String did) {
    try {
      _checkBinding();

      final didPtr = did.toNativeUtf8().cast<Utf8>();

      // Native call
      final ptrResult = _bindings.resolve(didPtr);
      if (ptrResult.address == nullptr.address) throw lastError();

      // Cast the result pointer to a Dart string
      final result = ptrResult.cast<Utf8>().toDartString();

      // Free the native value
      InfraSS58DID._free(result);

      return InfraDidDocument.fromStringJson(result);
    } catch(e) {
      throw InfraDIDException(5, e.toString());
    }
  }

  static String issueCredential(
      String did, String credentialJson, String hexPrivateKey) {
    _checkBinding();

    final didPtr = did.toNativeUtf8().cast<Utf8>();
    final credentialJsonPtr = credentialJson.toNativeUtf8().cast<Utf8>();
    final hexPrivateKeyPtr = hexPrivateKey.toNativeUtf8().cast<Utf8>();

    // Native call
    final ptrResult =
        _bindings.issue_credential(didPtr, credentialJsonPtr, hexPrivateKeyPtr);
    if (ptrResult.address == nullptr.address) throw lastError();

    // Cast the result pointer to a Dart string
    final result = ptrResult.cast<Utf8>().toDartString();

    // Clone the given result, so that the original string can be freed
    final resultCopy = "" + result;

    // Free the native value
    InfraSS58DID._free(result);

    return result;
  }

  static bool verifyCredential(String credentialJson) {
    _checkBinding();

    final credentialJsonPtr = credentialJson.toNativeUtf8().cast<Utf8>();

    // Native call
    final ptrResult = _bindings.verify_credential(credentialJsonPtr);
    if (ptrResult.address == nullptr.address) throw lastError();

    // Cast the result pointer to a Dart string
    final result = ptrResult.cast<Utf8>().toDartString();

    // Free the native value
    InfraSS58DID._free(result);

    return InfraSs58DidUtil.stringToBool(result);
  }

  static String issuePresentation(
      String did, String credentialJson, String hexPrivateKey) {
    _checkBinding();

    final didPtr = did.toNativeUtf8().cast<Utf8>();
    final credentialJsonPtr = credentialJson.toNativeUtf8().cast<Utf8>();
    final hexPrivateKeyPtr = hexPrivateKey.toNativeUtf8().cast<Utf8>();

    // Native call
    final ptrResult = _bindings.issue_presentation(
        didPtr, credentialJsonPtr, hexPrivateKeyPtr);
    if (ptrResult.address == nullptr.address) throw lastError();

    // Cast the result pointer to a Dart string
    final result = ptrResult.cast<Utf8>().toDartString();

    // Clone the given result, so that the original string can be freed
    final resultCopy = "" + result;

    // Free the native value
    InfraSS58DID._free(result);

    return result;
  }

  static bool verifyPresentation(String presentationJson) {
    _checkBinding();

    final presentationJsonPtr = presentationJson.toNativeUtf8().cast<Utf8>();

    // Native call
    final ptrResult = _bindings.verify_presentation(presentationJsonPtr);
    if (ptrResult.address == nullptr.address) throw lastError();

    // Cast the result pointer to a Dart string
    final result = ptrResult.cast<Utf8>().toDartString();

    // Free the native value
    InfraSS58DID._free(result);

    return InfraSs58DidUtil.stringToBool(result);
  }

  /// Releases the memory allocated to handle the given (result) value
  static void _free(String value) {
    final ptr = value.toNativeUtf8().cast<Utf8>();
    return _bindings.rust_cstr_free(ptr);
  }
}

class InfraDIDException implements Exception {
  int code;
  String message;
  InfraDIDException(this.code, this.message);

  @override
  String toString() {
    return 'InfraDIDException ($code): $message';
  }
}

InfraDIDException lastError() {
  final code = InfraSS58DID._bindings.get_error_code();
  final message_utf8 = InfraSS58DID._bindings.get_error_message();
  final message_string = message_utf8.address == nullptr.address
      ? 'Unable to get error message'
      : message_utf8.toDartString();

  return InfraDIDException(code, message_string);
}
