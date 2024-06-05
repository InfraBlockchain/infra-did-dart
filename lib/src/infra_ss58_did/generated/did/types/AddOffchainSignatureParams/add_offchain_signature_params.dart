// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../OffchainSignatureParams/offchain_signature_params.dart' as _i2;

class AddOffchainSignatureParams {
  const AddOffchainSignatureParams({
    required this.params,
    required this.nonce,
  });

  factory AddOffchainSignatureParams.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// OffchainSignatureParams<T>
  final _i2.OffchainSignatureParams params;

  /// T::BlockNumber
  final int nonce;

  static const $AddOffchainSignatureParamsCodec codec =
      $AddOffchainSignatureParamsCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'params': params.toJson(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddOffchainSignatureParams &&
          other.params == params &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        params,
        nonce,
      );
}

class $AddOffchainSignatureParamsCodec
    with _i1.Codec<AddOffchainSignatureParams> {
  const $AddOffchainSignatureParamsCodec();

  @override
  void encodeTo(
    AddOffchainSignatureParams obj,
    _i1.Output output,
  ) {
    _i2.OffchainSignatureParams.codec.encodeTo(
      obj.params,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  AddOffchainSignatureParams decode(_i1.Input input) {
    return AddOffchainSignatureParams(
      params: _i2.OffchainSignatureParams.codec.decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AddOffchainSignatureParams obj) {
    int size = 0;
    size = size + _i2.OffchainSignatureParams.codec.sizeHint(obj.params);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
