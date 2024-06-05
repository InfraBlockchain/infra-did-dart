// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../Did/did.dart' as _i3;
import '../IncId/inc_id.dart' as _i4;
import '../tuples.dart' as _i2;

class RemoveOffchainSignaturePublicKey {
  const RemoveOffchainSignaturePublicKey({
    required this.keyRef,
    required this.did,
    required this.nonce,
  });

  factory RemoveOffchainSignaturePublicKey.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// SignaturePublicKeyStorageKey
  final _i2.Tuple2<_i3.Did, _i4.IncId> keyRef;

  /// Did
  final _i3.Did did;

  /// T::BlockNumber
  final int nonce;

  static const $RemoveOffchainSignaturePublicKeyCodec codec =
      $RemoveOffchainSignaturePublicKeyCodec();

  _i5.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'keyRef': [
          keyRef.value0.toList(),
          keyRef.value1,
        ],
        'did': did.toList(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveOffchainSignaturePublicKey &&
          other.keyRef == keyRef &&
          _i6.listsEqual(
            other.did,
            did,
          ) &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        keyRef,
        did,
        nonce,
      );
}

class $RemoveOffchainSignaturePublicKeyCodec
    with _i1.Codec<RemoveOffchainSignaturePublicKey> {
  const $RemoveOffchainSignaturePublicKeyCodec();

  @override
  void encodeTo(
    RemoveOffchainSignaturePublicKey obj,
    _i1.Output output,
  ) {
    const _i2.Tuple2Codec<_i3.Did, _i4.IncId>(
      _i3.DidCodec(),
      _i4.IncIdCodec(),
    ).encodeTo(
      obj.keyRef,
      output,
    );
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
  RemoveOffchainSignaturePublicKey decode(_i1.Input input) {
    return RemoveOffchainSignaturePublicKey(
      keyRef: const _i2.Tuple2Codec<_i3.Did, _i4.IncId>(
        _i3.DidCodec(),
        _i4.IncIdCodec(),
      ).decode(input),
      did: const _i1.U8ArrayCodec(32).decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(RemoveOffchainSignaturePublicKey obj) {
    int size = 0;
    size = size +
        const _i2.Tuple2Codec<_i3.Did, _i4.IncId>(
          _i3.DidCodec(),
          _i4.IncIdCodec(),
        ).sizeHint(obj.keyRef);
    size = size + const _i3.DidCodec().sizeHint(obj.did);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
