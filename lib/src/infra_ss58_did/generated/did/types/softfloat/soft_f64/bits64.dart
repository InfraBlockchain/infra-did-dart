// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef Bits64 = BigInt;

class Bits64Codec with _i1.Codec<Bits64> {
  const Bits64Codec();

  @override
  Bits64 decode(_i1.Input input) {
    return _i1.U64Codec.codec.decode(input);
  }

  @override
  void encodeTo(
    Bits64 value,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(Bits64 value) {
    return _i1.U64Codec.codec.sizeHint(value);
  }
}
