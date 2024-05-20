// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../Did/did.dart' as _i2;

class DidRemoval {
  const DidRemoval({
    required this.did,
    required this.nonce,
  });

  factory DidRemoval.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Did
  final _i2.Did did;

  /// T::BlockNumber
  final int nonce;

  static const $DidRemovalCodec codec = $DidRemovalCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'did': did.toList(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DidRemoval &&
          _i4.listsEqual(
            other.did,
            did,
          ) &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        did,
        nonce,
      );
}

class $DidRemovalCodec with _i1.Codec<DidRemoval> {
  const $DidRemovalCodec();

  @override
  void encodeTo(
    DidRemoval obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.did,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  DidRemoval decode(_i1.Input input) {
    return DidRemoval(
      did: const _i1.U8ArrayCodec(32).decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(DidRemoval obj) {
    int size = 0;
    size = size + const _i2.DidCodec().sizeHint(obj.did);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
