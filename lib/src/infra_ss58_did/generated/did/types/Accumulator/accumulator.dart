// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../AccumulatorCommon/accumulator_common.dart' as _i3;
import '../UniversalAccumulator/universal_accumulator.dart' as _i4;

abstract class Accumulator {
  const Accumulator();

  factory Accumulator.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $AccumulatorCodec codec = $AccumulatorCodec();

  static const $Accumulator values = $Accumulator();

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

class $Accumulator {
  const $Accumulator();

  Positive positive(_i3.AccumulatorCommon value0) {
    return Positive(value0);
  }

  Universal universal(_i4.UniversalAccumulator value0) {
    return Universal(value0);
  }
}

class $AccumulatorCodec with _i1.Codec<Accumulator> {
  const $AccumulatorCodec();

  @override
  Accumulator decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Positive._decode(input);
      case 1:
        return Universal._decode(input);
      default:
        throw Exception('Accumulator: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Accumulator value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Positive:
        (value as Positive).encodeTo(output);
        break;
      case Universal:
        (value as Universal).encodeTo(output);
        break;
      default:
        throw Exception(
            'Accumulator: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Accumulator value) {
    switch (value.runtimeType) {
      case Positive:
        return (value as Positive)._sizeHint();
      case Universal:
        return (value as Universal)._sizeHint();
      default:
        throw Exception(
            'Accumulator: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Positive extends Accumulator {
  const Positive(this.value0);

  factory Positive._decode(_i1.Input input) {
    return Positive(_i3.AccumulatorCommon.codec.decode(input));
  }

  /// AccumulatorCommon<T>
  final _i3.AccumulatorCommon value0;

  @override
  Map<String, Map<String, List<dynamic>>> toJson() =>
      {'Positive': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i3.AccumulatorCommon.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.AccumulatorCommon.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Positive && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Universal extends Accumulator {
  const Universal(this.value0);

  factory Universal._decode(_i1.Input input) {
    return Universal(_i4.UniversalAccumulator.codec.decode(input));
  }

  /// UniversalAccumulator<T>
  final _i4.UniversalAccumulator value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'Universal': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i4.UniversalAccumulator.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i4.UniversalAccumulator.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Universal && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}
