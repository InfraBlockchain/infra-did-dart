// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef IncId = int;

class IncIdCodec with _i1.Codec<IncId> {
  const IncIdCodec();

  @override
  IncId decode(_i1.Input input) {
    return _i1.U32Codec.codec.decode(input);
  }

  @override
  void encodeTo(
    IncId value,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(IncId value) {
    return _i1.U32Codec.codec.sizeHint(value);
  }
}
