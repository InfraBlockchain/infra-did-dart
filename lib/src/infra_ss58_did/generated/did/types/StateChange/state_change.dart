// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../AddAccumulator/add_accumulator.dart' as _i53;
import '../AddAccumulatorParams/add_accumulator_params.dart' as _i49;
import '../AddAccumulatorPublicKey/add_accumulator_public_key.dart' as _i50;
import '../AddBlob/add_blob.dart' as _i43;
import '../AddControllers/add_controllers.dart' as _i34;
import '../AddKeys/add_keys.dart' as _i33;
import '../AddOffchainSignatureParams/add_offchain_signature_params.dart'
    as _i45;
import '../AddOffchainSignaturePublicKey/add_offchain_signature_public_key.dart'
    as _i46;
import '../AddServiceEndpoint/add_service_endpoint.dart' as _i37;
import '../cow_10.dart' as _i11;
import '../cow_11.dart' as _i12;
import '../cow_12.dart' as _i13;
import '../cow_13.dart' as _i14;
import '../cow_14.dart' as _i15;
import '../cow_15.dart' as _i16;
import '../cow_16.dart' as _i17;
import '../cow_17.dart' as _i18;
import '../cow_18.dart' as _i19;
import '../cow_19.dart' as _i20;
import '../cow_2.dart' as _i3;
import '../cow_20.dart' as _i21;
import '../cow_21.dart' as _i22;
import '../cow_22.dart' as _i23;
import '../cow_23.dart' as _i24;
import '../cow_24.dart' as _i25;
import '../cow_25.dart' as _i26;
import '../cow_26.dart' as _i27;
import '../cow_27.dart' as _i28;
import '../cow_28.dart' as _i29;
import '../cow_29.dart' as _i30;
import '../cow_3.dart' as _i4;
import '../cow_30.dart' as _i31;
import '../cow_31.dart' as _i32;
import '../cow_4.dart' as _i5;
import '../cow_5.dart' as _i6;
import '../cow_6.dart' as _i7;
import '../cow_7.dart' as _i8;
import '../cow_8.dart' as _i9;
import '../cow_9.dart' as _i10;
import '../DidRemoval/did_removal.dart' as _i39;
import '../RemoveAccumulator/remove_accumulator.dart' as _i55;
import '../RemoveAccumulatorParams/remove_accumulator_params.dart' as _i51;
import '../RemoveAccumulatorPublicKey/remove_accumulator_public_key.dart'
    as _i52;
import '../RemoveControllers/remove_controllers.dart' as _i36;
import '../RemoveKeys/remove_keys.dart' as _i35;
import '../RemoveOffchainSignatureParams/remove_offchain_signature_params.dart'
    as _i47;
import '../RemoveOffchainSignaturePublicKey/remove_offchain_signature_public_key.dart'
    as _i48;
import '../RemoveServiceEndpoint/remove_service_endpoint.dart' as _i38;
import '../SetAttestationClaim/set_attestation_claim.dart' as _i44;
import '../UpdateAccumulator/update_accumulator.dart' as _i54;
import '../WithNonce/with_nonce_1.dart' as _i40;
import '../WithNonce/with_nonce_10.dart' as _i62;
import '../WithNonce/with_nonce_2.dart' as _i41;
import '../WithNonce/with_nonce_3.dart' as _i42;
import '../WithNonce/with_nonce_4.dart' as _i56;
import '../WithNonce/with_nonce_5.dart' as _i57;
import '../WithNonce/with_nonce_6.dart' as _i58;
import '../WithNonce/with_nonce_7.dart' as _i59;
import '../WithNonce/with_nonce_8.dart' as _i60;
import '../WithNonce/with_nonce_9.dart' as _i61;

abstract class StateChange {
  const StateChange();

  factory StateChange.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $StateChangeCodec codec = $StateChangeCodec();

  static const $StateChange values = $StateChange();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, dynamic>> toJson();
}

class $StateChange {
  const $StateChange();

  AddKeys addKeys(_i3.Cow value0) {
    return AddKeys(value0);
  }

  AddControllers addControllers(_i4.Cow value0) {
    return AddControllers(value0);
  }

  RemoveKeys removeKeys(_i5.Cow value0) {
    return RemoveKeys(value0);
  }

  RemoveControllers removeControllers(_i6.Cow value0) {
    return RemoveControllers(value0);
  }

  AddServiceEndpoint addServiceEndpoint(_i7.Cow value0) {
    return AddServiceEndpoint(value0);
  }

  RemoveServiceEndpoint removeServiceEndpoint(_i8.Cow value0) {
    return RemoveServiceEndpoint(value0);
  }

  DidRemoval didRemoval(_i9.Cow value0) {
    return DidRemoval(value0);
  }

  Revoke revoke(_i10.Cow value0) {
    return Revoke(value0);
  }

  UnRevoke unRevoke(_i11.Cow value0) {
    return UnRevoke(value0);
  }

  RemoveRegistry removeRegistry(_i12.Cow value0) {
    return RemoveRegistry(value0);
  }

  AddBlob addBlob(_i13.Cow value0) {
    return AddBlob(value0);
  }

  SetAttestationClaim setAttestationClaim(_i14.Cow value0) {
    return SetAttestationClaim(value0);
  }

  AddOffchainSignatureParams addOffchainSignatureParams(_i15.Cow value0) {
    return AddOffchainSignatureParams(value0);
  }

  AddOffchainSignaturePublicKey addOffchainSignaturePublicKey(_i16.Cow value0) {
    return AddOffchainSignaturePublicKey(value0);
  }

  RemoveOffchainSignatureParams removeOffchainSignatureParams(_i17.Cow value0) {
    return RemoveOffchainSignatureParams(value0);
  }

  RemoveOffchainSignaturePublicKey removeOffchainSignaturePublicKey(
      _i18.Cow value0) {
    return RemoveOffchainSignaturePublicKey(value0);
  }

  AddAccumulatorParams addAccumulatorParams(_i19.Cow value0) {
    return AddAccumulatorParams(value0);
  }

  AddAccumulatorPublicKey addAccumulatorPublicKey(_i20.Cow value0) {
    return AddAccumulatorPublicKey(value0);
  }

  RemoveAccumulatorParams removeAccumulatorParams(_i21.Cow value0) {
    return RemoveAccumulatorParams(value0);
  }

  RemoveAccumulatorPublicKey removeAccumulatorPublicKey(_i22.Cow value0) {
    return RemoveAccumulatorPublicKey(value0);
  }

  AddAccumulator addAccumulator(_i23.Cow value0) {
    return AddAccumulator(value0);
  }

  UpdateAccumulator updateAccumulator(_i24.Cow value0) {
    return UpdateAccumulator(value0);
  }

  RemoveAccumulator removeAccumulator(_i25.Cow value0) {
    return RemoveAccumulator(value0);
  }

  UpdateStatusListCredential updateStatusListCredential(_i26.Cow value0) {
    return UpdateStatusListCredential(value0);
  }

  RemoveStatusListCredential removeStatusListCredential(_i27.Cow value0) {
    return RemoveStatusListCredential(value0);
  }

  AddIssuer addIssuer(_i28.Cow value0) {
    return AddIssuer(value0);
  }

  RemoveIssuer removeIssuer(_i29.Cow value0) {
    return RemoveIssuer(value0);
  }

  AddVerifier addVerifier(_i30.Cow value0) {
    return AddVerifier(value0);
  }

  RemoveVerifier removeVerifier(_i31.Cow value0) {
    return RemoveVerifier(value0);
  }

  RemoveAuthorizer removeAuthorizer(_i32.Cow value0) {
    return RemoveAuthorizer(value0);
  }
}

class $StateChangeCodec with _i1.Codec<StateChange> {
  const $StateChangeCodec();

  @override
  StateChange decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return AddKeys._decode(input);
      case 1:
        return AddControllers._decode(input);
      case 2:
        return RemoveKeys._decode(input);
      case 3:
        return RemoveControllers._decode(input);
      case 4:
        return AddServiceEndpoint._decode(input);
      case 5:
        return RemoveServiceEndpoint._decode(input);
      case 6:
        return DidRemoval._decode(input);
      case 7:
        return Revoke._decode(input);
      case 8:
        return UnRevoke._decode(input);
      case 9:
        return RemoveRegistry._decode(input);
      case 10:
        return AddBlob._decode(input);
      case 11:
        return SetAttestationClaim._decode(input);
      case 12:
        return AddOffchainSignatureParams._decode(input);
      case 13:
        return AddOffchainSignaturePublicKey._decode(input);
      case 14:
        return RemoveOffchainSignatureParams._decode(input);
      case 15:
        return RemoveOffchainSignaturePublicKey._decode(input);
      case 16:
        return AddAccumulatorParams._decode(input);
      case 17:
        return AddAccumulatorPublicKey._decode(input);
      case 18:
        return RemoveAccumulatorParams._decode(input);
      case 19:
        return RemoveAccumulatorPublicKey._decode(input);
      case 20:
        return AddAccumulator._decode(input);
      case 21:
        return UpdateAccumulator._decode(input);
      case 22:
        return RemoveAccumulator._decode(input);
      case 23:
        return UpdateStatusListCredential._decode(input);
      case 24:
        return RemoveStatusListCredential._decode(input);
      case 25:
        return AddIssuer._decode(input);
      case 26:
        return RemoveIssuer._decode(input);
      case 27:
        return AddVerifier._decode(input);
      case 28:
        return RemoveVerifier._decode(input);
      case 29:
        return RemoveAuthorizer._decode(input);
      default:
        throw Exception('StateChange: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    StateChange value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case AddKeys:
        (value as AddKeys).encodeTo(output);
        break;
      case AddControllers:
        (value as AddControllers).encodeTo(output);
        break;
      case RemoveKeys:
        (value as RemoveKeys).encodeTo(output);
        break;
      case RemoveControllers:
        (value as RemoveControllers).encodeTo(output);
        break;
      case AddServiceEndpoint:
        (value as AddServiceEndpoint).encodeTo(output);
        break;
      case RemoveServiceEndpoint:
        (value as RemoveServiceEndpoint).encodeTo(output);
        break;
      case DidRemoval:
        (value as DidRemoval).encodeTo(output);
        break;
      case Revoke:
        (value as Revoke).encodeTo(output);
        break;
      case UnRevoke:
        (value as UnRevoke).encodeTo(output);
        break;
      case RemoveRegistry:
        (value as RemoveRegistry).encodeTo(output);
        break;
      case AddBlob:
        (value as AddBlob).encodeTo(output);
        break;
      case SetAttestationClaim:
        (value as SetAttestationClaim).encodeTo(output);
        break;
      case AddOffchainSignatureParams:
        (value as AddOffchainSignatureParams).encodeTo(output);
        break;
      case AddOffchainSignaturePublicKey:
        (value as AddOffchainSignaturePublicKey).encodeTo(output);
        break;
      case RemoveOffchainSignatureParams:
        (value as RemoveOffchainSignatureParams).encodeTo(output);
        break;
      case RemoveOffchainSignaturePublicKey:
        (value as RemoveOffchainSignaturePublicKey).encodeTo(output);
        break;
      case AddAccumulatorParams:
        (value as AddAccumulatorParams).encodeTo(output);
        break;
      case AddAccumulatorPublicKey:
        (value as AddAccumulatorPublicKey).encodeTo(output);
        break;
      case RemoveAccumulatorParams:
        (value as RemoveAccumulatorParams).encodeTo(output);
        break;
      case RemoveAccumulatorPublicKey:
        (value as RemoveAccumulatorPublicKey).encodeTo(output);
        break;
      case AddAccumulator:
        (value as AddAccumulator).encodeTo(output);
        break;
      case UpdateAccumulator:
        (value as UpdateAccumulator).encodeTo(output);
        break;
      case RemoveAccumulator:
        (value as RemoveAccumulator).encodeTo(output);
        break;
      case UpdateStatusListCredential:
        (value as UpdateStatusListCredential).encodeTo(output);
        break;
      case RemoveStatusListCredential:
        (value as RemoveStatusListCredential).encodeTo(output);
        break;
      case AddIssuer:
        (value as AddIssuer).encodeTo(output);
        break;
      case RemoveIssuer:
        (value as RemoveIssuer).encodeTo(output);
        break;
      case AddVerifier:
        (value as AddVerifier).encodeTo(output);
        break;
      case RemoveVerifier:
        (value as RemoveVerifier).encodeTo(output);
        break;
      case RemoveAuthorizer:
        (value as RemoveAuthorizer).encodeTo(output);
        break;
      default:
        throw Exception(
            'StateChange: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(StateChange value) {
    switch (value.runtimeType) {
      case AddKeys:
        return (value as AddKeys)._sizeHint();
      case AddControllers:
        return (value as AddControllers)._sizeHint();
      case RemoveKeys:
        return (value as RemoveKeys)._sizeHint();
      case RemoveControllers:
        return (value as RemoveControllers)._sizeHint();
      case AddServiceEndpoint:
        return (value as AddServiceEndpoint)._sizeHint();
      case RemoveServiceEndpoint:
        return (value as RemoveServiceEndpoint)._sizeHint();
      case DidRemoval:
        return (value as DidRemoval)._sizeHint();
      case Revoke:
        return (value as Revoke)._sizeHint();
      case UnRevoke:
        return (value as UnRevoke)._sizeHint();
      case RemoveRegistry:
        return (value as RemoveRegistry)._sizeHint();
      case AddBlob:
        return (value as AddBlob)._sizeHint();
      case SetAttestationClaim:
        return (value as SetAttestationClaim)._sizeHint();
      case AddOffchainSignatureParams:
        return (value as AddOffchainSignatureParams)._sizeHint();
      case AddOffchainSignaturePublicKey:
        return (value as AddOffchainSignaturePublicKey)._sizeHint();
      case RemoveOffchainSignatureParams:
        return (value as RemoveOffchainSignatureParams)._sizeHint();
      case RemoveOffchainSignaturePublicKey:
        return (value as RemoveOffchainSignaturePublicKey)._sizeHint();
      case AddAccumulatorParams:
        return (value as AddAccumulatorParams)._sizeHint();
      case AddAccumulatorPublicKey:
        return (value as AddAccumulatorPublicKey)._sizeHint();
      case RemoveAccumulatorParams:
        return (value as RemoveAccumulatorParams)._sizeHint();
      case RemoveAccumulatorPublicKey:
        return (value as RemoveAccumulatorPublicKey)._sizeHint();
      case AddAccumulator:
        return (value as AddAccumulator)._sizeHint();
      case UpdateAccumulator:
        return (value as UpdateAccumulator)._sizeHint();
      case RemoveAccumulator:
        return (value as RemoveAccumulator)._sizeHint();
      case UpdateStatusListCredential:
        return (value as UpdateStatusListCredential)._sizeHint();
      case RemoveStatusListCredential:
        return (value as RemoveStatusListCredential)._sizeHint();
      case AddIssuer:
        return (value as AddIssuer)._sizeHint();
      case RemoveIssuer:
        return (value as RemoveIssuer)._sizeHint();
      case AddVerifier:
        return (value as AddVerifier)._sizeHint();
      case RemoveVerifier:
        return (value as RemoveVerifier)._sizeHint();
      case RemoveAuthorizer:
        return (value as RemoveAuthorizer)._sizeHint();
      default:
        throw Exception(
            'StateChange: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class AddKeys extends StateChange {
  const AddKeys(this.value0);

  factory AddKeys._decode(_i1.Input input) {
    return AddKeys(_i33.AddKeys.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::did::AddKeys<T>>
  final _i3.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'AddKeys': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i33.AddKeys.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddKeys && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class AddControllers extends StateChange {
  const AddControllers(this.value0);

  factory AddControllers._decode(_i1.Input input) {
    return AddControllers(_i34.AddControllers.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::did::AddControllers
  ///<T>>
  final _i4.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'AddControllers': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i4.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i34.AddControllers.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddControllers && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveKeys extends StateChange {
  const RemoveKeys(this.value0);

  factory RemoveKeys._decode(_i1.Input input) {
    return RemoveKeys(_i35.RemoveKeys.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::did::RemoveKeys<T
  ///>>
  final _i5.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'RemoveKeys': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i5.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i35.RemoveKeys.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveKeys && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveControllers extends StateChange {
  const RemoveControllers(this.value0);

  factory RemoveControllers._decode(_i1.Input input) {
    return RemoveControllers(_i36.RemoveControllers.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::did::
  ///RemoveControllers<T>>
  final _i6.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveControllers': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i6.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i36.RemoveControllers.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveControllers && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class AddServiceEndpoint extends StateChange {
  const AddServiceEndpoint(this.value0);

  factory AddServiceEndpoint._decode(_i1.Input input) {
    return AddServiceEndpoint(_i37.AddServiceEndpoint.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::did::
  ///AddServiceEndpoint<T>>
  final _i7.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'AddServiceEndpoint': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i7.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i37.AddServiceEndpoint.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddServiceEndpoint && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveServiceEndpoint extends StateChange {
  const RemoveServiceEndpoint(this.value0);

  factory RemoveServiceEndpoint._decode(_i1.Input input) {
    return RemoveServiceEndpoint(
        _i38.RemoveServiceEndpoint.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::did::
  ///RemoveServiceEndpoint<T>>
  final _i8.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveServiceEndpoint': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i8.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i38.RemoveServiceEndpoint.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveServiceEndpoint && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class DidRemoval extends StateChange {
  const DidRemoval(this.value0);

  factory DidRemoval._decode(_i1.Input input) {
    return DidRemoval(_i39.DidRemoval.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::did::DidRemoval<T
  ///>>
  final _i9.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'DidRemoval': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i9.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i39.DidRemoval.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DidRemoval && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Revoke extends StateChange {
  const Revoke(this.value0);

  factory Revoke._decode(_i1.Input input) {
    return Revoke(_i40.WithNonce.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::revoke::Revoke<T>
  ///>
  final _i10.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'Revoke': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i10.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i40.WithNonce.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Revoke && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class UnRevoke extends StateChange {
  const UnRevoke(this.value0);

  factory UnRevoke._decode(_i1.Input input) {
    return UnRevoke(_i41.WithNonce.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::revoke::UnRevoke<T
  ///>>
  final _i11.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'UnRevoke': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i11.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i41.WithNonce.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UnRevoke && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveRegistry extends StateChange {
  const RemoveRegistry(this.value0);

  factory RemoveRegistry._decode(_i1.Input input) {
    return RemoveRegistry(_i42.WithNonce.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::revoke::
  ///RemoveRegistry<T>>
  final _i12.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveRegistry': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i12.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i42.WithNonce.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveRegistry && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class AddBlob extends StateChange {
  const AddBlob(this.value0);

  factory AddBlob._decode(_i1.Input input) {
    return AddBlob(_i43.AddBlob.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::blob::AddBlob<T>
  ///>
  final _i13.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'AddBlob': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i13.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i43.AddBlob.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddBlob && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class SetAttestationClaim extends StateChange {
  const SetAttestationClaim(this.value0);

  factory SetAttestationClaim._decode(_i1.Input input) {
    return SetAttestationClaim(_i44.SetAttestationClaim.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::attest::
  ///SetAttestationClaim<T>>
  final _i14.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'SetAttestationClaim': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i14.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    _i44.SetAttestationClaim.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetAttestationClaim && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class AddOffchainSignatureParams extends StateChange {
  const AddOffchainSignatureParams(this.value0);

  factory AddOffchainSignatureParams._decode(_i1.Input input) {
    return AddOffchainSignatureParams(
        _i45.AddOffchainSignatureParams.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::offchain_signatures::
  ///AddOffchainSignatureParams<T>>
  final _i15.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'AddOffchainSignatureParams': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i15.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      12,
      output,
    );
    _i45.AddOffchainSignatureParams.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddOffchainSignatureParams && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class AddOffchainSignaturePublicKey extends StateChange {
  const AddOffchainSignaturePublicKey(this.value0);

  factory AddOffchainSignaturePublicKey._decode(_i1.Input input) {
    return AddOffchainSignaturePublicKey(
        _i46.AddOffchainSignaturePublicKey.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::offchain_signatures::
  ///AddOffchainSignaturePublicKey<T>>
  final _i16.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'AddOffchainSignaturePublicKey': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i16.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      13,
      output,
    );
    _i46.AddOffchainSignaturePublicKey.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddOffchainSignaturePublicKey && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveOffchainSignatureParams extends StateChange {
  const RemoveOffchainSignatureParams(this.value0);

  factory RemoveOffchainSignatureParams._decode(_i1.Input input) {
    return RemoveOffchainSignatureParams(
        _i47.RemoveOffchainSignatureParams.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::offchain_signatures::
  ///RemoveOffchainSignatureParams<T>>
  final _i17.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveOffchainSignatureParams': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i17.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      14,
      output,
    );
    _i47.RemoveOffchainSignatureParams.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveOffchainSignatureParams && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveOffchainSignaturePublicKey extends StateChange {
  const RemoveOffchainSignaturePublicKey(this.value0);

  factory RemoveOffchainSignaturePublicKey._decode(_i1.Input input) {
    return RemoveOffchainSignaturePublicKey(
        _i48.RemoveOffchainSignaturePublicKey.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::offchain_signatures::
  ///RemoveOffchainSignaturePublicKey<T>>
  final _i18.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveOffchainSignaturePublicKey': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i18.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      15,
      output,
    );
    _i48.RemoveOffchainSignaturePublicKey.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveOffchainSignaturePublicKey && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class AddAccumulatorParams extends StateChange {
  const AddAccumulatorParams(this.value0);

  factory AddAccumulatorParams._decode(_i1.Input input) {
    return AddAccumulatorParams(_i49.AddAccumulatorParams.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::accumulator::
  ///AddAccumulatorParams<T>>
  final _i19.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'AddAccumulatorParams': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i19.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      16,
      output,
    );
    _i49.AddAccumulatorParams.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddAccumulatorParams && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class AddAccumulatorPublicKey extends StateChange {
  const AddAccumulatorPublicKey(this.value0);

  factory AddAccumulatorPublicKey._decode(_i1.Input input) {
    return AddAccumulatorPublicKey(
        _i50.AddAccumulatorPublicKey.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::accumulator::
  ///AddAccumulatorPublicKey<T>>
  final _i20.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'AddAccumulatorPublicKey': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i20.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      17,
      output,
    );
    _i50.AddAccumulatorPublicKey.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddAccumulatorPublicKey && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveAccumulatorParams extends StateChange {
  const RemoveAccumulatorParams(this.value0);

  factory RemoveAccumulatorParams._decode(_i1.Input input) {
    return RemoveAccumulatorParams(
        _i51.RemoveAccumulatorParams.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::accumulator::
  ///RemoveAccumulatorParams<T>>
  final _i21.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveAccumulatorParams': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i21.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      18,
      output,
    );
    _i51.RemoveAccumulatorParams.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveAccumulatorParams && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveAccumulatorPublicKey extends StateChange {
  const RemoveAccumulatorPublicKey(this.value0);

  factory RemoveAccumulatorPublicKey._decode(_i1.Input input) {
    return RemoveAccumulatorPublicKey(
        _i52.RemoveAccumulatorPublicKey.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::accumulator::
  ///RemoveAccumulatorPublicKey<T>>
  final _i22.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveAccumulatorPublicKey': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i22.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      19,
      output,
    );
    _i52.RemoveAccumulatorPublicKey.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveAccumulatorPublicKey && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class AddAccumulator extends StateChange {
  const AddAccumulator(this.value0);

  factory AddAccumulator._decode(_i1.Input input) {
    return AddAccumulator(_i53.AddAccumulator.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::accumulator::
  ///AddAccumulator<T>>
  final _i23.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'AddAccumulator': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i23.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      20,
      output,
    );
    _i53.AddAccumulator.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddAccumulator && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class UpdateAccumulator extends StateChange {
  const UpdateAccumulator(this.value0);

  factory UpdateAccumulator._decode(_i1.Input input) {
    return UpdateAccumulator(_i54.UpdateAccumulator.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::accumulator::
  ///UpdateAccumulator<T>>
  final _i24.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'UpdateAccumulator': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i24.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      21,
      output,
    );
    _i54.UpdateAccumulator.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UpdateAccumulator && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveAccumulator extends StateChange {
  const RemoveAccumulator(this.value0);

  factory RemoveAccumulator._decode(_i1.Input input) {
    return RemoveAccumulator(_i55.RemoveAccumulator.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::accumulator::
  ///RemoveAccumulator<T>>
  final _i25.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveAccumulator': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i25.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      22,
      output,
    );
    _i55.RemoveAccumulator.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveAccumulator && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class UpdateStatusListCredential extends StateChange {
  const UpdateStatusListCredential(this.value0);

  factory UpdateStatusListCredential._decode(_i1.Input input) {
    return UpdateStatusListCredential(_i56.WithNonce.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::status_list_credential
  ///::UpdateStatusListCredential<T>>
  final _i26.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'UpdateStatusListCredential': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i26.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      23,
      output,
    );
    _i56.WithNonce.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UpdateStatusListCredential && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveStatusListCredential extends StateChange {
  const RemoveStatusListCredential(this.value0);

  factory RemoveStatusListCredential._decode(_i1.Input input) {
    return RemoveStatusListCredential(_i57.WithNonce.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::status_list_credential
  ///::RemoveStatusListCredential<T>>
  final _i27.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveStatusListCredential': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i27.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      24,
      output,
    );
    _i57.WithNonce.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveStatusListCredential && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class AddIssuer extends StateChange {
  const AddIssuer(this.value0);

  factory AddIssuer._decode(_i1.Input input) {
    return AddIssuer(_i58.WithNonce.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::trusted_entity::
  ///AddIssuer<T>>
  final _i28.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'AddIssuer': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i28.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      25,
      output,
    );
    _i58.WithNonce.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddIssuer && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveIssuer extends StateChange {
  const RemoveIssuer(this.value0);

  factory RemoveIssuer._decode(_i1.Input input) {
    return RemoveIssuer(_i59.WithNonce.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::trusted_entity::
  ///RemoveIssuer<T>>
  final _i29.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveIssuer': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i29.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      26,
      output,
    );
    _i59.WithNonce.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveIssuer && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class AddVerifier extends StateChange {
  const AddVerifier(this.value0);

  factory AddVerifier._decode(_i1.Input input) {
    return AddVerifier(_i60.WithNonce.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::trusted_entity::
  ///AddVerifier<T>>
  final _i30.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'AddVerifier': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i30.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      27,
      output,
    );
    _i60.WithNonce.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddVerifier && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveVerifier extends StateChange {
  const RemoveVerifier(this.value0);

  factory RemoveVerifier._decode(_i1.Input input) {
    return RemoveVerifier(_i61.WithNonce.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::trusted_entity::
  ///RemoveVerifier<T>>
  final _i31.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveVerifier': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i31.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      28,
      output,
    );
    _i61.WithNonce.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveVerifier && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class RemoveAuthorizer extends StateChange {
  const RemoveAuthorizer(this.value0);

  factory RemoveAuthorizer._decode(_i1.Input input) {
    return RemoveAuthorizer(_i62.WithNonce.codec.decode(input));
  }

  /// sp_std::borrow::Cow<'static, $crate::modules::trusted_entity::
  ///RemoveAuthorizer<T>>
  final _i32.Cow value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'RemoveAuthorizer': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i32.CowCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      29,
      output,
    );
    _i62.WithNonce.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveAuthorizer && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}
