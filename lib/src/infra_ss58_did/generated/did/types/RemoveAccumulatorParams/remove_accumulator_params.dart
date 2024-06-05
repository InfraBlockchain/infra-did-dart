// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../AccumulatorOwner/accumulator_owner.dart' as _i3;
import '../IncId/inc_id.dart' as _i4;
import '../tuples.dart' as _i2;

class RemoveAccumulatorParams {
  const RemoveAccumulatorParams({
    required this.paramsRef,
    required this.nonce,
  });

  factory RemoveAccumulatorParams.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccumParametersStorageKey
  final _i2.Tuple2<_i3.AccumulatorOwner, _i4.IncId> paramsRef;

  /// T::BlockNumber
  final int nonce;

  static const $RemoveAccumulatorParamsCodec codec =
      $RemoveAccumulatorParamsCodec();

  _i5.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'paramsRef': [
          paramsRef.value0.toList(),
          paramsRef.value1,
        ],
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveAccumulatorParams &&
          other.paramsRef == paramsRef &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        paramsRef,
        nonce,
      );
}

class $RemoveAccumulatorParamsCodec with _i1.Codec<RemoveAccumulatorParams> {
  const $RemoveAccumulatorParamsCodec();

  @override
  void encodeTo(
    RemoveAccumulatorParams obj,
    _i1.Output output,
  ) {
    const _i2.Tuple2Codec<_i3.AccumulatorOwner, _i4.IncId>(
      _i3.AccumulatorOwnerCodec(),
      _i4.IncIdCodec(),
    ).encodeTo(
      obj.paramsRef,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  RemoveAccumulatorParams decode(_i1.Input input) {
    return RemoveAccumulatorParams(
      paramsRef: const _i2.Tuple2Codec<_i3.AccumulatorOwner, _i4.IncId>(
        _i3.AccumulatorOwnerCodec(),
        _i4.IncIdCodec(),
      ).decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(RemoveAccumulatorParams obj) {
    int size = 0;
    size = size +
        const _i2.Tuple2Codec<_i3.AccumulatorOwner, _i4.IncId>(
          _i3.AccumulatorOwnerCodec(),
          _i4.IncIdCodec(),
        ).sizeHint(obj.paramsRef);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
