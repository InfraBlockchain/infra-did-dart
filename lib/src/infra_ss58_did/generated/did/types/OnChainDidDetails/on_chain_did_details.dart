// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../IncId/inc_id.dart' as _i2;

class OnChainDidDetails {
  const OnChainDidDetails({
    required this.lastKeyId,
    required this.activeControllerKeys,
    required this.activeControllers,
  });

  factory OnChainDidDetails.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// IncId
  final _i2.IncId lastKeyId;

  /// u32
  final int activeControllerKeys;

  /// u32
  final int activeControllers;

  static const $OnChainDidDetailsCodec codec = $OnChainDidDetailsCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, int> toJson() => {
        'lastKeyId': lastKeyId,
        'activeControllerKeys': activeControllerKeys,
        'activeControllers': activeControllers,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is OnChainDidDetails &&
          other.lastKeyId == lastKeyId &&
          other.activeControllerKeys == activeControllerKeys &&
          other.activeControllers == activeControllers;

  @override
  int get hashCode => Object.hash(
        lastKeyId,
        activeControllerKeys,
        activeControllers,
      );
}

class $OnChainDidDetailsCodec with _i1.Codec<OnChainDidDetails> {
  const $OnChainDidDetailsCodec();

  @override
  void encodeTo(
    OnChainDidDetails obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.lastKeyId,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.activeControllerKeys,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.activeControllers,
      output,
    );
  }

  @override
  OnChainDidDetails decode(_i1.Input input) {
    return OnChainDidDetails(
      lastKeyId: _i1.U32Codec.codec.decode(input),
      activeControllerKeys: _i1.U32Codec.codec.decode(input),
      activeControllers: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(OnChainDidDetails obj) {
    int size = 0;
    size = size + const _i2.IncIdCodec().sizeHint(obj.lastKeyId);
    size = size + _i1.U32Codec.codec.sizeHint(obj.activeControllerKeys);
    size = size + _i1.U32Codec.codec.sizeHint(obj.activeControllers);
    return size;
  }
}
