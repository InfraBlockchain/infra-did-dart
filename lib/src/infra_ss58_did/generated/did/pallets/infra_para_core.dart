// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;
import 'dart:typed_data' as _i11;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i4;

import '../types/cumulus_pallet_infra_parachain_core/pallet/call.dart' as _i13;
import '../types/cumulus_pallet_infra_parachain_core/request_status.dart'
    as _i9;
import '../types/did_runtime/runtime_call.dart' as _i12;
import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/sp_runtime/types/fee/extrinsic_metadata.dart' as _i6;
import '../types/sp_runtime/types/fee/mode.dart' as _i5;
import '../types/sp_runtime/types/token/fiat.dart' as _i14;
import '../types/sp_runtime/types/token/infra_system_config.dart' as _i3;
import '../types/sp_runtime/types/token/remote_asset_metadata.dart' as _i8;
import '../types/sp_runtime/types/token/system_token_id.dart' as _i15;
import '../types/tuples.dart' as _i7;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<_i2.AccountId32> _paraCoreAdmin =
      const _i1.StorageValue<_i2.AccountId32>(
    prefix: 'InfraParaCore',
    storage: 'ParaCoreAdmin',
    valueCodec: _i2.AccountId32Codec(),
  );

  final _i1.StorageValue<_i3.InfraSystemConfig> _rCSystemConfig =
      const _i1.StorageValue<_i3.InfraSystemConfig>(
    prefix: 'InfraParaCore',
    storage: 'RCSystemConfig',
    valueCodec: _i3.InfraSystemConfig.codec,
  );

  final _i1.StorageValue<BigInt> _paraFeeRate = const _i1.StorageValue<BigInt>(
    prefix: 'InfraParaCore',
    storage: 'ParaFeeRate',
    valueCodec: _i4.U128Codec.codec,
  );

  final _i1.StorageValue<_i5.Mode> _runtimeState =
      const _i1.StorageValue<_i5.Mode>(
    prefix: 'InfraParaCore',
    storage: 'RuntimeState',
    valueCodec: _i5.Mode.codec,
  );

  final _i1.StorageMap<_i6.ExtrinsicMetadata, BigInt> _feeTable =
      const _i1.StorageMap<_i6.ExtrinsicMetadata, BigInt>(
    prefix: 'InfraParaCore',
    storage: 'FeeTable',
    valueCodec: _i4.U128Codec.codec,
    hasher: _i1.StorageHasher.twoxx128(_i6.ExtrinsicMetadata.codec),
  );

  final _i1.StorageValue<_i7.Tuple2<_i8.RemoteAssetMetadata, _i9.RequestStatus>>
      _currentRequest = const _i1
          .StorageValue<_i7.Tuple2<_i8.RemoteAssetMetadata, _i9.RequestStatus>>(
    prefix: 'InfraParaCore',
    storage: 'CurrentRequest',
    valueCodec: _i7.Tuple2Codec<_i8.RemoteAssetMetadata, _i9.RequestStatus>(
      _i8.RemoteAssetMetadata.codec,
      _i9.RequestStatus.codec,
    ),
  );

  _i10.Future<_i2.AccountId32?> paraCoreAdmin({_i1.BlockHash? at}) async {
    final hashedKey = _paraCoreAdmin.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _paraCoreAdmin.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  _i10.Future<_i3.InfraSystemConfig?> rCSystemConfig(
      {_i1.BlockHash? at}) async {
    final hashedKey = _rCSystemConfig.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _rCSystemConfig.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  _i10.Future<BigInt?> paraFeeRate({_i1.BlockHash? at}) async {
    final hashedKey = _paraFeeRate.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _paraFeeRate.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  _i10.Future<_i5.Mode> runtimeState({_i1.BlockHash? at}) async {
    final hashedKey = _runtimeState.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _runtimeState.decodeValue(bytes);
    }
    return _i5.Mode.bootstrap; /* Default */
  }

  _i10.Future<BigInt?> feeTable(
    _i6.ExtrinsicMetadata key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _feeTable.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _feeTable.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  _i10.Future<_i7.Tuple2<_i8.RemoteAssetMetadata, _i9.RequestStatus>?>
      currentRequest({_i1.BlockHash? at}) async {
    final hashedKey = _currentRequest.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _currentRequest.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `paraCoreAdmin`.
  _i11.Uint8List paraCoreAdminKey() {
    final hashedKey = _paraCoreAdmin.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `rCSystemConfig`.
  _i11.Uint8List rCSystemConfigKey() {
    final hashedKey = _rCSystemConfig.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `paraFeeRate`.
  _i11.Uint8List paraFeeRateKey() {
    final hashedKey = _paraFeeRate.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `runtimeState`.
  _i11.Uint8List runtimeStateKey() {
    final hashedKey = _runtimeState.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `feeTable`.
  _i11.Uint8List feeTableKey(_i6.ExtrinsicMetadata key1) {
    final hashedKey = _feeTable.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `currentRequest`.
  _i11.Uint8List currentRequestKey() {
    final hashedKey = _currentRequest.hashedKey();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `feeTable`.
  _i11.Uint8List feeTableMapPrefix() {
    final hashedKey = _feeTable.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See `Pallet::update_fee_table`.
  _i12.RuntimeCall updateFeeTable({
    required List<int> palletName,
    required List<int> callName,
    required BigInt fee,
  }) {
    final _call = _i13.Call.values.updateFeeTable(
      palletName: palletName,
      callName: callName,
      fee: fee,
    );
    return _i12.RuntimeCall.values.infraParaCore(_call);
  }

  /// See `Pallet::update_para_fee_rate`.
  _i12.RuntimeCall updateParaFeeRate({required BigInt feeRate}) {
    final _call = _i13.Call.values.updateParaFeeRate(feeRate: feeRate);
    return _i12.RuntimeCall.values.infraParaCore(_call);
  }

  /// See `Pallet::update_runtime_state`.
  _i12.RuntimeCall updateRuntimeState() {
    final _call = _i13.Call.values.updateRuntimeState();
    return _i12.RuntimeCall.values.infraParaCore(_call);
  }

  /// See `Pallet::register_system_token`.
  _i12.RuntimeCall registerSystemToken({
    required int assetId,
    required BigInt systemTokenWeight,
  }) {
    final _call = _i13.Call.values.registerSystemToken(
      assetId: assetId,
      systemTokenWeight: systemTokenWeight,
    );
    return _i12.RuntimeCall.values.infraParaCore(_call);
  }

  /// See `Pallet::create_wrapped_local`.
  _i12.RuntimeCall createWrappedLocal({
    required int assetId,
    required _i14.Fiat currencyType,
    required BigInt minBalance,
    required List<int> name,
    required List<int> symbol,
    required int decimals,
    required BigInt systemTokenWeight,
    required int assetLinkParent,
    required _i15.SystemTokenId original,
  }) {
    final _call = _i13.Call.values.createWrappedLocal(
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
    return _i12.RuntimeCall.values.infraParaCore(_call);
  }

  /// See `Pallet::deregister_system_token`.
  _i12.RuntimeCall deregisterSystemToken({
    required int assetId,
    required bool isUnlink,
  }) {
    final _call = _i13.Call.values.deregisterSystemToken(
      assetId: assetId,
      isUnlink: isUnlink,
    );
    return _i12.RuntimeCall.values.infraParaCore(_call);
  }

  /// See `Pallet::set_para_core_admin`.
  _i12.RuntimeCall setParaCoreAdmin({required _i2.AccountId32 who}) {
    final _call = _i13.Call.values.setParaCoreAdmin(who: who);
    return _i12.RuntimeCall.values.infraParaCore(_call);
  }

  /// See `Pallet::request_register_system_token`.
  _i12.RuntimeCall requestRegisterSystemToken({required int assetId}) {
    final _call = _i13.Call.values.requestRegisterSystemToken(assetId: assetId);
    return _i12.RuntimeCall.values.infraParaCore(_call);
  }
}

class Constants {
  Constants();

  /// Active request period for registering System Token
  final int activeRequestPeriod = 100;
}
