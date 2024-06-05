// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i2;

import '../Did/did.dart' as _i1;

typedef BlobOwner = _i1.Did;

class BlobOwnerCodec with _i2.Codec<BlobOwner> {
  const BlobOwnerCodec();

  @override
  BlobOwner decode(_i2.Input input) {
    return const _i2.U8ArrayCodec(32).decode(input);
  }

  @override
  void encodeTo(
    BlobOwner value,
    _i2.Output output,
  ) {
    const _i2.U8ArrayCodec(32).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(BlobOwner value) {
    return const _i1.DidCodec().sizeHint(value);
  }
}
