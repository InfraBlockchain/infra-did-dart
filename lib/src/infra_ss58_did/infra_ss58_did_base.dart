import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:bip39/bip39.dart' as bip39;
import './bindings.dart';

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

  /// Computes a greeting for the given name using the native function
  static String randomPhrase(int digits) {
    if (_bindings == null) return "ERROR: The library is not initialized 🙁";

    // Native call
    final ptrResult = _bindings.random_phrase(digits);

    // Cast the result pointer to a Dart string
    final result = ptrResult.cast<Utf8>().toDartString();

    // Clone the given result, so that the original string can be freed
    final resultCopy = "" + result;

    // Free the native value
    InfraSS58DID._free(result);

    return resultCopy;
  }

  static String substrateAddress(String seed, int prefix) {
    if (_bindings == null) return "ERROR: The library is not initialized 🙁";

    final seedPtr = seed.toNativeUtf8().cast<Utf8>();

    // Native call
    final ptrResult = _bindings.substrate_address(seedPtr, prefix);

    // Cast the result pointer to a Dart string
    final result = ptrResult.cast<Utf8>().toDartString();

    // Clone the given result, so that the original string can be freed
    final resultCopy = "" + result;

    // Free the native value
    InfraSS58DID._free(result);

    return result;
  }

  static String generateSS58DID(String networkId) {
    if (_bindings == null) return "ERROR: The library is not initialized 🙁";

    final networkIdPtr = networkId.toNativeUtf8().cast<Utf8>();

    // Native call
    final ptrResult = _bindings.generate_ss58_did(networkIdPtr);

    // Cast the result pointer to a Dart string
    final result = ptrResult.cast<Utf8>().toDartString();

    // Clone the given result, so that the original string can be freed
    final resultCopy = "" + result;

    // Free the native value
    InfraSS58DID._free(result);

    return result;
  }

  static String didToHexPublicKey(String did) {
    if (_bindings == null) return "ERROR: The library is not initialized 🙁";

    final didPtr = did.toNativeUtf8().cast<Utf8>();

    // Native call
    final ptrResult = _bindings.did_to_hex_public_key(didPtr);

    // Cast the result pointer to a Dart string
    final result = ptrResult.cast<Utf8>().toDartString();

    // Clone the given result, so that the original string can be freed
    final resultCopy = "" + result;

    // Free the native value
    InfraSS58DID._free(result);

    return result;
  }

  static String ss58AdressToDID(String address, String networkId) {
    if (_bindings == null) return "ERROR: The library is not initialized 🙁";

    final addressPtr = address.toNativeUtf8().cast<Utf8>();
    final networkIdPtr = networkId.toNativeUtf8().cast<Utf8>();

    // Native call
    final ptrResult = _bindings.ss58_address_to_did(addressPtr, networkIdPtr);

    // Cast the result pointer to a Dart string
    final result = ptrResult.cast<Utf8>().toDartString();

    // Clone the given result, so that the original string can be freed
    final resultCopy = "" + result;

    // Free the native value
    InfraSS58DID._free(result);

    return result;
  }

  /// Releases the memory allocated to handle the given (result) value
  static void _free(String value) {
    final ptr = value.toNativeUtf8().cast<Utf8>();
    return _bindings.rust_cstr_free(ptr);
  }
}
