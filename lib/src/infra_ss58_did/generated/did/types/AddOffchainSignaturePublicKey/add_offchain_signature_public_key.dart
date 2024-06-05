// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../Did/did.dart' as _i3;
import '../OffchainPublicKey/offchain_public_key.dart' as _i2;

class AddOffchainSignaturePublicKey {
  const AddOffchainSignaturePublicKey({
    required this.key,
    required this.did,
    required this.nonce,
  });

  factory AddOffchainSignaturePublicKey.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// OffchainPublicKey<T>
  final _i2.OffchainPublicKey key;

  /// Did
  final _i3.Did did;

  /// T::BlockNumber
  final int nonce;

  static const $AddOffchainSignaturePublicKeyCodec codec =
      $AddOffchainSignaturePublicKeyCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'key': key.toJson(),
        'did': did.toList(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddOffchainSignaturePublicKey &&
          other.key == key &&
          _i5.listsEqual(
            other.did,
            did,
          ) &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        key,
        did,
        nonce,
      );
}

class $AddOffchainSignaturePublicKeyCodec
    with _i1.Codec<AddOffchainSignaturePublicKey> {
  const $AddOffchainSignaturePublicKeyCodec();

  @override
  void encodeTo(
    AddOffchainSignaturePublicKey obj,
    _i1.Output output,
  ) {
    _i2.OffchainPublicKey.codec.encodeTo(
      obj.key,
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
  AddOffchainSignaturePublicKey decode(_i1.Input input) {
    return AddOffchainSignaturePublicKey(
      key: _i2.OffchainPublicKey.codec.decode(input),
      did: const _i1.U8ArrayCodec(32).decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AddOffchainSignaturePublicKey obj) {
    int size = 0;
    size = size + _i2.OffchainPublicKey.codec.sizeHint(obj.key);
    size = size + const _i3.DidCodec().sizeHint(obj.did);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
