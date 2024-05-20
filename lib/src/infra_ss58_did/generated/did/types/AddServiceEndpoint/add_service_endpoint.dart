// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../Did/did.dart' as _i2;
import '../ServiceEndpoint/service_endpoint.dart' as _i4;
import '../ServiceEndpointId/service_endpoint_id.dart' as _i3;

class AddServiceEndpoint {
  const AddServiceEndpoint({
    required this.did,
    required this.id,
    required this.endpoint,
    required this.nonce,
  });

  factory AddServiceEndpoint.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Did
  final _i2.Did did;

  /// ServiceEndpointId<T>
  final _i3.ServiceEndpointId id;

  /// ServiceEndpoint<T>
  final _i4.ServiceEndpoint endpoint;

  /// T::BlockNumber
  final int nonce;

  static const $AddServiceEndpointCodec codec = $AddServiceEndpointCodec();

  _i5.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'did': did.toList(),
        'id': id,
        'endpoint': endpoint.toJson(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddServiceEndpoint &&
          _i6.listsEqual(
            other.did,
            did,
          ) &&
          other.id == id &&
          other.endpoint == endpoint &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        did,
        id,
        endpoint,
        nonce,
      );
}

class $AddServiceEndpointCodec with _i1.Codec<AddServiceEndpoint> {
  const $AddServiceEndpointCodec();

  @override
  void encodeTo(
    AddServiceEndpoint obj,
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
    _i4.ServiceEndpoint.codec.encodeTo(
      obj.endpoint,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  AddServiceEndpoint decode(_i1.Input input) {
    return AddServiceEndpoint(
      did: const _i1.U8ArrayCodec(32).decode(input),
      id: _i1.U8SequenceCodec.codec.decode(input),
      endpoint: _i4.ServiceEndpoint.codec.decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AddServiceEndpoint obj) {
    int size = 0;
    size = size + const _i2.DidCodec().sizeHint(obj.did);
    size = size + const _i3.ServiceEndpointIdCodec().sizeHint(obj.id);
    size = size + _i4.ServiceEndpoint.codec.sizeHint(obj.endpoint);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
