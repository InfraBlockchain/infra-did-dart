// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i6;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../AccumulatorOwner/accumulator_owner.dart' as _i4;
import '../BoundedBytes/bounded_bytes_12.dart' as _i2;
import '../IncId/inc_id.dart' as _i5;
import '../tuples.dart' as _i3;

class AccumulatorCommon {
  const AccumulatorCommon({
    required this.accumulated,
    required this.keyRef,
  });

  factory AccumulatorCommon.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// BoundedBytes<T::MaxAccumulatorAccumulatedSize>
  final _i2.BoundedBytes accumulated;

  /// AccumPublicKeyStorageKey
  final _i3.Tuple2<_i4.AccumulatorOwner, _i5.IncId> keyRef;

  static const $AccumulatorCommonCodec codec = $AccumulatorCommonCodec();

  _i6.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, List<dynamic>> toJson() => {
        'accumulated': accumulated,
        'keyRef': [
          keyRef.value0.toList(),
          keyRef.value1,
        ],
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AccumulatorCommon &&
          _i7.listsEqual(
            other.accumulated,
            accumulated,
          ) &&
          other.keyRef == keyRef;

  @override
  int get hashCode => Object.hash(
        accumulated,
        keyRef,
      );
}

class $AccumulatorCommonCodec with _i1.Codec<AccumulatorCommon> {
  const $AccumulatorCommonCodec();

  @override
  void encodeTo(
    AccumulatorCommon obj,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.accumulated,
      output,
    );
    const _i3.Tuple2Codec<_i4.AccumulatorOwner, _i5.IncId>(
      _i4.AccumulatorOwnerCodec(),
      _i5.IncIdCodec(),
    ).encodeTo(
      obj.keyRef,
      output,
    );
  }

  @override
  AccumulatorCommon decode(_i1.Input input) {
    return AccumulatorCommon(
      accumulated: _i1.U8SequenceCodec.codec.decode(input),
      keyRef: const _i3.Tuple2Codec<_i4.AccumulatorOwner, _i5.IncId>(
        _i4.AccumulatorOwnerCodec(),
        _i5.IncIdCodec(),
      ).decode(input),
    );
  }

  @override
  int sizeHint(AccumulatorCommon obj) {
    int size = 0;
    size = size + const _i2.BoundedBytesCodec().sizeHint(obj.accumulated);
    size = size +
        const _i3.Tuple2Codec<_i4.AccumulatorOwner, _i5.IncId>(
          _i4.AccumulatorOwnerCodec(),
          _i5.IncIdCodec(),
        ).sizeHint(obj.keyRef);
    return size;
  }
}
