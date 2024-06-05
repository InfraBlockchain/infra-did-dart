// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../Accumulator/accumulator.dart' as _i2;

class AccumulatorWithUpdateInfo {
  const AccumulatorWithUpdateInfo({
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.accumulator,
  });

  factory AccumulatorWithUpdateInfo.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// T::BlockNumber
  final int createdAt;

  /// T::BlockNumber
  final int lastUpdatedAt;

  /// Accumulator<T>
  final _i2.Accumulator accumulator;

  static const $AccumulatorWithUpdateInfoCodec codec =
      $AccumulatorWithUpdateInfoCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt,
        'lastUpdatedAt': lastUpdatedAt,
        'accumulator': accumulator.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AccumulatorWithUpdateInfo &&
          other.createdAt == createdAt &&
          other.lastUpdatedAt == lastUpdatedAt &&
          other.accumulator == accumulator;

  @override
  int get hashCode => Object.hash(
        createdAt,
        lastUpdatedAt,
        accumulator,
      );
}

class $AccumulatorWithUpdateInfoCodec
    with _i1.Codec<AccumulatorWithUpdateInfo> {
  const $AccumulatorWithUpdateInfoCodec();

  @override
  void encodeTo(
    AccumulatorWithUpdateInfo obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.createdAt,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.lastUpdatedAt,
      output,
    );
    _i2.Accumulator.codec.encodeTo(
      obj.accumulator,
      output,
    );
  }

  @override
  AccumulatorWithUpdateInfo decode(_i1.Input input) {
    return AccumulatorWithUpdateInfo(
      createdAt: _i1.U32Codec.codec.decode(input),
      lastUpdatedAt: _i1.U32Codec.codec.decode(input),
      accumulator: _i2.Accumulator.codec.decode(input),
    );
  }

  @override
  int sizeHint(AccumulatorWithUpdateInfo obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.createdAt);
    size = size + _i1.U32Codec.codec.sizeHint(obj.lastUpdatedAt);
    size = size + _i2.Accumulator.codec.sizeHint(obj.accumulator);
    return size;
  }
}
