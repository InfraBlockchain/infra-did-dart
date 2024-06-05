// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i7;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i8;

import '../BoundedBytes/bounded_bytes_8.dart' as _i3;
import '../CurveType/curve_type.dart' as _i2;
import '../IncId/inc_id.dart' as _i6;
import '../SignatureParamsOwner/signature_params_owner.dart' as _i5;
import '../tuples.dart' as _i4;

class BBSPlusPublicKey {
  const BBSPlusPublicKey({
    required this.curveType,
    required this.bytes,
    this.paramsRef,
    this.participantId,
  });

  factory BBSPlusPublicKey.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// CurveType
  final _i2.CurveType curveType;

  /// BoundedBytes<T::MaxBBSPlusPublicKeySize>
  final _i3.BoundedBytes bytes;

  /// Option<SignatureParamsStorageKey>
  final _i4.Tuple2<_i5.SignatureParamsOwner, _i6.IncId>? paramsRef;

  /// Option<ParticipantId>
  final int? participantId;

  static const $BBSPlusPublicKeyCodec codec = $BBSPlusPublicKeyCodec();

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
        'participantId': participantId,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is BBSPlusPublicKey &&
          other.curveType == curveType &&
          _i8.listsEqual(
            other.bytes,
            bytes,
          ) &&
          other.paramsRef == paramsRef &&
          other.participantId == participantId;

  @override
  int get hashCode => Object.hash(
        curveType,
        bytes,
        paramsRef,
        participantId,
      );
}

class $BBSPlusPublicKeyCodec with _i1.Codec<BBSPlusPublicKey> {
  const $BBSPlusPublicKeyCodec();

  @override
  void encodeTo(
    BBSPlusPublicKey obj,
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
    const _i1.OptionCodec<_i4.Tuple2<_i5.SignatureParamsOwner, _i6.IncId>>(
        _i4.Tuple2Codec<_i5.SignatureParamsOwner, _i6.IncId>(
      _i5.SignatureParamsOwnerCodec(),
      _i6.IncIdCodec(),
    )).encodeTo(
      obj.paramsRef,
      output,
    );
    const _i1.OptionCodec<int>(_i1.U16Codec.codec).encodeTo(
      obj.participantId,
      output,
    );
  }

  @override
  BBSPlusPublicKey decode(_i1.Input input) {
    return BBSPlusPublicKey(
      curveType: _i2.CurveType.codec.decode(input),
      bytes: _i1.U8SequenceCodec.codec.decode(input),
      paramsRef: const _i1
          .OptionCodec<_i4.Tuple2<_i5.SignatureParamsOwner, _i6.IncId>>(
          _i4.Tuple2Codec<_i5.SignatureParamsOwner, _i6.IncId>(
        _i5.SignatureParamsOwnerCodec(),
        _i6.IncIdCodec(),
      )).decode(input),
      participantId:
          const _i1.OptionCodec<int>(_i1.U16Codec.codec).decode(input),
    );
  }

  @override
  int sizeHint(BBSPlusPublicKey obj) {
    int size = 0;
    size = size + _i2.CurveType.codec.sizeHint(obj.curveType);
    size = size + const _i3.BoundedBytesCodec().sizeHint(obj.bytes);
    size = size +
        const _i1.OptionCodec<_i4.Tuple2<_i5.SignatureParamsOwner, _i6.IncId>>(
            _i4.Tuple2Codec<_i5.SignatureParamsOwner, _i6.IncId>(
          _i5.SignatureParamsOwnerCodec(),
          _i6.IncIdCodec(),
        )).sizeHint(obj.paramsRef);
    size = size +
        const _i1.OptionCodec<int>(_i1.U16Codec.codec)
            .sizeHint(obj.participantId);
    return size;
  }
}
