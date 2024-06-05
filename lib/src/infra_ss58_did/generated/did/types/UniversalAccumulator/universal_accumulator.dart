// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../AccumulatorCommon/accumulator_common.dart' as _i2;

class UniversalAccumulator {
  const UniversalAccumulator({
    required this.common,
    required this.maxSize,
  });

  factory UniversalAccumulator.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccumulatorCommon<T>
  final _i2.AccumulatorCommon common;

  /// u64
  final BigInt maxSize;

  static const $UniversalAccumulatorCodec codec = $UniversalAccumulatorCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'common': common.toJson(),
        'maxSize': maxSize,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UniversalAccumulator &&
          other.common == common &&
          other.maxSize == maxSize;

  @override
  int get hashCode => Object.hash(
        common,
        maxSize,
      );
}

class $UniversalAccumulatorCodec with _i1.Codec<UniversalAccumulator> {
  const $UniversalAccumulatorCodec();

  @override
  void encodeTo(
    UniversalAccumulator obj,
    _i1.Output output,
  ) {
    _i2.AccumulatorCommon.codec.encodeTo(
      obj.common,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.maxSize,
      output,
    );
  }

  @override
  UniversalAccumulator decode(_i1.Input input) {
    return UniversalAccumulator(
      common: _i2.AccumulatorCommon.codec.decode(input),
      maxSize: _i1.U64Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(UniversalAccumulator obj) {
    int size = 0;
    size = size + _i2.AccumulatorCommon.codec.sizeHint(obj.common);
    size = size + _i1.U64Codec.codec.sizeHint(obj.maxSize);
    return size;
  }
}
