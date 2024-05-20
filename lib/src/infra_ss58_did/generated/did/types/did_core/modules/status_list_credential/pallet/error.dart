// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// Error for the StatusListCredential module.
enum Error {
  /// There is already a `StatusListCredential` with the same id
  statusListCredentialAlreadyExists('StatusListCredentialAlreadyExists', 0),

  /// The `StatusListCredential` byte length is less than `MinStatusListCredentialSize`
  statusListCredentialTooSmall('StatusListCredentialTooSmall', 1),

  /// Action can't have an empty payload.
  emptyPayload('EmptyPayload', 2);

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
        return Error.statusListCredentialAlreadyExists;
      case 1:
        return Error.statusListCredentialTooSmall;
      case 2:
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
