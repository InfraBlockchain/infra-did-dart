// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../sp_runtime/types/token/fiat.dart' as _i2;

class AssetMetadata {
  const AssetMetadata({
    this.currencyType,
    required this.deposit,
    required this.name,
    required this.symbol,
    required this.decimals,
    required this.isFrozen,
  });

  factory AssetMetadata.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Option<Fiat>
  final _i2.Fiat? currencyType;

  /// DepositBalance
  final BigInt deposit;

  /// BoundedSystemTokenName
  final List<int> name;

  /// BoundedSystemTokenSymbol
  final List<int> symbol;

  /// u8
  final int decimals;

  /// bool
  final bool isFrozen;

  static const $AssetMetadataCodec codec = $AssetMetadataCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'currencyType': currencyType?.toJson(),
        'deposit': deposit,
        'name': name,
        'symbol': symbol,
        'decimals': decimals,
        'isFrozen': isFrozen,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AssetMetadata &&
          other.currencyType == currencyType &&
          other.deposit == deposit &&
          _i4.listsEqual(
            other.name,
            name,
          ) &&
          _i4.listsEqual(
            other.symbol,
            symbol,
          ) &&
          other.decimals == decimals &&
          other.isFrozen == isFrozen;

  @override
  int get hashCode => Object.hash(
        currencyType,
        deposit,
        name,
        symbol,
        decimals,
        isFrozen,
      );
}

class $AssetMetadataCodec with _i1.Codec<AssetMetadata> {
  const $AssetMetadataCodec();

  @override
  void encodeTo(
    AssetMetadata obj,
    _i1.Output output,
  ) {
    const _i1.OptionCodec<_i2.Fiat>(_i2.Fiat.codec).encodeTo(
      obj.currencyType,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.deposit,
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
    _i1.U8Codec.codec.encodeTo(
      obj.decimals,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      obj.isFrozen,
      output,
    );
  }

  @override
  AssetMetadata decode(_i1.Input input) {
    return AssetMetadata(
      currencyType:
          const _i1.OptionCodec<_i2.Fiat>(_i2.Fiat.codec).decode(input),
      deposit: _i1.U128Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      symbol: _i1.U8SequenceCodec.codec.decode(input),
      decimals: _i1.U8Codec.codec.decode(input),
      isFrozen: _i1.BoolCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AssetMetadata obj) {
    int size = 0;
    size = size +
        const _i1.OptionCodec<_i2.Fiat>(_i2.Fiat.codec)
            .sizeHint(obj.currencyType);
    size = size + _i1.U128Codec.codec.sizeHint(obj.deposit);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.symbol);
    size = size + _i1.U8Codec.codec.sizeHint(obj.decimals);
    size = size + _i1.BoolCodec.codec.sizeHint(obj.isFrozen);
    return size;
  }
}
