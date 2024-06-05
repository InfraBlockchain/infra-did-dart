// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// The pallet has too many candidates.
  tooManyCandidates('TooManyCandidates', 0),

  /// Leaving would result in too few candidates.
  tooFewEligibleCollators('TooFewEligibleCollators', 1),

  /// Account is already a candidate.
  alreadyCandidate('AlreadyCandidate', 2),

  /// Account is not a candidate.
  notCandidate('NotCandidate', 3),

  /// There are too many Invulnerables.
  tooManyInvulnerables('TooManyInvulnerables', 4),

  /// Account is already an Invulnerable.
  alreadyInvulnerable('AlreadyInvulnerable', 5),

  /// Account is not an Invulnerable.
  notInvulnerable('NotInvulnerable', 6),

  /// Account has no associated validator ID.
  noAssociatedValidatorId('NoAssociatedValidatorId', 7),

  /// Validator ID is not yet registered.
  validatorNotRegistered('ValidatorNotRegistered', 8);

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
        return Error.tooManyCandidates;
      case 1:
        return Error.tooFewEligibleCollators;
      case 2:
        return Error.alreadyCandidate;
      case 3:
        return Error.notCandidate;
      case 4:
        return Error.tooManyInvulnerables;
      case 5:
        return Error.alreadyInvulnerable;
      case 6:
        return Error.notInvulnerable;
      case 7:
        return Error.noAssociatedValidatorId;
      case 8:
        return Error.validatorNotRegistered;
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
