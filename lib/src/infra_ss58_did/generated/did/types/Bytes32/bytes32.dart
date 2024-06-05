// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef Bytes32 = List<int>;

class Bytes32Codec with _i1.Codec<Bytes32> {
  const Bytes32Codec();

  @override
  Bytes32 decode(_i1.Input input) {
    return const _i1.U8ArrayCodec(32).decode(input);
  }

  @override
  void encodeTo(
    Bytes32 value,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(Bytes32 value) {
    return const _i1.U8ArrayCodec(32).sizeHint(value);
  }
}
