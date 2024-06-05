// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// Mode of Runtime cannot be changed(e.g SystemTokenMissing)
  notAllowedToChangeState('NotAllowedToChangeState', 0),

  /// System Token is not registered
  systemTokenMissing('SystemTokenMissing', 1),

  /// System Token has not been requested
  systemTokenNotRequested('SystemTokenNotRequested', 2),

  /// Runtime has not been initiated(e.g BaseConfigMissing)
  notInitiated('NotInitiated', 3),

  /// Error occured while updating weight of System Token
  errorUpdateWeight('ErrorUpdateWeight', 4),

  /// Error occured while registering System Token
  errorRegisterSystemToken('ErrorRegisterSystemToken', 5),

  /// Error occured while deregistering System Token
  errorDeregisterSystemToken('ErrorDeregisterSystemToken', 6),

  /// Error occured while creating wrapped local asset
  errorCreateWrappedLocalAsset('ErrorCreateWrappedLocalAsset', 7),

  /// Error occured while linking asset
  errorLinkAsset('ErrorLinkAsset', 8),

  /// Error occured while unlinking asset
  errorUnlinkAsset('ErrorUnlinkAsset', 9),

  /// No permission to call this function
  noPermission('NoPermission', 10),

  /// Error occured while getting metadata
  errorOnGetMetadata('ErrorOnGetMetadata', 11),

  /// Error occured while requesting register
  errorOnRequestRegister('ErrorOnRequestRegister', 12),

  /// Currently request queue for System Token registration is fully occupied
  tooManyRequests('TooManyRequests', 13),

  /// System Token has already been requested
  alreadyRequested('AlreadyRequested', 14),

  /// Register is not valid(e.g Outdated registration)
  invalidRegister('InvalidRegister', 15);

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
        return Error.notAllowedToChangeState;
      case 1:
        return Error.systemTokenMissing;
      case 2:
        return Error.systemTokenNotRequested;
      case 3:
        return Error.notInitiated;
      case 4:
        return Error.errorUpdateWeight;
      case 5:
        return Error.errorRegisterSystemToken;
      case 6:
        return Error.errorDeregisterSystemToken;
      case 7:
        return Error.errorCreateWrappedLocalAsset;
      case 8:
        return Error.errorLinkAsset;
      case 9:
        return Error.errorUnlinkAsset;
      case 10:
        return Error.noPermission;
      case 11:
        return Error.errorOnGetMetadata;
      case 12:
        return Error.errorOnRequestRegister;
      case 13:
        return Error.tooManyRequests;
      case 14:
        return Error.alreadyRequested;
      case 15:
        return Error.invalidRegister;
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
