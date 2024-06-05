// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../b_tree_set_3.dart' as _i3;
import '../Did/did.dart' as _i2;
import '../IncId/inc_id.dart' as _i6;

class RemoveKeys {
  const RemoveKeys({
    required this.did,
    required this.keys,
    required this.nonce,
  });

  factory RemoveKeys.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Did
  final _i2.Did did;

  /// BTreeSet<IncId>
  final _i3.BTreeSet keys;

  /// T::BlockNumber
  final int nonce;

  static const $RemoveKeysCodec codec = $RemoveKeysCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'did': did.toList(),
        'keys': keys.map((value) => value).toList(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveKeys &&
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

class $RemoveKeysCodec with _i1.Codec<RemoveKeys> {
  const $RemoveKeysCodec();

  @override
  void encodeTo(
    RemoveKeys obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.did,
      output,
    );
    const _i1.SequenceCodec<_i6.IncId>(_i6.IncIdCodec()).encodeTo(
      obj.keys,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  RemoveKeys decode(_i1.Input input) {
    return RemoveKeys(
      did: const _i1.U8ArrayCodec(32).decode(input),
      keys: const _i1.SequenceCodec<_i6.IncId>(_i6.IncIdCodec()).decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(RemoveKeys obj) {
    int size = 0;
    size = size + const _i2.DidCodec().sizeHint(obj.did);
    size = size + const _i3.BTreeSetCodec().sizeHint(obj.keys);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
