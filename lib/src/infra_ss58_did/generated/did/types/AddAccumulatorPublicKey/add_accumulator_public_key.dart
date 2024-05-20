// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../AccumulatorPublicKey/accumulator_public_key.dart' as _i2;

class AddAccumulatorPublicKey {
  const AddAccumulatorPublicKey({
    required this.publicKey,
    required this.nonce,
  });

  factory AddAccumulatorPublicKey.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccumulatorPublicKey<T>
  final _i2.AccumulatorPublicKey publicKey;

  /// T::BlockNumber
  final int nonce;

  static const $AddAccumulatorPublicKeyCodec codec =
      $AddAccumulatorPublicKeyCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'publicKey': publicKey.toJson(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddAccumulatorPublicKey &&
          other.publicKey == publicKey &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        publicKey,
        nonce,
      );
}

class $AddAccumulatorPublicKeyCodec with _i1.Codec<AddAccumulatorPublicKey> {
  const $AddAccumulatorPublicKeyCodec();

  @override
  void encodeTo(
    AddAccumulatorPublicKey obj,
    _i1.Output output,
  ) {
    _i2.AccumulatorPublicKey.codec.encodeTo(
      obj.publicKey,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  AddAccumulatorPublicKey decode(_i1.Input input) {
    return AddAccumulatorPublicKey(
      publicKey: _i2.AccumulatorPublicKey.codec.decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AddAccumulatorPublicKey obj) {
    int size = 0;
    size = size + _i2.AccumulatorPublicKey.codec.sizeHint(obj.publicKey);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
