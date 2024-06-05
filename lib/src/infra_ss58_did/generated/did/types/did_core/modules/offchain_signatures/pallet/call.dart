// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../../../AddOffchainSignatureParams/add_offchain_signature_params.dart'
    as _i3;
import '../../../../AddOffchainSignaturePublicKey/add_offchain_signature_public_key.dart'
    as _i5;
import '../../../../DidSignature/did_signature_1.dart' as _i6;
import '../../../../DidSignature/did_signature_6.dart' as _i4;
import '../../../../RemoveOffchainSignatureParams/remove_offchain_signature_params.dart'
    as _i7;
import '../../../../RemoveOffchainSignaturePublicKey/remove_offchain_signature_public_key.dart'
    as _i8;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, Map<String, dynamic>>> toJson();
}

class $Call {
  const $Call();

  AddParams addParams({
    required _i3.AddOffchainSignatureParams params,
    required _i4.DidSignature signature,
  }) {
    return AddParams(
      params: params,
      signature: signature,
    );
  }

  AddPublicKey addPublicKey({
    required _i5.AddOffchainSignaturePublicKey publicKey,
    required _i6.DidSignature signature,
  }) {
    return AddPublicKey(
      publicKey: publicKey,
      signature: signature,
    );
  }

  RemoveParams removeParams({
    required _i7.RemoveOffchainSignatureParams remove,
    required _i4.DidSignature signature,
  }) {
    return RemoveParams(
      remove: remove,
      signature: signature,
    );
  }

  RemovePublicKey removePublicKey({
    required _i8.RemoveOffchainSignaturePublicKey remove,
    required _i6.DidSignature signature,
  }) {
    return RemovePublicKey(
      remove: remove,
      signature: signature,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return AddParams._decode(input);
      case 1:
        return AddPublicKey._decode(input);
      case 2:
        return RemoveParams._decode(input);
      case 3:
        return RemovePublicKey._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case AddParams:
        (value as AddParams).encodeTo(output);
        break;
      case AddPublicKey:
        (value as AddPublicKey).encodeTo(output);
        break;
      case RemoveParams:
        (value as RemoveParams).encodeTo(output);
        break;
      case RemovePublicKey:
        (value as RemovePublicKey).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case AddParams:
        return (value as AddParams)._sizeHint();
      case AddPublicKey:
        return (value as AddPublicKey)._sizeHint();
      case RemoveParams:
        return (value as RemoveParams)._sizeHint();
      case RemovePublicKey:
        return (value as RemovePublicKey)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::add_params`].
class AddParams extends Call {
  const AddParams({
    required this.params,
    required this.signature,
  });

  factory AddParams._decode(_i1.Input input) {
    return AddParams(
      params: _i3.AddOffchainSignatureParams.codec.decode(input),
      signature: _i4.DidSignature.codec.decode(input),
    );
  }

  /// AddOffchainSignatureParams<T>
  final _i3.AddOffchainSignatureParams params;

  /// DidSignature<SignatureParamsOwner>
  final _i4.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'add_params': {
          'params': params.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.AddOffchainSignatureParams.codec.sizeHint(params);
    size = size + _i4.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.AddOffchainSignatureParams.codec.encodeTo(
      params,
      output,
    );
    _i4.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddParams &&
          other.params == params &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        params,
        signature,
      );
}

/// See [`Pallet::add_public_key`].
class AddPublicKey extends Call {
  const AddPublicKey({
    required this.publicKey,
    required this.signature,
  });

  factory AddPublicKey._decode(_i1.Input input) {
    return AddPublicKey(
      publicKey: _i5.AddOffchainSignaturePublicKey.codec.decode(input),
      signature: _i6.DidSignature.codec.decode(input),
    );
  }

  /// AddOffchainSignaturePublicKey<T>
  final _i5.AddOffchainSignaturePublicKey publicKey;

  /// DidSignature<Controller>
  final _i6.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'add_public_key': {
          'publicKey': publicKey.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i5.AddOffchainSignaturePublicKey.codec.sizeHint(publicKey);
    size = size + _i6.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i5.AddOffchainSignaturePublicKey.codec.encodeTo(
      publicKey,
      output,
    );
    _i6.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddPublicKey &&
          other.publicKey == publicKey &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        publicKey,
        signature,
      );
}

/// See [`Pallet::remove_params`].
class RemoveParams extends Call {
  const RemoveParams({
    required this.remove,
    required this.signature,
  });

  factory RemoveParams._decode(_i1.Input input) {
    return RemoveParams(
      remove: _i7.RemoveOffchainSignatureParams.codec.decode(input),
      signature: _i4.DidSignature.codec.decode(input),
    );
  }

  /// RemoveOffchainSignatureParams<T>
  final _i7.RemoveOffchainSignatureParams remove;

  /// DidSignature<SignatureParamsOwner>
  final _i4.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'remove_params': {
          'remove': remove.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i7.RemoveOffchainSignatureParams.codec.sizeHint(remove);
    size = size + _i4.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i7.RemoveOffchainSignatureParams.codec.encodeTo(
      remove,
      output,
    );
    _i4.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveParams &&
          other.remove == remove &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        remove,
        signature,
      );
}

/// See [`Pallet::remove_public_key`].
class RemovePublicKey extends Call {
  const RemovePublicKey({
    required this.remove,
    required this.signature,
  });

  factory RemovePublicKey._decode(_i1.Input input) {
    return RemovePublicKey(
      remove: _i8.RemoveOffchainSignaturePublicKey.codec.decode(input),
      signature: _i6.DidSignature.codec.decode(input),
    );
  }

  /// RemoveOffchainSignaturePublicKey<T>
  final _i8.RemoveOffchainSignaturePublicKey remove;

  /// DidSignature<Controller>
  final _i6.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'remove_public_key': {
          'remove': remove.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i8.RemoveOffchainSignaturePublicKey.codec.sizeHint(remove);
    size = size + _i6.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i8.RemoveOffchainSignaturePublicKey.codec.encodeTo(
      remove,
      output,
    );
    _i6.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemovePublicKey &&
          other.remove == remove &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        remove,
        signature,
      );
}
