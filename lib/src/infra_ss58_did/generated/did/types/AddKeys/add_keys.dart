// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../Did/did.dart' as _i2;
import '../UncheckedDidKey/unchecked_did_key.dart' as _i3;

class AddKeys {
  const AddKeys({
    required this.did,
    required this.keys,
    required this.nonce,
  });

  factory AddKeys.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Did
  final _i2.Did did;

  /// Vec<UncheckedDidKey>
  final List<_i3.UncheckedDidKey> keys;

  /// T::BlockNumber
  final int nonce;

  static const $AddKeysCodec codec = $AddKeysCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'did': did.toList(),
        'keys': keys.map((value) => value.toJson()).toList(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddKeys &&
          _i5.listsEqual(
            other.did,
            did,
          ) &&
          _i5.listsEqual(
            other.keys,
            keys,
          ) &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        did,
        keys,
        nonce,
      );
}

class $AddKeysCodec with _i1.Codec<AddKeys> {
  const $AddKeysCodec();

  @override
  void encodeTo(
    AddKeys obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.did,
      output,
    );
    const _i1.SequenceCodec<_i3.UncheckedDidKey>(_i3.UncheckedDidKey.codec)
        .encodeTo(
      obj.keys,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  AddKeys decode(_i1.Input input) {
    return AddKeys(
      did: const _i1.U8ArrayCodec(32).decode(input),
      keys: const _i1.SequenceCodec<_i3.UncheckedDidKey>(
              _i3.UncheckedDidKey.codec)
          .decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AddKeys obj) {
    int size = 0;
    size = size + const _i2.DidCodec().sizeHint(obj.did);
    size = size +
        const _i1.SequenceCodec<_i3.UncheckedDidKey>(_i3.UncheckedDidKey.codec)
            .sizeHint(obj.keys);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
