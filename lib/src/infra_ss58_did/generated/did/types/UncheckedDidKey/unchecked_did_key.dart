// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../PublicKey/public_key.dart' as _i2;
import '../VerRelType/ver_rel_type.dart' as _i3;

class UncheckedDidKey {
  const UncheckedDidKey({
    required this.publicKey,
    required this.verRels,
  });

  factory UncheckedDidKey.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// PublicKey
  final _i2.PublicKey publicKey;

  /// VerRelType
  final _i3.VerRelType verRels;

  static const $UncheckedDidKeyCodec codec = $UncheckedDidKeyCodec();

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
      other is UncheckedDidKey &&
          other.publicKey == publicKey &&
          other.verRels == verRels;

  @override
  int get hashCode => Object.hash(
        publicKey,
        verRels,
      );
}

class $UncheckedDidKeyCodec with _i1.Codec<UncheckedDidKey> {
  const $UncheckedDidKeyCodec();

  @override
  void encodeTo(
    UncheckedDidKey obj,
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
  UncheckedDidKey decode(_i1.Input input) {
    return UncheckedDidKey(
      publicKey: _i2.PublicKey.codec.decode(input),
      verRels: _i1.U16Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(UncheckedDidKey obj) {
    int size = 0;
    size = size + _i2.PublicKey.codec.sizeHint(obj.publicKey);
    size = size + const _i3.VerRelTypeCodec().sizeHint(obj.verRels);
    return size;
  }
}
