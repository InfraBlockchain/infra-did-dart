// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../IncId/inc_id.dart' as _i2;

class StoredAccumulatorOwnerCounters {
  const StoredAccumulatorOwnerCounters({
    required this.paramsCounter,
    required this.keyCounter,
  });

  factory StoredAccumulatorOwnerCounters.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// IncId
  final _i2.IncId paramsCounter;

  /// IncId
  final _i2.IncId keyCounter;

  static const $StoredAccumulatorOwnerCountersCodec codec =
      $StoredAccumulatorOwnerCountersCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, int> toJson() => {
        'paramsCounter': paramsCounter,
        'keyCounter': keyCounter,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is StoredAccumulatorOwnerCounters &&
          other.paramsCounter == paramsCounter &&
          other.keyCounter == keyCounter;

  @override
  int get hashCode => Object.hash(
        paramsCounter,
        keyCounter,
      );
}

class $StoredAccumulatorOwnerCountersCodec
    with _i1.Codec<StoredAccumulatorOwnerCounters> {
  const $StoredAccumulatorOwnerCountersCodec();

  @override
  void encodeTo(
    StoredAccumulatorOwnerCounters obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.paramsCounter,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.keyCounter,
      output,
    );
  }

  @override
  StoredAccumulatorOwnerCounters decode(_i1.Input input) {
    return StoredAccumulatorOwnerCounters(
      paramsCounter: _i1.U32Codec.codec.decode(input),
      keyCounter: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(StoredAccumulatorOwnerCounters obj) {
    int size = 0;
    size = size + const _i2.IncIdCodec().sizeHint(obj.paramsCounter);
    size = size + const _i2.IncIdCodec().sizeHint(obj.keyCounter);
    return size;
  }
}
