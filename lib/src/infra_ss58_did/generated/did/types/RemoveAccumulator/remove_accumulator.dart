// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../AccumulatorId/accumulator_id.dart' as _i2;

class RemoveAccumulator {
  const RemoveAccumulator({
    required this.id,
    required this.nonce,
  });

  factory RemoveAccumulator.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccumulatorId
  final _i2.AccumulatorId id;

  /// T::BlockNumber
  final int nonce;

  static const $RemoveAccumulatorCodec codec = $RemoveAccumulatorCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id.toList(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveAccumulator &&
          _i4.listsEqual(
            other.id,
            id,
          ) &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        id,
        nonce,
      );
}

class $RemoveAccumulatorCodec with _i1.Codec<RemoveAccumulator> {
  const $RemoveAccumulatorCodec();

  @override
  void encodeTo(
    RemoveAccumulator obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.id,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  RemoveAccumulator decode(_i1.Input input) {
    return RemoveAccumulator(
      id: const _i1.U8ArrayCodec(32).decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(RemoveAccumulator obj) {
    int size = 0;
    size = size + const _i2.AccumulatorIdCodec().sizeHint(obj.id);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
