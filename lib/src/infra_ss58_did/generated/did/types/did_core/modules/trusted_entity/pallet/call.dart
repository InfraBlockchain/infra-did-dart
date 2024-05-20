// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i10;

import '../../../../AddAuthorizer/add_authorizer.dart' as _i3;
import '../../../../AddIssuerRaw/add_issuer_raw.dart' as _i4;
import '../../../../AddVerifierRaw/add_verifier_raw.dart' as _i7;
import '../../../../DidSignatureWithNonce/did_signature_with_nonce.dart' as _i5;
import '../../../../RemoveAuthorizerRaw/remove_authorizer_raw.dart' as _i9;
import '../../../../RemoveIssuerRaw/remove_issuer_raw.dart' as _i6;
import '../../../../RemoveVerifierRaw/remove_verifier_raw.dart' as _i8;

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

  NewAuthorizer newAuthorizer({required _i3.AddAuthorizer addAuthorizer}) {
    return NewAuthorizer(addAuthorizer: addAuthorizer);
  }

  AddIssuer addIssuer({
    required _i4.AddIssuerRaw addIssuer,
    required List<_i5.DidSignatureWithNonce> proof,
  }) {
    return AddIssuer(
      addIssuer: addIssuer,
      proof: proof,
    );
  }

  RemoveIssuer removeIssuer({
    required _i6.RemoveIssuerRaw removeIssuer,
    required List<_i5.DidSignatureWithNonce> proof,
  }) {
    return RemoveIssuer(
      removeIssuer: removeIssuer,
      proof: proof,
    );
  }

  AddVerifier addVerifier({
    required _i7.AddVerifierRaw addVerifier,
    required List<_i5.DidSignatureWithNonce> proof,
  }) {
    return AddVerifier(
      addVerifier: addVerifier,
      proof: proof,
    );
  }

  RemoveVerifier removeVerifier({
    required _i8.RemoveVerifierRaw removeVerifier,
    required List<_i5.DidSignatureWithNonce> proof,
  }) {
    return RemoveVerifier(
      removeVerifier: removeVerifier,
      proof: proof,
    );
  }

  RemoveAuthorizer removeAuthorizer({
    required _i9.RemoveAuthorizerRaw removal,
    required List<_i5.DidSignatureWithNonce> proof,
  }) {
    return RemoveAuthorizer(
      removal: removal,
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
        return NewAuthorizer._decode(input);
      case 1:
        return AddIssuer._decode(input);
      case 2:
        return RemoveIssuer._decode(input);
      case 3:
        return AddVerifier._decode(input);
      case 4:
        return RemoveVerifier._decode(input);
      case 5:
        return RemoveAuthorizer._decode(input);
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
      case NewAuthorizer:
        (value as NewAuthorizer).encodeTo(output);
        break;
      case AddIssuer:
        (value as AddIssuer).encodeTo(output);
        break;
      case RemoveIssuer:
        (value as RemoveIssuer).encodeTo(output);
        break;
      case AddVerifier:
        (value as AddVerifier).encodeTo(output);
        break;
      case RemoveVerifier:
        (value as RemoveVerifier).encodeTo(output);
        break;
      case RemoveAuthorizer:
        (value as RemoveAuthorizer).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case NewAuthorizer:
        return (value as NewAuthorizer)._sizeHint();
      case AddIssuer:
        return (value as AddIssuer)._sizeHint();
      case RemoveIssuer:
        return (value as RemoveIssuer)._sizeHint();
      case AddVerifier:
        return (value as AddVerifier)._sizeHint();
      case RemoveVerifier:
        return (value as RemoveVerifier)._sizeHint();
      case RemoveAuthorizer:
        return (value as RemoveAuthorizer)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::new_authorizer`].
class NewAuthorizer extends Call {
  const NewAuthorizer({required this.addAuthorizer});

  factory NewAuthorizer._decode(_i1.Input input) {
    return NewAuthorizer(addAuthorizer: _i3.AddAuthorizer.codec.decode(input));
  }

  /// AddAuthorizer<T>
  final _i3.AddAuthorizer addAuthorizer;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'new_authorizer': {'addAuthorizer': addAuthorizer.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.AddAuthorizer.codec.sizeHint(addAuthorizer);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.AddAuthorizer.codec.encodeTo(
      addAuthorizer,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is NewAuthorizer && other.addAuthorizer == addAuthorizer;

  @override
  int get hashCode => addAuthorizer.hashCode;
}

/// See [`Pallet::add_issuer`].
class AddIssuer extends Call {
  const AddIssuer({
    required this.addIssuer,
    required this.proof,
  });

  factory AddIssuer._decode(_i1.Input input) {
    return AddIssuer(
      addIssuer: _i4.AddIssuerRaw.codec.decode(input),
      proof: const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
              _i5.DidSignatureWithNonce.codec)
          .decode(input),
    );
  }

  /// AddIssuerRaw<T>
  final _i4.AddIssuerRaw addIssuer;

  /// Vec<DidSignatureWithNonce<T>>
  final List<_i5.DidSignatureWithNonce> proof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'add_issuer': {
          'addIssuer': addIssuer.toJson(),
          'proof': proof.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i4.AddIssuerRaw.codec.sizeHint(addIssuer);
    size = size +
        const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
                _i5.DidSignatureWithNonce.codec)
            .sizeHint(proof);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i4.AddIssuerRaw.codec.encodeTo(
      addIssuer,
      output,
    );
    const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
            _i5.DidSignatureWithNonce.codec)
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
      other is AddIssuer &&
          other.addIssuer == addIssuer &&
          _i10.listsEqual(
            other.proof,
            proof,
          );

  @override
  int get hashCode => Object.hash(
        addIssuer,
        proof,
      );
}

/// See [`Pallet::remove_issuer`].
class RemoveIssuer extends Call {
  const RemoveIssuer({
    required this.removeIssuer,
    required this.proof,
  });

  factory RemoveIssuer._decode(_i1.Input input) {
    return RemoveIssuer(
      removeIssuer: _i6.RemoveIssuerRaw.codec.decode(input),
      proof: const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
              _i5.DidSignatureWithNonce.codec)
          .decode(input),
    );
  }

  /// RemoveIssuerRaw<T>
  final _i6.RemoveIssuerRaw removeIssuer;

  /// Vec<DidSignatureWithNonce<T>>
  final List<_i5.DidSignatureWithNonce> proof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'remove_issuer': {
          'removeIssuer': removeIssuer.toJson(),
          'proof': proof.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i6.RemoveIssuerRaw.codec.sizeHint(removeIssuer);
    size = size +
        const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
                _i5.DidSignatureWithNonce.codec)
            .sizeHint(proof);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i6.RemoveIssuerRaw.codec.encodeTo(
      removeIssuer,
      output,
    );
    const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
            _i5.DidSignatureWithNonce.codec)
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
      other is RemoveIssuer &&
          other.removeIssuer == removeIssuer &&
          _i10.listsEqual(
            other.proof,
            proof,
          );

  @override
  int get hashCode => Object.hash(
        removeIssuer,
        proof,
      );
}

/// See [`Pallet::add_verifier`].
class AddVerifier extends Call {
  const AddVerifier({
    required this.addVerifier,
    required this.proof,
  });

  factory AddVerifier._decode(_i1.Input input) {
    return AddVerifier(
      addVerifier: _i7.AddVerifierRaw.codec.decode(input),
      proof: const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
              _i5.DidSignatureWithNonce.codec)
          .decode(input),
    );
  }

  /// AddVerifierRaw<T>
  final _i7.AddVerifierRaw addVerifier;

  /// Vec<DidSignatureWithNonce<T>>
  final List<_i5.DidSignatureWithNonce> proof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'add_verifier': {
          'addVerifier': addVerifier.toJson(),
          'proof': proof.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i7.AddVerifierRaw.codec.sizeHint(addVerifier);
    size = size +
        const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
                _i5.DidSignatureWithNonce.codec)
            .sizeHint(proof);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i7.AddVerifierRaw.codec.encodeTo(
      addVerifier,
      output,
    );
    const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
            _i5.DidSignatureWithNonce.codec)
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
      other is AddVerifier &&
          other.addVerifier == addVerifier &&
          _i10.listsEqual(
            other.proof,
            proof,
          );

  @override
  int get hashCode => Object.hash(
        addVerifier,
        proof,
      );
}

/// See [`Pallet::remove_verifier`].
class RemoveVerifier extends Call {
  const RemoveVerifier({
    required this.removeVerifier,
    required this.proof,
  });

  factory RemoveVerifier._decode(_i1.Input input) {
    return RemoveVerifier(
      removeVerifier: _i8.RemoveVerifierRaw.codec.decode(input),
      proof: const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
              _i5.DidSignatureWithNonce.codec)
          .decode(input),
    );
  }

  /// RemoveVerifierRaw<T>
  final _i8.RemoveVerifierRaw removeVerifier;

  /// Vec<DidSignatureWithNonce<T>>
  final List<_i5.DidSignatureWithNonce> proof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'remove_verifier': {
          'removeVerifier': removeVerifier.toJson(),
          'proof': proof.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i8.RemoveVerifierRaw.codec.sizeHint(removeVerifier);
    size = size +
        const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
                _i5.DidSignatureWithNonce.codec)
            .sizeHint(proof);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i8.RemoveVerifierRaw.codec.encodeTo(
      removeVerifier,
      output,
    );
    const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
            _i5.DidSignatureWithNonce.codec)
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
      other is RemoveVerifier &&
          other.removeVerifier == removeVerifier &&
          _i10.listsEqual(
            other.proof,
            proof,
          );

  @override
  int get hashCode => Object.hash(
        removeVerifier,
        proof,
      );
}

/// See [`Pallet::remove_authorizer`].
class RemoveAuthorizer extends Call {
  const RemoveAuthorizer({
    required this.removal,
    required this.proof,
  });

  factory RemoveAuthorizer._decode(_i1.Input input) {
    return RemoveAuthorizer(
      removal: _i9.RemoveAuthorizerRaw.codec.decode(input),
      proof: const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
              _i5.DidSignatureWithNonce.codec)
          .decode(input),
    );
  }

  /// RemoveAuthorizerRaw<T>
  final _i9.RemoveAuthorizerRaw removal;

  /// Vec<DidSignatureWithNonce<T>>
  final List<_i5.DidSignatureWithNonce> proof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'remove_authorizer': {
          'removal': removal.toJson(),
          'proof': proof.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i9.RemoveAuthorizerRaw.codec.sizeHint(removal);
    size = size +
        const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
                _i5.DidSignatureWithNonce.codec)
            .sizeHint(proof);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i9.RemoveAuthorizerRaw.codec.encodeTo(
      removal,
      output,
    );
    const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
            _i5.DidSignatureWithNonce.codec)
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
      other is RemoveAuthorizer &&
          other.removal == removal &&
          _i10.listsEqual(
            other.proof,
            proof,
          );

  @override
  int get hashCode => Object.hash(
        removal,
        proof,
      );
}
