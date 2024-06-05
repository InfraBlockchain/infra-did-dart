// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import 'fiat.dart' as _i2;

class RemoteAssetMetadata {
  const RemoteAssetMetadata({
    required this.palletId,
    required this.assetId,
    required this.name,
    required this.symbol,
    required this.currencyType,
    required this.decimals,
    required this.minBalance,
  });

  factory RemoteAssetMetadata.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// SystemTokenPalletId
  final int palletId;

  /// SystemTokenAssetId
  final BigInt assetId;

  /// BoundedSystemTokenName
  final List<int> name;

  /// BoundedSystemTokenSymbol
  final List<int> symbol;

  /// Fiat
  final _i2.Fiat currencyType;

  /// u8
  final int decimals;

  /// SystemTokenBalance
  final BigInt minBalance;

  static const $RemoteAssetMetadataCodec codec = $RemoteAssetMetadataCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'palletId': palletId,
        'assetId': assetId,
        'name': name,
        'symbol': symbol,
        'currencyType': currencyType.toJson(),
        'decimals': decimals,
        'minBalance': minBalance,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoteAssetMetadata &&
          other.palletId == palletId &&
          other.assetId == assetId &&
          _i4.listsEqual(
            other.name,
            name,
          ) &&
          _i4.listsEqual(
            other.symbol,
            symbol,
          ) &&
          other.currencyType == currencyType &&
          other.decimals == decimals &&
          other.minBalance == minBalance;

  @override
  int get hashCode => Object.hash(
        palletId,
        assetId,
        name,
        symbol,
        currencyType,
        decimals,
        minBalance,
      );
}

class $RemoteAssetMetadataCodec with _i1.Codec<RemoteAssetMetadata> {
  const $RemoteAssetMetadataCodec();

  @override
  void encodeTo(
    RemoteAssetMetadata obj,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      obj.palletId,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.assetId,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.symbol,
      output,
    );
    _i2.Fiat.codec.encodeTo(
      obj.currencyType,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.decimals,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.minBalance,
      output,
    );
  }

  @override
  RemoteAssetMetadata decode(_i1.Input input) {
    return RemoteAssetMetadata(
      palletId: _i1.U8Codec.codec.decode(input),
      assetId: _i1.CompactBigIntCodec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      symbol: _i1.U8SequenceCodec.codec.decode(input),
      currencyType: _i2.Fiat.codec.decode(input),
      decimals: _i1.U8Codec.codec.decode(input),
      minBalance: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(RemoteAssetMetadata obj) {
    int size = 0;
    size = size + _i1.U8Codec.codec.sizeHint(obj.palletId);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.assetId);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.symbol);
    size = size + _i2.Fiat.codec.sizeHint(obj.currencyType);
    size = size + _i1.U8Codec.codec.sizeHint(obj.decimals);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.minBalance);
    return size;
  }
}
