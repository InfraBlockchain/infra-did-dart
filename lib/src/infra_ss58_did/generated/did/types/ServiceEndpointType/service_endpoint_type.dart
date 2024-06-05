// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef ServiceEndpointType = int;

class ServiceEndpointTypeCodec with _i1.Codec<ServiceEndpointType> {
  const ServiceEndpointTypeCodec();

  @override
  ServiceEndpointType decode(_i1.Input input) {
    return _i1.U16Codec.codec.decode(input);
  }

  @override
  void encodeTo(
    ServiceEndpointType value,
    _i1.Output output,
  ) {
    _i1.U16Codec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(ServiceEndpointType value) {
    return _i1.U16Codec.codec.sizeHint(value);
  }
}
