// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../Controller/controller.dart' as _i2;
import '../IncId/inc_id.dart' as _i3;
import '../SigValue/sig_value.dart' as _i4;

class DidSignature {
  const DidSignature({
    required this.did,
    required this.keyId,
    required this.sig,
  });

  factory DidSignature.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// D
  final _i2.Controller did;

  /// IncId
  final _i3.IncId keyId;

  /// SigValue
  final _i4.SigValue sig;

  static const $DidSignatureCodec codec = $DidSignatureCodec();

  _i5.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'did': did.toList(),
        'keyId': keyId,
        'sig': sig.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DidSignature &&
          other.did == did &&
          other.keyId == keyId &&
          other.sig == sig;

  @override
  int get hashCode => Object.hash(
        did,
        keyId,
        sig,
      );
}

class $DidSignatureCodec with _i1.Codec<DidSignature> {
  const $DidSignatureCodec();

  @override
  void encodeTo(
    DidSignature obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.did,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.keyId,
      output,
    );
    _i4.SigValue.codec.encodeTo(
      obj.sig,
      output,
    );
  }

  @override
  DidSignature decode(_i1.Input input) {
    return DidSignature(
      did: const _i1.U8ArrayCodec(32).decode(input),
      keyId: _i1.U32Codec.codec.decode(input),
      sig: _i4.SigValue.codec.decode(input),
    );
  }

  @override
  int sizeHint(DidSignature obj) {
    int size = 0;
    size = size + const _i2.ControllerCodec().sizeHint(obj.did);
    size = size + const _i3.IncIdCodec().sizeHint(obj.keyId);
    size = size + _i4.SigValue.codec.sizeHint(obj.sig);
    return size;
  }
}
