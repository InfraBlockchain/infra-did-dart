// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i2;

import 'IncId/inc_id.dart' as _i1;

typedef BTreeSet = List<_i1.IncId>;

class BTreeSetCodec with _i2.Codec<BTreeSet> {
  const BTreeSetCodec();

  @override
  BTreeSet decode(_i2.Input input) {
    return const _i2.SequenceCodec<_i1.IncId>(_i1.IncIdCodec()).decode(input);
  }

  @override
  void encodeTo(
    BTreeSet value,
    _i2.Output output,
  ) {
    const _i2.SequenceCodec<_i1.IncId>(_i1.IncIdCodec()).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(BTreeSet value) {
    return const _i2.SequenceCodec<_i1.IncId>(_i1.IncIdCodec()).sizeHint(value);
  }
}
