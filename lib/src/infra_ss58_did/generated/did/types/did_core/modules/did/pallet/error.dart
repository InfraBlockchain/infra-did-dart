// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// Error for the DID module.
enum Error {
  /// Given public key is not of the correct size
  publicKeySizeIncorrect('PublicKeySizeIncorrect', 0),

  /// There is already a DID with same value
  didAlreadyExists('DidAlreadyExists', 1),

  /// There is no such DID registered
  didDoesNotExist('DidDoesNotExist', 2),

  /// Signature type does not match public key type
  incompatSigPubkey('IncompatSigPubkey', 3),

  /// Signature by DID failed verification
  invalidSignature('InvalidSignature', 4),
  notAnOffChainDid('NotAnOffChainDid', 5),
  didNotOwnedByAccount('DidNotOwnedByAccount', 6),
  noControllerProvided('NoControllerProvided', 7),

  /// The provided key type is not comptaible with the provided verification relationship
  incompatibleVerificationRelation('IncompatibleVerificationRelation', 8),
  cannotGetDetailForOffChainDid('CannotGetDetailForOffChainDid', 9),
  cannotGetDetailForOnChainDid('CannotGetDetailForOnChainDid', 10),
  emptyPayload('EmptyPayload', 11),
  incorrectNonce('IncorrectNonce', 12),

  /// Only controller of a DID can update the DID Doc
  onlyControllerCanUpdate('OnlyControllerCanUpdate', 13),
  noKeyForDid('NoKeyForDid', 14),
  noControllerForDid('NoControllerForDid', 15),

  /// The key does not have the required verification relationship
  insufficientVerificationRelationship(
      'InsufficientVerificationRelationship', 16),
  controllerIsAlreadyAdded('ControllerIsAlreadyAdded', 17),
  invalidServiceEndpoint('InvalidServiceEndpoint', 18),
  serviceEndpointAlreadyExists('ServiceEndpointAlreadyExists', 19),
  serviceEndpointDoesNotExist('ServiceEndpointDoesNotExist', 20),
  keyAgreementCantBeUsedForSigning('KeyAgreementCantBeUsedForSigning', 21),
  signingKeyCantBeUsedForKeyAgreement(
      'SigningKeyCantBeUsedForKeyAgreement', 22);

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
        return Error.publicKeySizeIncorrect;
      case 1:
        return Error.didAlreadyExists;
      case 2:
        return Error.didDoesNotExist;
      case 3:
        return Error.incompatSigPubkey;
      case 4:
        return Error.invalidSignature;
      case 5:
        return Error.notAnOffChainDid;
      case 6:
        return Error.didNotOwnedByAccount;
      case 7:
        return Error.noControllerProvided;
      case 8:
        return Error.incompatibleVerificationRelation;
      case 9:
        return Error.cannotGetDetailForOffChainDid;
      case 10:
        return Error.cannotGetDetailForOnChainDid;
      case 11:
        return Error.emptyPayload;
      case 12:
        return Error.incorrectNonce;
      case 13:
        return Error.onlyControllerCanUpdate;
      case 14:
        return Error.noKeyForDid;
      case 15:
        return Error.noControllerForDid;
      case 16:
        return Error.insufficientVerificationRelationship;
      case 17:
        return Error.controllerIsAlreadyAdded;
      case 18:
        return Error.invalidServiceEndpoint;
      case 19:
        return Error.serviceEndpointAlreadyExists;
      case 20:
        return Error.serviceEndpointDoesNotExist;
      case 21:
        return Error.keyAgreementCantBeUsedForSigning;
      case 22:
        return Error.signingKeyCantBeUsedForKeyAgreement;
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
