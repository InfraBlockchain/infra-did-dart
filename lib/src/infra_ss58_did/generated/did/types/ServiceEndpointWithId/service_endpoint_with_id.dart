// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../ServiceEndpoint/service_endpoint.dart' as _i3;
import '../ServiceEndpointId/service_endpoint_id.dart' as _i2;

class ServiceEndpointWithId {
  const ServiceEndpointWithId({
    required this.id,
    required this.endpoint,
  });

  factory ServiceEndpointWithId.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// ServiceEndpointId<T>
  final _i2.ServiceEndpointId id;

  /// ServiceEndpoint<T>
  final _i3.ServiceEndpoint endpoint;

  static const $ServiceEndpointWithIdCodec codec =
      $ServiceEndpointWithIdCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'endpoint': endpoint.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ServiceEndpointWithId &&
          other.id == id &&
          other.endpoint == endpoint;

  @override
  int get hashCode => Object.hash(
        id,
        endpoint,
      );
}

class $ServiceEndpointWithIdCodec with _i1.Codec<ServiceEndpointWithId> {
  const $ServiceEndpointWithIdCodec();

  @override
  void encodeTo(
    ServiceEndpointWithId obj,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.id,
      output,
    );
    _i3.ServiceEndpoint.codec.encodeTo(
      obj.endpoint,
      output,
    );
  }

  @override
  ServiceEndpointWithId decode(_i1.Input input) {
    return ServiceEndpointWithId(
      id: _i1.U8SequenceCodec.codec.decode(input),
      endpoint: _i3.ServiceEndpoint.codec.decode(input),
    );
  }

  @override
  int sizeHint(ServiceEndpointWithId obj) {
    int size = 0;
    size = size + const _i2.ServiceEndpointIdCodec().sizeHint(obj.id);
    size = size + _i3.ServiceEndpoint.codec.sizeHint(obj.endpoint);
    return size;
  }
}
