// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  paramsDontExist('ParamsDontExist', 0),
  publicKeyDoesntExist('PublicKeyDoesntExist', 1),
  accumulatedTooBig('AccumulatedTooBig', 2),
  accumulatorDoesntExist('AccumulatorDoesntExist', 3),
  accumulatorAlreadyExists('AccumulatorAlreadyExists', 4),
  notPublicKeyOwner('NotPublicKeyOwner', 5),
  notAccumulatorOwner('NotAccumulatorOwner', 6),
  incorrectNonce('IncorrectNonce', 7);

  const Error(
    this.variantName,
    this.codecIndex,
  );

  factory Error.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ErrorCodec codec = $ErrorCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ErrorCodec with _i1.Codec<Error> {
  const $ErrorCodec();

  @override
  Error decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Error.paramsDontExist;
      case 1:
        return Error.publicKeyDoesntExist;
      case 2:
        return Error.accumulatedTooBig;
      case 3:
        return Error.accumulatorDoesntExist;
      case 4:
        return Error.accumulatorAlreadyExists;
      case 5:
        return Error.notPublicKeyOwner;
      case 6:
        return Error.notAccumulatorOwner;
      case 7:
        return Error.incorrectNonce;
      default:
        throw Exception('Error: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Error value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
