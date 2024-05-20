// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../AccumulatorParameters/accumulator_parameters.dart' as _i2;

class AddAccumulatorParams {
  const AddAccumulatorParams({
    required this.params,
    required this.nonce,
  });

  factory AddAccumulatorParams.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccumulatorParameters<T>
  final _i2.AccumulatorParameters params;

  /// T::BlockNumber
  final int nonce;

  static const $AddAccumulatorParamsCodec codec = $AddAccumulatorParamsCodec();

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
      other is AddAccumulatorParams &&
          other.params == params &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        params,
        nonce,
      );
}

class $AddAccumulatorParamsCodec with _i1.Codec<AddAccumulatorParams> {
  const $AddAccumulatorParamsCodec();

  @override
  void encodeTo(
    AddAccumulatorParams obj,
    _i1.Output output,
  ) {
    _i2.AccumulatorParameters.codec.encodeTo(
      obj.params,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  AddAccumulatorParams decode(_i1.Input input) {
    return AddAccumulatorParams(
      params: _i2.AccumulatorParameters.codec.decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AddAccumulatorParams obj) {
    int size = 0;
    size = size + _i2.AccumulatorParameters.codec.sizeHint(obj.params);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
