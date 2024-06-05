// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../PublicKey/public_key.dart' as _i2;
import '../VerRelType/ver_rel_type.dart' as _i3;

class DidKey {
  const DidKey({
    required this.publicKey,
    required this.verRels,
  });

  factory DidKey.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// PublicKey
  final _i2.PublicKey publicKey;

  /// VerRelType
  final _i3.VerRelType verRels;

  static const $DidKeyCodec codec = $DidKeyCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'publicKey': publicKey.toJson(),
        'verRels': verRels,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DidKey &&
          other.publicKey == publicKey &&
          other.verRels == verRels;

  @override
  int get hashCode => Object.hash(
        publicKey,
        verRels,
      );
}

class $DidKeyCodec with _i1.Codec<DidKey> {
  const $DidKeyCodec();

  @override
  void encodeTo(
    DidKey obj,
    _i1.Output output,
  ) {
    _i2.PublicKey.codec.encodeTo(
      obj.publicKey,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.verRels,
      output,
    );
  }

  @override
  DidKey decode(_i1.Input input) {
    return DidKey(
      publicKey: _i2.PublicKey.codec.decode(input),
      verRels: _i1.U16Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(DidKey obj) {
    int size = 0;
    size = size + _i2.PublicKey.codec.sizeHint(obj.publicKey);
    size = size + const _i3.VerRelTypeCodec().sizeHint(obj.verRels);
    return size;
  }
}
