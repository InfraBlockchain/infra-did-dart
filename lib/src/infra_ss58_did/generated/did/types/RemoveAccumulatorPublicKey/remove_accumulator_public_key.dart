// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../AccumulatorOwner/accumulator_owner.dart' as _i3;
import '../IncId/inc_id.dart' as _i4;
import '../tuples.dart' as _i2;

class RemoveAccumulatorPublicKey {
  const RemoveAccumulatorPublicKey({
    required this.keyRef,
    required this.nonce,
  });

  factory RemoveAccumulatorPublicKey.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccumPublicKeyStorageKey
  final _i2.Tuple2<_i3.AccumulatorOwner, _i4.IncId> keyRef;

  /// T::BlockNumber
  final int nonce;

  static const $RemoveAccumulatorPublicKeyCodec codec =
      $RemoveAccumulatorPublicKeyCodec();

  _i5.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'keyRef': [
          keyRef.value0.toList(),
          keyRef.value1,
        ],
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveAccumulatorPublicKey &&
          other.keyRef == keyRef &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        keyRef,
        nonce,
      );
}

class $RemoveAccumulatorPublicKeyCodec
    with _i1.Codec<RemoveAccumulatorPublicKey> {
  const $RemoveAccumulatorPublicKeyCodec();

  @override
  void encodeTo(
    RemoveAccumulatorPublicKey obj,
    _i1.Output output,
  ) {
    const _i2.Tuple2Codec<_i3.AccumulatorOwner, _i4.IncId>(
      _i3.AccumulatorOwnerCodec(),
      _i4.IncIdCodec(),
    ).encodeTo(
      obj.keyRef,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  RemoveAccumulatorPublicKey decode(_i1.Input input) {
    return RemoveAccumulatorPublicKey(
      keyRef: const _i2.Tuple2Codec<_i3.AccumulatorOwner, _i4.IncId>(
        _i3.AccumulatorOwnerCodec(),
        _i4.IncIdCodec(),
      ).decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(RemoveAccumulatorPublicKey obj) {
    int size = 0;
    size = size +
        const _i2.Tuple2Codec<_i3.AccumulatorOwner, _i4.IncId>(
          _i3.AccumulatorOwnerCodec(),
          _i4.IncIdCodec(),
        ).sizeHint(obj.keyRef);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
