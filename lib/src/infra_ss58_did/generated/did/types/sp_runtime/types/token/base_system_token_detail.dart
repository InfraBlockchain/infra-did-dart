// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import 'fiat.dart' as _i2;

class BaseSystemTokenDetail {
  const BaseSystemTokenDetail({
    required this.baseCurrency,
    required this.baseWeight,
    required this.baseDecimals,
  });

  factory BaseSystemTokenDetail.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Fiat
  final _i2.Fiat baseCurrency;

  /// SystemTokenWeight
  final BigInt baseWeight;

  /// u8
  final int baseDecimals;

  static const $BaseSystemTokenDetailCodec codec =
      $BaseSystemTokenDetailCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'baseCurrency': baseCurrency.toJson(),
        'baseWeight': baseWeight,
        'baseDecimals': baseDecimals,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is BaseSystemTokenDetail &&
          other.baseCurrency == baseCurrency &&
          other.baseWeight == baseWeight &&
          other.baseDecimals == baseDecimals;

  @override
  int get hashCode => Object.hash(
        baseCurrency,
        baseWeight,
        baseDecimals,
      );
}

class $BaseSystemTokenDetailCodec with _i1.Codec<BaseSystemTokenDetail> {
  const $BaseSystemTokenDetailCodec();

  @override
  void encodeTo(
    BaseSystemTokenDetail obj,
    _i1.Output output,
  ) {
    _i2.Fiat.codec.encodeTo(
      obj.baseCurrency,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.baseWeight,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.baseDecimals,
      output,
    );
  }

  @override
  BaseSystemTokenDetail decode(_i1.Input input) {
    return BaseSystemTokenDetail(
      baseCurrency: _i2.Fiat.codec.decode(input),
      baseWeight: _i1.U128Codec.codec.decode(input),
      baseDecimals: _i1.U8Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(BaseSystemTokenDetail obj) {
    int size = 0;
    size = size + _i2.Fiat.codec.sizeHint(obj.baseCurrency);
    size = size + _i1.U128Codec.codec.sizeHint(obj.baseWeight);
    size = size + _i1.U8Codec.codec.sizeHint(obj.baseDecimals);
    return size;
  }
}
