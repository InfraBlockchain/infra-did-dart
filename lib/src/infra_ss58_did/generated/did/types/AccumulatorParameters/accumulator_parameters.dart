// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../BoundedBytes/bounded_bytes_10.dart' as _i2;
import '../BoundedBytes/bounded_bytes_11.dart' as _i4;
import '../CurveType/curve_type.dart' as _i3;

class AccumulatorParameters {
  const AccumulatorParameters({
    this.label,
    required this.curveType,
    required this.bytes,
  });

  factory AccumulatorParameters.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Option<BoundedBytes<T::MaxAccumulatorLabelSize>>
  final _i2.BoundedBytes? label;

  /// CurveType
  final _i3.CurveType curveType;

  /// BoundedBytes<T::MaxAccumulatorParamsSize>
  final _i4.BoundedBytes bytes;

  static const $AccumulatorParametersCodec codec =
      $AccumulatorParametersCodec();

  _i5.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'curveType': curveType.toJson(),
        'bytes': bytes,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AccumulatorParameters &&
          other.label == label &&
          other.curveType == curveType &&
          _i6.listsEqual(
            other.bytes,
            bytes,
          );

  @override
  int get hashCode => Object.hash(
        label,
        curveType,
        bytes,
      );
}

class $AccumulatorParametersCodec with _i1.Codec<AccumulatorParameters> {
  const $AccumulatorParametersCodec();

  @override
  void encodeTo(
    AccumulatorParameters obj,
    _i1.Output output,
  ) {
    const _i1.OptionCodec<_i2.BoundedBytes>(_i2.BoundedBytesCodec()).encodeTo(
      obj.label,
      output,
    );
    _i3.CurveType.codec.encodeTo(
      obj.curveType,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.bytes,
      output,
    );
  }

  @override
  AccumulatorParameters decode(_i1.Input input) {
    return AccumulatorParameters(
      label: const _i1.OptionCodec<_i2.BoundedBytes>(_i2.BoundedBytesCodec())
          .decode(input),
      curveType: _i3.CurveType.codec.decode(input),
      bytes: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AccumulatorParameters obj) {
    int size = 0;
    size = size +
        const _i1.OptionCodec<_i2.BoundedBytes>(_i2.BoundedBytesCodec())
            .sizeHint(obj.label);
    size = size + _i3.CurveType.codec.sizeHint(obj.curveType);
    size = size + const _i4.BoundedBytesCodec().sizeHint(obj.bytes);
    return size;
  }
}
