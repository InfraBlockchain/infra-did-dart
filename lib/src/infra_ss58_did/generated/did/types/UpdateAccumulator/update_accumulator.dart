// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../AccumulatorId/accumulator_id.dart' as _i2;
import '../Bytes/bytes.dart' as _i3;

class UpdateAccumulator {
  const UpdateAccumulator({
    required this.id,
    required this.newAccumulated,
    this.additions,
    this.removals,
    this.witnessUpdateInfo,
    required this.nonce,
  });

  factory UpdateAccumulator.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccumulatorId
  final _i2.AccumulatorId id;

  /// Bytes
  final _i3.Bytes newAccumulated;

  /// Option<Vec<Bytes>>
  final List<_i3.Bytes>? additions;

  /// Option<Vec<Bytes>>
  final List<_i3.Bytes>? removals;

  /// Option<Bytes>
  final _i3.Bytes? witnessUpdateInfo;

  /// T::BlockNumber
  final int nonce;

  static const $UpdateAccumulatorCodec codec = $UpdateAccumulatorCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id.toList(),
        'newAccumulated': newAccumulated,
        'additions': additions?.map((value) => value).toList(),
        'removals': removals?.map((value) => value).toList(),
        'witnessUpdateInfo': witnessUpdateInfo,
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UpdateAccumulator &&
          _i5.listsEqual(
            other.id,
            id,
          ) &&
          _i5.listsEqual(
            other.newAccumulated,
            newAccumulated,
          ) &&
          other.additions == additions &&
          other.removals == removals &&
          other.witnessUpdateInfo == witnessUpdateInfo &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        id,
        newAccumulated,
        additions,
        removals,
        witnessUpdateInfo,
        nonce,
      );
}

class $UpdateAccumulatorCodec with _i1.Codec<UpdateAccumulator> {
  const $UpdateAccumulatorCodec();

  @override
  void encodeTo(
    UpdateAccumulator obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.id,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.newAccumulated,
      output,
    );
    const _i1.OptionCodec<List<_i3.Bytes>>(
            _i1.SequenceCodec<_i3.Bytes>(_i3.BytesCodec()))
        .encodeTo(
      obj.additions,
      output,
    );
    const _i1.OptionCodec<List<_i3.Bytes>>(
            _i1.SequenceCodec<_i3.Bytes>(_i3.BytesCodec()))
        .encodeTo(
      obj.removals,
      output,
    );
    const _i1.OptionCodec<_i3.Bytes>(_i3.BytesCodec()).encodeTo(
      obj.witnessUpdateInfo,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  UpdateAccumulator decode(_i1.Input input) {
    return UpdateAccumulator(
      id: const _i1.U8ArrayCodec(32).decode(input),
      newAccumulated: _i1.U8SequenceCodec.codec.decode(input),
      additions: const _i1.OptionCodec<List<_i3.Bytes>>(
              _i1.SequenceCodec<_i3.Bytes>(_i3.BytesCodec()))
          .decode(input),
      removals: const _i1.OptionCodec<List<_i3.Bytes>>(
              _i1.SequenceCodec<_i3.Bytes>(_i3.BytesCodec()))
          .decode(input),
      witnessUpdateInfo:
          const _i1.OptionCodec<_i3.Bytes>(_i3.BytesCodec()).decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(UpdateAccumulator obj) {
    int size = 0;
    size = size + const _i2.AccumulatorIdCodec().sizeHint(obj.id);
    size = size + const _i3.BytesCodec().sizeHint(obj.newAccumulated);
    size = size +
        const _i1.OptionCodec<List<_i3.Bytes>>(
                _i1.SequenceCodec<_i3.Bytes>(_i3.BytesCodec()))
            .sizeHint(obj.additions);
    size = size +
        const _i1.OptionCodec<List<_i3.Bytes>>(
                _i1.SequenceCodec<_i3.Bytes>(_i3.BytesCodec()))
            .sizeHint(obj.removals);
    size = size +
        const _i1.OptionCodec<_i3.Bytes>(_i3.BytesCodec())
            .sizeHint(obj.witnessUpdateInfo);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
