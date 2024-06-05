// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i2;

import '../Did/did.dart' as _i1;

typedef Attester = _i1.Did;

class AttesterCodec with _i2.Codec<Attester> {
  const AttesterCodec();

  @override
  Attester decode(_i2.Input input) {
    return const _i2.U8ArrayCodec(32).decode(input);
  }

  @override
  void encodeTo(
    Attester value,
    _i2.Output output,
  ) {
    const _i2.U8ArrayCodec(32).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(Attester value) {
    return const _i1.DidCodec().sizeHint(value);
  }
}
