// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../RevokeRaw/revoke_raw.dart' as _i2;

class WithNonce {
  const WithNonce({
    required this.nonce,
    required this.data,
  });

  factory WithNonce.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// T::BlockNumber
  final int nonce;

  /// D
  final _i2.RevokeRaw data;

  static const $WithNonceCodec codec = $WithNonceCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'nonce': nonce,
        'data': data.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WithNonce && other.nonce == nonce && other.data == data;

  @override
  int get hashCode => Object.hash(
        nonce,
        data,
      );
}

class $WithNonceCodec with _i1.Codec<WithNonce> {
  const $WithNonceCodec();

  @override
  void encodeTo(
    WithNonce obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
    _i2.RevokeRaw.codec.encodeTo(
      obj.data,
      output,
    );
  }

  @override
  WithNonce decode(_i1.Input input) {
    return WithNonce(
      nonce: _i1.U32Codec.codec.decode(input),
      data: _i2.RevokeRaw.codec.decode(input),
    );
  }

  @override
  int sizeHint(WithNonce obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    size = size + _i2.RevokeRaw.codec.sizeHint(obj.data);
    return size;
  }
}
