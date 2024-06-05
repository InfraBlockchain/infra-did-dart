// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../../sp_core/crypto/account_id32.dart' as _i5;
import '../../sp_runtime/types/token/fiat.dart' as _i3;
import '../../sp_runtime/types/token/system_token_id.dart' as _i4;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, dynamic> toJson();
}

class $Call {
  const $Call();

  UpdateFeeTable updateFeeTable({
    required List<int> palletName,
    required List<int> callName,
    required BigInt fee,
  }) {
    return UpdateFeeTable(
      palletName: palletName,
      callName: callName,
      fee: fee,
    );
  }

  UpdateParaFeeRate updateParaFeeRate({required BigInt feeRate}) {
    return UpdateParaFeeRate(feeRate: feeRate);
  }

  UpdateRuntimeState updateRuntimeState() {
    return UpdateRuntimeState();
  }

  RegisterSystemToken registerSystemToken({
    required int assetId,
    required BigInt systemTokenWeight,
  }) {
    return RegisterSystemToken(
      assetId: assetId,
      systemTokenWeight: systemTokenWeight,
    );
  }

  CreateWrappedLocal createWrappedLocal({
    required int assetId,
    required _i3.Fiat currencyType,
    required BigInt minBalance,
    required List<int> name,
    required List<int> symbol,
    required int decimals,
    required BigInt systemTokenWeight,
    required int assetLinkParent,
    required _i4.SystemTokenId original,
  }) {
    return CreateWrappedLocal(
      assetId: assetId,
      currencyType: currencyType,
      minBalance: minBalance,
      name: name,
      symbol: symbol,
      decimals: decimals,
      systemTokenWeight: systemTokenWeight,
      assetLinkParent: assetLinkParent,
      original: original,
    );
  }

  DeregisterSystemToken deregisterSystemToken({
    required int assetId,
    required bool isUnlink,
  }) {
    return DeregisterSystemToken(
      assetId: assetId,
      isUnlink: isUnlink,
    );
  }

  SetParaCoreAdmin setParaCoreAdmin({required _i5.AccountId32 who}) {
    return SetParaCoreAdmin(who: who);
  }

  RequestRegisterSystemToken requestRegisterSystemToken(
      {required int assetId}) {
    return RequestRegisterSystemToken(assetId: assetId);
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return UpdateFeeTable._decode(input);
      case 2:
        return UpdateParaFeeRate._decode(input);
      case 3:
        return const UpdateRuntimeState();
      case 4:
        return RegisterSystemToken._decode(input);
      case 5:
        return CreateWrappedLocal._decode(input);
      case 6:
        return DeregisterSystemToken._decode(input);
      case 7:
        return SetParaCoreAdmin._decode(input);
      case 8:
        return RequestRegisterSystemToken._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case UpdateFeeTable:
        (value as UpdateFeeTable).encodeTo(output);
        break;
      case UpdateParaFeeRate:
        (value as UpdateParaFeeRate).encodeTo(output);
        break;
      case UpdateRuntimeState:
        (value as UpdateRuntimeState).encodeTo(output);
        break;
      case RegisterSystemToken:
        (value as RegisterSystemToken).encodeTo(output);
        break;
      case CreateWrappedLocal:
        (value as CreateWrappedLocal).encodeTo(output);
        break;
      case DeregisterSystemToken:
        (value as DeregisterSystemToken).encodeTo(output);
        break;
      case SetParaCoreAdmin:
        (value as SetParaCoreAdmin).encodeTo(output);
        break;
      case RequestRegisterSystemToken:
        (value as RequestRegisterSystemToken).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case UpdateFeeTable:
        return (value as UpdateFeeTable)._sizeHint();
      case UpdateParaFeeRate:
        return (value as UpdateParaFeeRate)._sizeHint();
      case UpdateRuntimeState:
        return 1;
      case RegisterSystemToken:
        return (value as RegisterSystemToken)._sizeHint();
      case CreateWrappedLocal:
        return (value as CreateWrappedLocal)._sizeHint();
      case DeregisterSystemToken:
        return (value as DeregisterSystemToken)._sizeHint();
      case SetParaCoreAdmin:
        return (value as SetParaCoreAdmin)._sizeHint();
      case RequestRegisterSystemToken:
        return (value as RequestRegisterSystemToken)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See `Pallet::update_fee_table`.
class UpdateFeeTable extends Call {
  const UpdateFeeTable({
    required this.palletName,
    required this.callName,
    required this.fee,
  });

  factory UpdateFeeTable._decode(_i1.Input input) {
    return UpdateFeeTable(
      palletName: _i1.U8SequenceCodec.codec.decode(input),
      callName: _i1.U8SequenceCodec.codec.decode(input),
      fee: _i1.U128Codec.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> palletName;

  /// Vec<u8>
  final List<int> callName;

  /// SystemTokenBalance
  final BigInt fee;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'update_fee_table': {
          'palletName': palletName,
          'callName': callName,
          'fee': fee,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(palletName);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(callName);
    size = size + _i1.U128Codec.codec.sizeHint(fee);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      palletName,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      callName,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      fee,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UpdateFeeTable &&
          _i6.listsEqual(
            other.palletName,
            palletName,
          ) &&
          _i6.listsEqual(
            other.callName,
            callName,
          ) &&
          other.fee == fee;

  @override
  int get hashCode => Object.hash(
        palletName,
        callName,
        fee,
      );
}

/// See `Pallet::update_para_fee_rate`.
class UpdateParaFeeRate extends Call {
  const UpdateParaFeeRate({required this.feeRate});

  factory UpdateParaFeeRate._decode(_i1.Input input) {
    return UpdateParaFeeRate(feeRate: _i1.U128Codec.codec.decode(input));
  }

  /// SystemTokenWeight
  final BigInt feeRate;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'update_para_fee_rate': {'feeRate': feeRate}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U128Codec.codec.sizeHint(feeRate);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      feeRate,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UpdateParaFeeRate && other.feeRate == feeRate;

  @override
  int get hashCode => feeRate.hashCode;
}

/// See `Pallet::update_runtime_state`.
class UpdateRuntimeState extends Call {
  const UpdateRuntimeState();

  @override
  Map<String, dynamic> toJson() => {'update_runtime_state': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is UpdateRuntimeState;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// See `Pallet::register_system_token`.
class RegisterSystemToken extends Call {
  const RegisterSystemToken({
    required this.assetId,
    required this.systemTokenWeight,
  });

  factory RegisterSystemToken._decode(_i1.Input input) {
    return RegisterSystemToken(
      assetId: _i1.U32Codec.codec.decode(input),
      systemTokenWeight: _i1.U128Codec.codec.decode(input),
    );
  }

  /// SystemTokenAssetId
  final int assetId;

  /// SystemTokenWeight
  final BigInt systemTokenWeight;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'register_system_token': {
          'assetId': assetId,
          'systemTokenWeight': systemTokenWeight,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(assetId);
    size = size + _i1.U128Codec.codec.sizeHint(systemTokenWeight);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      assetId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      systemTokenWeight,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RegisterSystemToken &&
          other.assetId == assetId &&
          other.systemTokenWeight == systemTokenWeight;

  @override
  int get hashCode => Object.hash(
        assetId,
        systemTokenWeight,
      );
}

/// See `Pallet::create_wrapped_local`.
class CreateWrappedLocal extends Call {
  const CreateWrappedLocal({
    required this.assetId,
    required this.currencyType,
    required this.minBalance,
    required this.name,
    required this.symbol,
    required this.decimals,
    required this.systemTokenWeight,
    required this.assetLinkParent,
    required this.original,
  });

  factory CreateWrappedLocal._decode(_i1.Input input) {
    return CreateWrappedLocal(
      assetId: _i1.U32Codec.codec.decode(input),
      currencyType: _i3.Fiat.codec.decode(input),
      minBalance: _i1.U128Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      symbol: _i1.U8SequenceCodec.codec.decode(input),
      decimals: _i1.U8Codec.codec.decode(input),
      systemTokenWeight: _i1.U128Codec.codec.decode(input),
      assetLinkParent: _i1.U8Codec.codec.decode(input),
      original: _i4.SystemTokenId.codec.decode(input),
    );
  }

  /// SystemTokenAssetId
  final int assetId;

  /// Fiat
  final _i3.Fiat currencyType;

  /// SystemTokenBalance
  final BigInt minBalance;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> symbol;

  /// u8
  final int decimals;

  /// SystemTokenWeight
  final BigInt systemTokenWeight;

  /// u8
  final int assetLinkParent;

  /// SystemTokenId
  final _i4.SystemTokenId original;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'create_wrapped_local': {
          'assetId': assetId,
          'currencyType': currencyType.toJson(),
          'minBalance': minBalance,
          'name': name,
          'symbol': symbol,
          'decimals': decimals,
          'systemTokenWeight': systemTokenWeight,
          'assetLinkParent': assetLinkParent,
          'original': original.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(assetId);
    size = size + _i3.Fiat.codec.sizeHint(currencyType);
    size = size + _i1.U128Codec.codec.sizeHint(minBalance);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(symbol);
    size = size + _i1.U8Codec.codec.sizeHint(decimals);
    size = size + _i1.U128Codec.codec.sizeHint(systemTokenWeight);
    size = size + _i1.U8Codec.codec.sizeHint(assetLinkParent);
    size = size + _i4.SystemTokenId.codec.sizeHint(original);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      assetId,
      output,
    );
    _i3.Fiat.codec.encodeTo(
      currencyType,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      minBalance,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      symbol,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      decimals,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      systemTokenWeight,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      assetLinkParent,
      output,
    );
    _i4.SystemTokenId.codec.encodeTo(
      original,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CreateWrappedLocal &&
          other.assetId == assetId &&
          other.currencyType == currencyType &&
          other.minBalance == minBalance &&
          _i6.listsEqual(
            other.name,
            name,
          ) &&
          _i6.listsEqual(
            other.symbol,
            symbol,
          ) &&
          other.decimals == decimals &&
          other.systemTokenWeight == systemTokenWeight &&
          other.assetLinkParent == assetLinkParent &&
          other.original == original;

  @override
  int get hashCode => Object.hash(
        assetId,
        currencyType,
        minBalance,
        name,
        symbol,
        decimals,
        systemTokenWeight,
        assetLinkParent,
        original,
      );
}

/// See `Pallet::deregister_system_token`.
class DeregisterSystemToken extends Call {
  const DeregisterSystemToken({
    required this.assetId,
    required this.isUnlink,
  });

  factory DeregisterSystemToken._decode(_i1.Input input) {
    return DeregisterSystemToken(
      assetId: _i1.U32Codec.codec.decode(input),
      isUnlink: _i1.BoolCodec.codec.decode(input),
    );
  }

  /// SystemTokenAssetId
  final int assetId;

  /// bool
  final bool isUnlink;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'deregister_system_token': {
          'assetId': assetId,
          'isUnlink': isUnlink,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(assetId);
    size = size + _i1.BoolCodec.codec.sizeHint(isUnlink);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      assetId,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      isUnlink,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DeregisterSystemToken &&
          other.assetId == assetId &&
          other.isUnlink == isUnlink;

  @override
  int get hashCode => Object.hash(
        assetId,
        isUnlink,
      );
}

/// See `Pallet::set_para_core_admin`.
class SetParaCoreAdmin extends Call {
  const SetParaCoreAdmin({required this.who});

  factory SetParaCoreAdmin._decode(_i1.Input input) {
    return SetParaCoreAdmin(who: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::AccountId
  final _i5.AccountId32 who;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'set_para_core_admin': {'who': who.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i5.AccountId32Codec().sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetParaCoreAdmin &&
          _i6.listsEqual(
            other.who,
            who,
          );

  @override
  int get hashCode => who.hashCode;
}

/// See `Pallet::request_register_system_token`.
class RequestRegisterSystemToken extends Call {
  const RequestRegisterSystemToken({required this.assetId});

  factory RequestRegisterSystemToken._decode(_i1.Input input) {
    return RequestRegisterSystemToken(
        assetId: _i1.U32Codec.codec.decode(input));
  }

  /// SystemTokenAssetId
  final int assetId;

  @override
  Map<String, Map<String, int>> toJson() => {
        'request_register_system_token': {'assetId': assetId}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(assetId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      assetId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RequestRegisterSystemToken && other.assetId == assetId;

  @override
  int get hashCode => assetId.hashCode;
}
