// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i8;

import '../../../../DidSignatureWithNonce/did_signature_with_nonce.dart' as _i6;
import '../../../../RemoveStatusListCredentialRaw/remove_status_list_credential_raw.dart'
    as _i7;
import '../../../../StatusListCredentialId/status_list_credential_id.dart'
    as _i3;
import '../../../../StatusListCredentialWithPolicy/status_list_credential_with_policy.dart'
    as _i4;
import '../../../../UpdateStatusListCredentialRaw/update_status_list_credential_raw.dart'
    as _i5;

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

  Map<String, Map<String, dynamic>> toJson();
}

class $Call {
  const $Call();

  Create create({
    required _i3.StatusListCredentialId id,
    required _i4.StatusListCredentialWithPolicy credential,
  }) {
    return Create(
      id: id,
      credential: credential,
    );
  }

  Update update({
    required _i5.UpdateStatusListCredentialRaw updateCredential,
    required List<_i6.DidSignatureWithNonce> proof,
  }) {
    return Update(
      updateCredential: updateCredential,
      proof: proof,
    );
  }

  Remove remove({
    required _i7.RemoveStatusListCredentialRaw removeCredential,
    required List<_i6.DidSignatureWithNonce> proof,
  }) {
    return Remove(
      removeCredential: removeCredential,
      proof: proof,
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
        return Create._decode(input);
      case 1:
        return Update._decode(input);
      case 2:
        return Remove._decode(input);
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
      case Create:
        (value as Create).encodeTo(output);
        break;
      case Update:
        (value as Update).encodeTo(output);
        break;
      case Remove:
        (value as Remove).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case Create:
        return (value as Create)._sizeHint();
      case Update:
        return (value as Update)._sizeHint();
      case Remove:
        return (value as Remove)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::create`].
class Create extends Call {
  const Create({
    required this.id,
    required this.credential,
  });

  factory Create._decode(_i1.Input input) {
    return Create(
      id: const _i1.U8ArrayCodec(32).decode(input),
      credential: _i4.StatusListCredentialWithPolicy.codec.decode(input),
    );
  }

  /// StatusListCredentialId
  final _i3.StatusListCredentialId id;

  /// StatusListCredentialWithPolicy<T>
  final _i4.StatusListCredentialWithPolicy credential;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'create': {
          'id': id.toList(),
          'credential': credential.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.StatusListCredentialIdCodec().sizeHint(id);
    size = size + _i4.StatusListCredentialWithPolicy.codec.sizeHint(credential);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      id,
      output,
    );
    _i4.StatusListCredentialWithPolicy.codec.encodeTo(
      credential,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Create &&
          _i8.listsEqual(
            other.id,
            id,
          ) &&
          other.credential == credential;

  @override
  int get hashCode => Object.hash(
        id,
        credential,
      );
}

/// See [`Pallet::update`].
class Update extends Call {
  const Update({
    required this.updateCredential,
    required this.proof,
  });

  factory Update._decode(_i1.Input input) {
    return Update(
      updateCredential: _i5.UpdateStatusListCredentialRaw.codec.decode(input),
      proof: const _i1.SequenceCodec<_i6.DidSignatureWithNonce>(
              _i6.DidSignatureWithNonce.codec)
          .decode(input),
    );
  }

  /// UpdateStatusListCredentialRaw<T>
  final _i5.UpdateStatusListCredentialRaw updateCredential;

  /// Vec<DidSignatureWithNonce<T>>
  final List<_i6.DidSignatureWithNonce> proof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'update': {
          'updateCredential': updateCredential.toJson(),
          'proof': proof.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        _i5.UpdateStatusListCredentialRaw.codec.sizeHint(updateCredential);
    size = size +
        const _i1.SequenceCodec<_i6.DidSignatureWithNonce>(
                _i6.DidSignatureWithNonce.codec)
            .sizeHint(proof);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i5.UpdateStatusListCredentialRaw.codec.encodeTo(
      updateCredential,
      output,
    );
    const _i1.SequenceCodec<_i6.DidSignatureWithNonce>(
            _i6.DidSignatureWithNonce.codec)
        .encodeTo(
      proof,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Update &&
          other.updateCredential == updateCredential &&
          _i8.listsEqual(
            other.proof,
            proof,
          );

  @override
  int get hashCode => Object.hash(
        updateCredential,
        proof,
      );
}

/// See [`Pallet::remove`].
class Remove extends Call {
  const Remove({
    required this.removeCredential,
    required this.proof,
  });

  factory Remove._decode(_i1.Input input) {
    return Remove(
      removeCredential: _i7.RemoveStatusListCredentialRaw.codec.decode(input),
      proof: const _i1.SequenceCodec<_i6.DidSignatureWithNonce>(
              _i6.DidSignatureWithNonce.codec)
          .decode(input),
    );
  }

  /// RemoveStatusListCredentialRaw<T>
  final _i7.RemoveStatusListCredentialRaw removeCredential;

  /// Vec<DidSignatureWithNonce<T>>
  final List<_i6.DidSignatureWithNonce> proof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'remove': {
          'removeCredential': removeCredential.toJson(),
          'proof': proof.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        _i7.RemoveStatusListCredentialRaw.codec.sizeHint(removeCredential);
    size = size +
        const _i1.SequenceCodec<_i6.DidSignatureWithNonce>(
                _i6.DidSignatureWithNonce.codec)
            .sizeHint(proof);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i7.RemoveStatusListCredentialRaw.codec.encodeTo(
      removeCredential,
      output,
    );
    const _i1.SequenceCodec<_i6.DidSignatureWithNonce>(
            _i6.DidSignatureWithNonce.codec)
        .encodeTo(
      proof,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Remove &&
          other.removeCredential == removeCredential &&
          _i8.listsEqual(
            other.proof,
            proof,
          );

  @override
  int get hashCode => Object.hash(
        removeCredential,
        proof,
      );
}
