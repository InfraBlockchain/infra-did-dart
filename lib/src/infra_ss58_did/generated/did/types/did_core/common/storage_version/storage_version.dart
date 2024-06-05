// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum StorageVersion {
  singleKey('SingleKey', 0),
  multiKey('MultiKey', 1);

  const StorageVersion(
    this.variantName,
    this.codecIndex,
  );

  factory StorageVersion.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $StorageVersionCodec codec = $StorageVersionCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $StorageVersionCodec with _i1.Codec<StorageVersion> {
  const $StorageVersionCodec();

  @override
  StorageVersion decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return StorageVersion.singleKey;
      case 1:
        return StorageVersion.multiKey;
      default:
        throw Exception('StorageVersion: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    StorageVersion value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
