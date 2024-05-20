// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../Did/did.dart' as _i2;
import '../ServiceEndpointId/service_endpoint_id.dart' as _i3;

class RemoveServiceEndpoint {
  const RemoveServiceEndpoint({
    required this.did,
    required this.id,
    required this.nonce,
  });

  factory RemoveServiceEndpoint.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Did
  final _i2.Did did;

  /// ServiceEndpointId<T>
  final _i3.ServiceEndpointId id;

  /// T::BlockNumber
  final int nonce;

  static const $RemoveServiceEndpointCodec codec =
      $RemoveServiceEndpointCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'did': did.toList(),
        'id': id,
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveServiceEndpoint &&
          _i5.listsEqual(
            other.did,
            did,
          ) &&
          other.id == id &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        did,
        id,
        nonce,
      );
}

class $RemoveServiceEndpointCodec with _i1.Codec<RemoveServiceEndpoint> {
  const $RemoveServiceEndpointCodec();

  @override
  void encodeTo(
    RemoveServiceEndpoint obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.did,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.id,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  RemoveServiceEndpoint decode(_i1.Input input) {
    return RemoveServiceEndpoint(
      did: const _i1.U8ArrayCodec(32).decode(input),
      id: _i1.U8SequenceCodec.codec.decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(RemoveServiceEndpoint obj) {
    int size = 0;
    size = size + const _i2.DidCodec().sizeHint(obj.did);
    size = size + const _i3.ServiceEndpointIdCodec().sizeHint(obj.id);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
