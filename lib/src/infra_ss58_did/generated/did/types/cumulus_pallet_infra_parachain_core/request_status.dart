// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class RequestStatus {
  const RequestStatus({
    required this.exp,
    required this.isRelay,
  });

  factory RequestStatus.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// BlockNumber
  final int exp;

  /// bool
  final bool isRelay;

  static const $RequestStatusCodec codec = $RequestStatusCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'exp': exp,
        'isRelay': isRelay,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RequestStatus && other.exp == exp && other.isRelay == isRelay;

  @override
  int get hashCode => Object.hash(
        exp,
        isRelay,
      );
}

class $RequestStatusCodec with _i1.Codec<RequestStatus> {
  const $RequestStatusCodec();

  @override
  void encodeTo(
    RequestStatus obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.exp,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      obj.isRelay,
      output,
    );
  }

  @override
  RequestStatus decode(_i1.Input input) {
    return RequestStatus(
      exp: _i1.U32Codec.codec.decode(input),
      isRelay: _i1.BoolCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(RequestStatus obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.exp);
    size = size + _i1.BoolCodec.codec.sizeHint(obj.isRelay);
    return size;
  }
}
