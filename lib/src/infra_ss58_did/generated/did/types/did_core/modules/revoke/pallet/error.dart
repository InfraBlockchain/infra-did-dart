// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// Revocation Error
enum Error {
  /// A revocation registry with that name already exists.
  regExists('RegExists', 0),

  /// nonce is incorrect. This is related to replay protection.
  incorrectNonce('IncorrectNonce', 1),

  /// Too many controllers specified.
  tooManyControllers('TooManyControllers', 2),

  /// This registry is marked as add_only. Deletion of revocations is not allowed. Deletion
  /// of the registry is not allowed.
  addOnly('AddOnly', 3),

  /// Action is empty.
  emptyPayload('EmptyPayload', 4);

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
        return Error.regExists;
      case 1:
        return Error.incorrectNonce;
      case 2:
        return Error.tooManyControllers;
      case 3:
        return Error.addOnly;
      case 4:
        return Error.emptyPayload;
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
