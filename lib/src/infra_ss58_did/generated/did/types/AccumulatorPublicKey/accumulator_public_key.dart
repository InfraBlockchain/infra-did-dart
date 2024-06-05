// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i7;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i8;

import '../AccumulatorOwner/accumulator_owner.dart' as _i5;
import '../BoundedBytes/bounded_bytes_8.dart' as _i3;
import '../CurveType/curve_type.dart' as _i2;
import '../IncId/inc_id.dart' as _i6;
import '../tuples.dart' as _i4;

class AccumulatorPublicKey {
  const AccumulatorPublicKey({
    required this.curveType,
    required this.bytes,
    this.paramsRef,
  });

  factory AccumulatorPublicKey.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// CurveType
  final _i2.CurveType curveType;

  /// BoundedBytes<T::MaxAccumulatorPublicKeySize>
  final _i3.BoundedBytes bytes;

  /// Option<AccumParametersStorageKey>
  final _i4.Tuple2<_i5.AccumulatorOwner, _i6.IncId>? paramsRef;

  static const $AccumulatorPublicKeyCodec codec = $AccumulatorPublicKeyCodec();

  _i7.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'curveType': curveType.toJson(),
        'bytes': bytes,
        'paramsRef': [
          paramsRef?.value0.toList(),
          paramsRef?.value1,
        ],
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AccumulatorPublicKey &&
          other.curveType == curveType &&
          _i8.listsEqual(
            other.bytes,
            bytes,
          ) &&
          other.paramsRef == paramsRef;

  @override
  int get hashCode => Object.hash(
        curveType,
        bytes,
        paramsRef,
      );
}

class $AccumulatorPublicKeyCodec with _i1.Codec<AccumulatorPublicKey> {
  const $AccumulatorPublicKeyCodec();

  @override
  void encodeTo(
    AccumulatorPublicKey obj,
    _i1.Output output,
  ) {
    _i2.CurveType.codec.encodeTo(
      obj.curveType,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.bytes,
      output,
    );
    const _i1.OptionCodec<_i4.Tuple2<_i5.AccumulatorOwner, _i6.IncId>>(
        _i4.Tuple2Codec<_i5.AccumulatorOwner, _i6.IncId>(
      _i5.AccumulatorOwnerCodec(),
      _i6.IncIdCodec(),
    )).encodeTo(
      obj.paramsRef,
      output,
    );
  }

  @override
  AccumulatorPublicKey decode(_i1.Input input) {
    return AccumulatorPublicKey(
      curveType: _i2.CurveType.codec.decode(input),
      bytes: _i1.U8SequenceCodec.codec.decode(input),
      paramsRef:
          const _i1.OptionCodec<_i4.Tuple2<_i5.AccumulatorOwner, _i6.IncId>>(
              _i4.Tuple2Codec<_i5.AccumulatorOwner, _i6.IncId>(
        _i5.AccumulatorOwnerCodec(),
        _i6.IncIdCodec(),
      )).decode(input),
    );
  }

  @override
  int sizeHint(AccumulatorPublicKey obj) {
    int size = 0;
    size = size + _i2.CurveType.codec.sizeHint(obj.curveType);
    size = size + const _i3.BoundedBytesCodec().sizeHint(obj.bytes);
    size = size +
        const _i1.OptionCodec<_i4.Tuple2<_i5.AccumulatorOwner, _i6.IncId>>(
            _i4.Tuple2Codec<_i5.AccumulatorOwner, _i6.IncId>(
          _i5.AccumulatorOwnerCodec(),
          _i6.IncIdCodec(),
        )).sizeHint(obj.paramsRef);
    return size;
  }
}
