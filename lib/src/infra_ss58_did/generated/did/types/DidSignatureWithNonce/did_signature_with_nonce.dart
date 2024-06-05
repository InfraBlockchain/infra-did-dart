// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../DidSignature/did_signature_2.dart' as _i2;

class DidSignatureWithNonce {
  const DidSignatureWithNonce({
    required this.sig,
    required this.nonce,
  });

  factory DidSignatureWithNonce.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// DidSignature<Did>
  final _i2.DidSignature sig;

  /// T::BlockNumber
  final int nonce;

  static const $DidSignatureWithNonceCodec codec =
      $DidSignatureWithNonceCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'sig': sig.toJson(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DidSignatureWithNonce &&
          other.sig == sig &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        sig,
        nonce,
      );
}

class $DidSignatureWithNonceCodec with _i1.Codec<DidSignatureWithNonce> {
  const $DidSignatureWithNonceCodec();

  @override
  void encodeTo(
    DidSignatureWithNonce obj,
    _i1.Output output,
  ) {
    _i2.DidSignature.codec.encodeTo(
      obj.sig,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  DidSignatureWithNonce decode(_i1.Input input) {
    return DidSignatureWithNonce(
      sig: _i2.DidSignature.codec.decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(DidSignatureWithNonce obj) {
    int size = 0;
    size = size + _i2.DidSignature.codec.sizeHint(obj.sig);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
