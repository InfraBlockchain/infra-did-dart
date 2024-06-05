// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i2;

import '../Did/did.dart' as _i1;

typedef Controller = _i1.Did;

class ControllerCodec with _i2.Codec<Controller> {
  const ControllerCodec();

  @override
  Controller decode(_i2.Input input) {
    return const _i2.U8ArrayCodec(32).decode(input);
  }

  @override
  void encodeTo(
    Controller value,
    _i2.Output output,
  ) {
    const _i2.U8ArrayCodec(32).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(Controller value) {
    return const _i1.DidCodec().sizeHint(value);
  }
}
