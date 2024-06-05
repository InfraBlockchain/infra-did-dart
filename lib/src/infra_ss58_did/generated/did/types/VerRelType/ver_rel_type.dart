// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef VerRelType = int;

class VerRelTypeCodec with _i1.Codec<VerRelType> {
  const VerRelTypeCodec();

  @override
  VerRelType decode(_i1.Input input) {
    return _i1.U16Codec.codec.decode(input);
  }

  @override
  void encodeTo(
    VerRelType value,
    _i1.Output output,
  ) {
    _i1.U16Codec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(VerRelType value) {
    return _i1.U16Codec.codec.sizeHint(value);
  }
}
