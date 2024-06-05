// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef BoundedBytes = List<int>;

class BoundedBytesCodec with _i1.Codec<BoundedBytes> {
  const BoundedBytesCodec();

  @override
  BoundedBytes decode(_i1.Input input) {
    return _i1.U8SequenceCodec.codec.decode(input);
  }

  @override
  void encodeTo(
    BoundedBytes value,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(BoundedBytes value) {
    return _i1.U8SequenceCodec.codec.sizeHint(value);
  }
}
