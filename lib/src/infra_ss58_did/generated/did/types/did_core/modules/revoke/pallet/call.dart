// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i8;

import '../../../../AddRegistry/add_registry.dart' as _i3;
import '../../../../DidSignatureWithNonce/did_signature_with_nonce.dart' as _i5;
import '../../../../RemoveRegistryRaw/remove_registry_raw.dart' as _i7;
import '../../../../RevokeRaw/revoke_raw.dart' as _i4;
import '../../../../UnRevokeRaw/un_revoke_raw.dart' as _i6;

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

  NewRegistry newRegistry({required _i3.AddRegistry addRegistry}) {
    return NewRegistry(addRegistry: addRegistry);
  }

  Revoke revoke({
    required _i4.RevokeRaw revoke,
    required List<_i5.DidSignatureWithNonce> proof,
  }) {
    return Revoke(
      revoke: revoke,
      proof: proof,
    );
  }

  Unrevoke unrevoke({
    required _i6.UnRevokeRaw unrevoke,
    required List<_i5.DidSignatureWithNonce> proof,
  }) {
    return Unrevoke(
      unrevoke: unrevoke,
      proof: proof,
    );
  }

  RemoveRegistry removeRegistry({
    required _i7.RemoveRegistryRaw removal,
    required List<_i5.DidSignatureWithNonce> proof,
  }) {
    return RemoveRegistry(
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
        return NewRegistry._decode(input);
      case 1:
        return Revoke._decode(input);
      case 2:
        return Unrevoke._decode(input);
      case 3:
        return RemoveRegistry._decode(input);
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
      case NewRegistry:
        (value as NewRegistry).encodeTo(output);
        break;
      case Revoke:
        (value as Revoke).encodeTo(output);
        break;
      case Unrevoke:
        (value as Unrevoke).encodeTo(output);
        break;
      case RemoveRegistry:
        (value as RemoveRegistry).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case NewRegistry:
        return (value as NewRegistry)._sizeHint();
      case Revoke:
        return (value as Revoke)._sizeHint();
      case Unrevoke:
        return (value as Unrevoke)._sizeHint();
      case RemoveRegistry:
        return (value as RemoveRegistry)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::new_registry`].
class NewRegistry extends Call {
  const NewRegistry({required this.addRegistry});

  factory NewRegistry._decode(_i1.Input input) {
    return NewRegistry(addRegistry: _i3.AddRegistry.codec.decode(input));
  }

  /// AddRegistry<T>
  final _i3.AddRegistry addRegistry;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'new_registry': {'addRegistry': addRegistry.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.AddRegistry.codec.sizeHint(addRegistry);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.AddRegistry.codec.encodeTo(
      addRegistry,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is NewRegistry && other.addRegistry == addRegistry;

  @override
  int get hashCode => addRegistry.hashCode;
}

/// See [`Pallet::revoke`].
class Revoke extends Call {
  const Revoke({
    required this.revoke,
    required this.proof,
  });

  factory Revoke._decode(_i1.Input input) {
    return Revoke(
      revoke: _i4.RevokeRaw.codec.decode(input),
      proof: const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
              _i5.DidSignatureWithNonce.codec)
          .decode(input),
    );
  }

  /// RevokeRaw<T>
  final _i4.RevokeRaw revoke;

  /// Vec<DidSignatureWithNonce<T>>
  final List<_i5.DidSignatureWithNonce> proof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'revoke': {
          'revoke': revoke.toJson(),
          'proof': proof.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i4.RevokeRaw.codec.sizeHint(revoke);
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
    _i4.RevokeRaw.codec.encodeTo(
      revoke,
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
      other is Revoke &&
          other.revoke == revoke &&
          _i8.listsEqual(
            other.proof,
            proof,
          );

  @override
  int get hashCode => Object.hash(
        revoke,
        proof,
      );
}

/// See [`Pallet::unrevoke`].
class Unrevoke extends Call {
  const Unrevoke({
    required this.unrevoke,
    required this.proof,
  });

  factory Unrevoke._decode(_i1.Input input) {
    return Unrevoke(
      unrevoke: _i6.UnRevokeRaw.codec.decode(input),
      proof: const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
              _i5.DidSignatureWithNonce.codec)
          .decode(input),
    );
  }

  /// UnRevokeRaw<T>
  final _i6.UnRevokeRaw unrevoke;

  /// Vec<DidSignatureWithNonce<T>>
  final List<_i5.DidSignatureWithNonce> proof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'unrevoke': {
          'unrevoke': unrevoke.toJson(),
          'proof': proof.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i6.UnRevokeRaw.codec.sizeHint(unrevoke);
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
    _i6.UnRevokeRaw.codec.encodeTo(
      unrevoke,
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
      other is Unrevoke &&
          other.unrevoke == unrevoke &&
          _i8.listsEqual(
            other.proof,
            proof,
          );

  @override
  int get hashCode => Object.hash(
        unrevoke,
        proof,
      );
}

/// See [`Pallet::remove_registry`].
class RemoveRegistry extends Call {
  const RemoveRegistry({
    required this.removal,
    required this.proof,
  });

  factory RemoveRegistry._decode(_i1.Input input) {
    return RemoveRegistry(
      removal: _i7.RemoveRegistryRaw.codec.decode(input),
      proof: const _i1.SequenceCodec<_i5.DidSignatureWithNonce>(
              _i5.DidSignatureWithNonce.codec)
          .decode(input),
    );
  }

  /// RemoveRegistryRaw<T>
  final _i7.RemoveRegistryRaw removal;

  /// Vec<DidSignatureWithNonce<T>>
  final List<_i5.DidSignatureWithNonce> proof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'remove_registry': {
          'removal': removal.toJson(),
          'proof': proof.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i7.RemoveRegistryRaw.codec.sizeHint(removal);
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
    _i7.RemoveRegistryRaw.codec.encodeTo(
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
      other is RemoveRegistry &&
          other.removal == removal &&
          _i8.listsEqual(
            other.proof,
            proof,
          );

  @override
  int get hashCode => Object.hash(
        removal,
        proof,
      );
}
