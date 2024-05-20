// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class Detail {
  const Detail({
    required this.paidAssetId,
    required this.actualFee,
    required this.convertedFee,
    this.tip,
  });

  factory Detail.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// ChargeSystemTokenAssetIdOf<T>
  final int paidAssetId;

  /// BalanceOf<T>
  final BigInt actualFee;

  /// AssetBalanceOf<T>
  final BigInt convertedFee;

  /// Option<AssetBalanceOf<T>>
  final BigInt? tip;

  static const $DetailCodec codec = $DetailCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'paidAssetId': paidAssetId,
        'actualFee': actualFee,
        'convertedFee': convertedFee,
        'tip': tip,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Detail &&
          other.paidAssetId == paidAssetId &&
          other.actualFee == actualFee &&
          other.convertedFee == convertedFee &&
          other.tip == tip;

  @override
  int get hashCode => Object.hash(
        paidAssetId,
        actualFee,
        convertedFee,
        tip,
      );
}

class $DetailCodec with _i1.Codec<Detail> {
  const $DetailCodec();

  @override
  void encodeTo(
    Detail obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.paidAssetId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.actualFee,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.convertedFee,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.U128Codec.codec).encodeTo(
      obj.tip,
      output,
    );
  }

  @override
  Detail decode(_i1.Input input) {
    return Detail(
      paidAssetId: _i1.U32Codec.codec.decode(input),
      actualFee: _i1.U128Codec.codec.decode(input),
      convertedFee: _i1.U128Codec.codec.decode(input),
      tip: const _i1.OptionCodec<BigInt>(_i1.U128Codec.codec).decode(input),
    );
  }

  @override
  int sizeHint(Detail obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.paidAssetId);
    size = size + _i1.U128Codec.codec.sizeHint(obj.actualFee);
    size = size + _i1.U128Codec.codec.sizeHint(obj.convertedFee);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.U128Codec.codec).sizeHint(obj.tip);
    return size;
  }
}
