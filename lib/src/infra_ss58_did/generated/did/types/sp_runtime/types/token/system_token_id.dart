// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class SystemTokenId {
  const SystemTokenId({
    required this.paraId,
    required this.palletId,
    required this.assetId,
  });

  factory SystemTokenId.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// SystemTokenParaId
  final BigInt paraId;

  /// SystemTokenPalletId
  final BigInt palletId;

  /// SystemTokenAssetId
  final BigInt assetId;

  static const $SystemTokenIdCodec codec = $SystemTokenIdCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, BigInt> toJson() => {
        'paraId': paraId,
        'palletId': palletId,
        'assetId': assetId,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SystemTokenId &&
          other.paraId == paraId &&
          other.palletId == palletId &&
          other.assetId == assetId;

  @override
  int get hashCode => Object.hash(
        paraId,
        palletId,
        assetId,
      );
}

class $SystemTokenIdCodec with _i1.Codec<SystemTokenId> {
  const $SystemTokenIdCodec();

  @override
  void encodeTo(
    SystemTokenId obj,
    _i1.Output output,
  ) {
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.paraId,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.palletId,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.assetId,
      output,
    );
  }

  @override
  SystemTokenId decode(_i1.Input input) {
    return SystemTokenId(
      paraId: _i1.CompactBigIntCodec.codec.decode(input),
      palletId: _i1.CompactBigIntCodec.codec.decode(input),
      assetId: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(SystemTokenId obj) {
    int size = 0;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.paraId);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.palletId);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.assetId);
    return size;
  }
}
