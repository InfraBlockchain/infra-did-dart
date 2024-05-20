// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum CurveType {
  bls12381('Bls12381', 0);

  const CurveType(
    this.variantName,
    this.codecIndex,
  );

  factory CurveType.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $CurveTypeCodec codec = $CurveTypeCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $CurveTypeCodec with _i1.Codec<CurveType> {
  const $CurveTypeCodec();

  @override
  CurveType decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return CurveType.bls12381;
      default:
        throw Exception('CurveType: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    CurveType value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
