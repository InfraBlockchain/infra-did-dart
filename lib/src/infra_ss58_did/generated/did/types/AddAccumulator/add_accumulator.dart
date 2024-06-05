// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../Accumulator/accumulator.dart' as _i3;
import '../AccumulatorId/accumulator_id.dart' as _i2;

class AddAccumulator {
  const AddAccumulator({
    required this.id,
    required this.accumulator,
    required this.nonce,
  });

  factory AddAccumulator.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccumulatorId
  final _i2.AccumulatorId id;

  /// Accumulator<T>
  final _i3.Accumulator accumulator;

  /// T::BlockNumber
  final int nonce;

  static const $AddAccumulatorCodec codec = $AddAccumulatorCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id.toList(),
        'accumulator': accumulator.toJson(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddAccumulator &&
          _i5.listsEqual(
            other.id,
            id,
          ) &&
          other.accumulator == accumulator &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        id,
        accumulator,
        nonce,
      );
}

class $AddAccumulatorCodec with _i1.Codec<AddAccumulator> {
  const $AddAccumulatorCodec();

  @override
  void encodeTo(
    AddAccumulator obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.id,
      output,
    );
    _i3.Accumulator.codec.encodeTo(
      obj.accumulator,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  AddAccumulator decode(_i1.Input input) {
    return AddAccumulator(
      id: const _i1.U8ArrayCodec(32).decode(input),
      accumulator: _i3.Accumulator.codec.decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AddAccumulator obj) {
    int size = 0;
    size = size + const _i2.AccumulatorIdCodec().sizeHint(obj.id);
    size = size + _i3.Accumulator.codec.sizeHint(obj.accumulator);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
