// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../IncId/inc_id.dart' as _i4;
import '../SignatureParamsOwner/signature_params_owner.dart' as _i3;
import '../tuples.dart' as _i2;

class RemoveOffchainSignatureParams {
  const RemoveOffchainSignatureParams({
    required this.paramsRef,
    required this.nonce,
  });

  factory RemoveOffchainSignatureParams.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// SignatureParamsStorageKey
  final _i2.Tuple2<_i3.SignatureParamsOwner, _i4.IncId> paramsRef;

  /// T::BlockNumber
  final int nonce;

  static const $RemoveOffchainSignatureParamsCodec codec =
      $RemoveOffchainSignatureParamsCodec();

  _i5.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'paramsRef': [
          paramsRef.value0.toList(),
          paramsRef.value1,
        ],
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveOffchainSignatureParams &&
          other.paramsRef == paramsRef &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        paramsRef,
        nonce,
      );
}

class $RemoveOffchainSignatureParamsCodec
    with _i1.Codec<RemoveOffchainSignatureParams> {
  const $RemoveOffchainSignatureParamsCodec();

  @override
  void encodeTo(
    RemoveOffchainSignatureParams obj,
    _i1.Output output,
  ) {
    const _i2.Tuple2Codec<_i3.SignatureParamsOwner, _i4.IncId>(
      _i3.SignatureParamsOwnerCodec(),
      _i4.IncIdCodec(),
    ).encodeTo(
      obj.paramsRef,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  RemoveOffchainSignatureParams decode(_i1.Input input) {
    return RemoveOffchainSignatureParams(
      paramsRef: const _i2.Tuple2Codec<_i3.SignatureParamsOwner, _i4.IncId>(
        _i3.SignatureParamsOwnerCodec(),
        _i4.IncIdCodec(),
      ).decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(RemoveOffchainSignatureParams obj) {
    int size = 0;
    size = size +
        const _i2.Tuple2Codec<_i3.SignatureParamsOwner, _i4.IncId>(
          _i3.SignatureParamsOwnerCodec(),
          _i4.IncIdCodec(),
        ).sizeHint(obj.paramsRef);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
