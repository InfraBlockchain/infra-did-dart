// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../ServiceEndpointOrigin/service_endpoint_origin.dart' as _i3;
import '../ServiceEndpointType/service_endpoint_type.dart' as _i2;

class ServiceEndpoint {
  const ServiceEndpoint({
    required this.types,
    required this.origins,
  });

  factory ServiceEndpoint.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// ServiceEndpointType
  final _i2.ServiceEndpointType types;

  /// BoundedVec<ServiceEndpointOrigin<T>, T::MaxDidServiceEndpointOrigins>
  final List<_i3.ServiceEndpointOrigin> origins;

  static const $ServiceEndpointCodec codec = $ServiceEndpointCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'types': types,
        'origins': origins.map((value) => value).toList(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ServiceEndpoint &&
          other.types == types &&
          _i5.listsEqual(
            other.origins,
            origins,
          );

  @override
  int get hashCode => Object.hash(
        types,
        origins,
      );
}

class $ServiceEndpointCodec with _i1.Codec<ServiceEndpoint> {
  const $ServiceEndpointCodec();

  @override
  void encodeTo(
    ServiceEndpoint obj,
    _i1.Output output,
  ) {
    _i1.U16Codec.codec.encodeTo(
      obj.types,
      output,
    );
    const _i1.SequenceCodec<_i3.ServiceEndpointOrigin>(
            _i3.ServiceEndpointOriginCodec())
        .encodeTo(
      obj.origins,
      output,
    );
  }

  @override
  ServiceEndpoint decode(_i1.Input input) {
    return ServiceEndpoint(
      types: _i1.U16Codec.codec.decode(input),
      origins: const _i1.SequenceCodec<_i3.ServiceEndpointOrigin>(
              _i3.ServiceEndpointOriginCodec())
          .decode(input),
    );
  }

  @override
  int sizeHint(ServiceEndpoint obj) {
    int size = 0;
    size = size + const _i2.ServiceEndpointTypeCodec().sizeHint(obj.types);
    size = size +
        const _i1.SequenceCodec<_i3.ServiceEndpointOrigin>(
                _i3.ServiceEndpointOriginCodec())
            .sizeHint(obj.origins);
    return size;
  }
}
