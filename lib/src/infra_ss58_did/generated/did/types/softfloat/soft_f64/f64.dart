// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i2;

import 'bits64.dart' as _i1;

typedef F64 = _i1.Bits64;

class F64Codec with _i2.Codec<F64> {
  const F64Codec();

  @override
  F64 decode(_i2.Input input) {
    return _i2.U64Codec.codec.decode(input);
  }

  @override
  void encodeTo(
    F64 value,
    _i2.Output output,
  ) {
    _i2.U64Codec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(F64 value) {
    return const _i1.Bits64Codec().sizeHint(value);
  }
}
