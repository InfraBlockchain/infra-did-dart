// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef Bytes64 = List<int>;

class Bytes64Codec with _i1.Codec<Bytes64> {
  const Bytes64Codec();

  @override
  Bytes64 decode(_i1.Input input) {
    return const _i1.U8ArrayCodec(64).decode(input);
  }

  @override
  void encodeTo(
    Bytes64 value,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(64).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(Bytes64 value) {
    return const _i1.U8ArrayCodec(64).sizeHint(value);
  }
}
