// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import 'base_system_token_detail.dart' as _i2;

class InfraSystemConfig {
  const InfraSystemConfig({
    required this.baseSystemTokenDetail,
    required this.weightScale,
  });

  factory InfraSystemConfig.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// BaseSystemTokenDetail
  final _i2.BaseSystemTokenDetail baseSystemTokenDetail;

  /// SystemTokenWeight
  final BigInt weightScale;

  static const $InfraSystemConfigCodec codec = $InfraSystemConfigCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'baseSystemTokenDetail': baseSystemTokenDetail.toJson(),
        'weightScale': weightScale,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is InfraSystemConfig &&
          other.baseSystemTokenDetail == baseSystemTokenDetail &&
          other.weightScale == weightScale;

  @override
  int get hashCode => Object.hash(
        baseSystemTokenDetail,
        weightScale,
      );
}

class $InfraSystemConfigCodec with _i1.Codec<InfraSystemConfig> {
  const $InfraSystemConfigCodec();

  @override
  void encodeTo(
    InfraSystemConfig obj,
    _i1.Output output,
  ) {
    _i2.BaseSystemTokenDetail.codec.encodeTo(
      obj.baseSystemTokenDetail,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.weightScale,
      output,
    );
  }

  @override
  InfraSystemConfig decode(_i1.Input input) {
    return InfraSystemConfig(
      baseSystemTokenDetail: _i2.BaseSystemTokenDetail.codec.decode(input),
      weightScale: _i1.U128Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(InfraSystemConfig obj) {
    int size = 0;
    size = size +
        _i2.BaseSystemTokenDetail.codec.sizeHint(obj.baseSystemTokenDetail);
    size = size + _i1.U128Codec.codec.sizeHint(obj.weightScale);
    return size;
  }
}
