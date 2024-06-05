// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i2;

import '../BoundedBytes/bounded_bytes_3.dart' as _i1;

typedef ServiceEndpointOrigin = _i1.BoundedBytes;

class ServiceEndpointOriginCodec with _i2.Codec<ServiceEndpointOrigin> {
  const ServiceEndpointOriginCodec();

  @override
  ServiceEndpointOrigin decode(_i2.Input input) {
    return _i2.U8SequenceCodec.codec.decode(input);
  }

  @override
  void encodeTo(
    ServiceEndpointOrigin value,
    _i2.Output output,
  ) {
    _i2.U8SequenceCodec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(ServiceEndpointOrigin value) {
    return const _i1.BoundedBytesCodec().sizeHint(value);
  }
}
