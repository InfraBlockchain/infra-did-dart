// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;
import 'dart:typed_data' as _i11;

import 'package:polkadart/polkadart.dart' as _i1;

import '../types/AccumulatorId/accumulator_id.dart' as _i7;
import '../types/AccumulatorOwner/accumulator_owner.dart' as _i2;
import '../types/AccumulatorParameters/accumulator_parameters.dart' as _i5;
import '../types/AccumulatorPublicKey/accumulator_public_key.dart' as _i6;
import '../types/AccumulatorWithUpdateInfo/accumulator_with_update_info.dart'
    as _i8;
import '../types/AddAccumulator/add_accumulator.dart' as _i19;
import '../types/AddAccumulatorParams/add_accumulator_params.dart' as _i13;
import '../types/AddAccumulatorPublicKey/add_accumulator_public_key.dart'
    as _i16;
import '../types/did_core/common/storage_version/storage_version.dart' as _i9;
import '../types/did_core/modules/accumulator/pallet/call.dart' as _i15;
import '../types/did_runtime/runtime_call.dart' as _i12;
import '../types/DidSignature/did_signature_5.dart' as _i14;
import '../types/IncId/inc_id.dart' as _i4;
import '../types/RemoveAccumulator/remove_accumulator.dart' as _i21;
import '../types/RemoveAccumulatorParams/remove_accumulator_params.dart'
    as _i17;
import '../types/RemoveAccumulatorPublicKey/remove_accumulator_public_key.dart'
    as _i18;
import '../types/StoredAccumulatorOwnerCounters/stored_accumulator_owner_counters.dart'
    as _i3;
import '../types/UpdateAccumulator/update_accumulator.dart' as _i20;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.AccumulatorOwner, _i3.StoredAccumulatorOwnerCounters>
      _accumulatorOwnerCounters = const _i1
          .StorageMap<_i2.AccumulatorOwner, _i3.StoredAccumulatorOwnerCounters>(
    prefix: 'Accumulator',
    storage: 'AccumulatorOwnerCounters',
    valueCodec: _i3.StoredAccumulatorOwnerCounters.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i2.AccumulatorOwnerCodec()),
  );

  final _i1.StorageDoubleMap<_i2.AccumulatorOwner, _i4.IncId,
          _i5.AccumulatorParameters> _accumulatorParams =
      const _i1.StorageDoubleMap<_i2.AccumulatorOwner, _i4.IncId,
          _i5.AccumulatorParameters>(
    prefix: 'Accumulator',
    storage: 'AccumulatorParams',
    valueCodec: _i5.AccumulatorParameters.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i2.AccumulatorOwnerCodec()),
    hasher2: _i1.StorageHasher.identity(_i4.IncIdCodec()),
  );

  final _i1.StorageDoubleMap<_i2.AccumulatorOwner, _i4.IncId,
          _i6.AccumulatorPublicKey> _accumulatorKeys =
      const _i1.StorageDoubleMap<_i2.AccumulatorOwner, _i4.IncId,
          _i6.AccumulatorPublicKey>(
    prefix: 'Accumulator',
    storage: 'AccumulatorKeys',
    valueCodec: _i6.AccumulatorPublicKey.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i2.AccumulatorOwnerCodec()),
    hasher2: _i1.StorageHasher.identity(_i4.IncIdCodec()),
  );

  final _i1.StorageMap<_i7.AccumulatorId, _i8.AccumulatorWithUpdateInfo>
      _accumulators =
      const _i1.StorageMap<_i7.AccumulatorId, _i8.AccumulatorWithUpdateInfo>(
    prefix: 'Accumulator',
    storage: 'Accumulators',
    valueCodec: _i8.AccumulatorWithUpdateInfo.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i7.AccumulatorIdCodec()),
  );

  final _i1.StorageValue<_i9.StorageVersion> _version =
      const _i1.StorageValue<_i9.StorageVersion>(
    prefix: 'Accumulator',
    storage: 'Version',
    valueCodec: _i9.StorageVersion.codec,
  );

  _i10.Future<_i3.StoredAccumulatorOwnerCounters> accumulatorOwnerCounters(
    _i2.AccumulatorOwner key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _accumulatorOwnerCounters.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _accumulatorOwnerCounters.decodeValue(bytes);
    }
    return _i3.StoredAccumulatorOwnerCounters(
      paramsCounter: 0,
      keyCounter: 0,
    ); /* Default */
  }

  _i10.Future<_i5.AccumulatorParameters?> accumulatorParams(
    _i2.AccumulatorOwner key1,
    _i4.IncId key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _accumulatorParams.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _accumulatorParams.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Public key storage is kept separate from accumulator storage and a single key can be used to
  /// manage several accumulators. It is assumed that whoever (DID) owns the public key, owns the
  /// accumulator as well and only that DID can update accumulator.
  _i10.Future<_i6.AccumulatorPublicKey?> accumulatorKeys(
    _i2.AccumulatorOwner key1,
    _i4.IncId key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _accumulatorKeys.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _accumulatorKeys.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Stores latest accumulator as key value: accumulator id -> (created_at, last_updated_at,
  /// Accumulator) `created_at` is the block number when the accumulator was created and is
  /// intended to serve as a starting point for anyone looking for all updates to the accumulator.
  /// `last_updated_at` is the block number when the last update was sent. `created_at` and
  /// `last_updated_at` together indicate which blocks should be considered for finding
  /// accumulator updates. Historical values and updates are persisted as events indexed with the
  /// accumulator id. The reason for not storing past values is to save storage in chain state.
  /// Another option could have been to store block numbers for the updates so that each block
  /// from `created_at` doesn't need to be scanned but even that requires large storage as we
  /// expect millions of updates. Just keeping the latest accumulated value allows for any
  /// potential on chain verification as well.
  _i10.Future<_i8.AccumulatorWithUpdateInfo?> accumulators(
    _i7.AccumulatorId key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _accumulators.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _accumulators.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  _i10.Future<_i9.StorageVersion> version({_i1.BlockHash? at}) async {
    final hashedKey = _version.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _version.decodeValue(bytes);
    }
    return _i9.StorageVersion.singleKey; /* Default */
  }

  /// Returns the storage key for `accumulatorOwnerCounters`.
  _i11.Uint8List accumulatorOwnerCountersKey(_i2.AccumulatorOwner key1) {
    final hashedKey = _accumulatorOwnerCounters.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `accumulatorParams`.
  _i11.Uint8List accumulatorParamsKey(
    _i2.AccumulatorOwner key1,
    _i4.IncId key2,
  ) {
    final hashedKey = _accumulatorParams.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `accumulatorKeys`.
  _i11.Uint8List accumulatorKeysKey(
    _i2.AccumulatorOwner key1,
    _i4.IncId key2,
  ) {
    final hashedKey = _accumulatorKeys.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `accumulators`.
  _i11.Uint8List accumulatorsKey(_i7.AccumulatorId key1) {
    final hashedKey = _accumulators.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `version`.
  _i11.Uint8List versionKey() {
    final hashedKey = _version.hashedKey();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `accumulatorOwnerCounters`.
  _i11.Uint8List accumulatorOwnerCountersMapPrefix() {
    final hashedKey = _accumulatorOwnerCounters.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `accumulatorParams`.
  _i11.Uint8List accumulatorParamsMapPrefix(_i2.AccumulatorOwner key1) {
    final hashedKey = _accumulatorParams.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `accumulatorKeys`.
  _i11.Uint8List accumulatorKeysMapPrefix(_i2.AccumulatorOwner key1) {
    final hashedKey = _accumulatorKeys.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `accumulators`.
  _i11.Uint8List accumulatorsMapPrefix() {
    final hashedKey = _accumulators.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::add_params`].
  _i12.RuntimeCall addParams({
    required _i13.AddAccumulatorParams params,
    required _i14.DidSignature signature,
  }) {
    final _call = _i15.Call.values.addParams(
      params: params,
      signature: signature,
    );
    return _i12.RuntimeCall.values.accumulator(_call);
  }

  /// See [`Pallet::add_public_key`].
  _i12.RuntimeCall addPublicKey({
    required _i16.AddAccumulatorPublicKey publicKey,
    required _i14.DidSignature signature,
  }) {
    final _call = _i15.Call.values.addPublicKey(
      publicKey: publicKey,
      signature: signature,
    );
    return _i12.RuntimeCall.values.accumulator(_call);
  }

  /// See [`Pallet::remove_params`].
  _i12.RuntimeCall removeParams({
    required _i17.RemoveAccumulatorParams remove,
    required _i14.DidSignature signature,
  }) {
    final _call = _i15.Call.values.removeParams(
      remove: remove,
      signature: signature,
    );
    return _i12.RuntimeCall.values.accumulator(_call);
  }

  /// See [`Pallet::remove_public_key`].
  _i12.RuntimeCall removePublicKey({
    required _i18.RemoveAccumulatorPublicKey remove,
    required _i14.DidSignature signature,
  }) {
    final _call = _i15.Call.values.removePublicKey(
      remove: remove,
      signature: signature,
    );
    return _i12.RuntimeCall.values.accumulator(_call);
  }

  /// See [`Pallet::add_accumulator`].
  _i12.RuntimeCall addAccumulator({
    required _i19.AddAccumulator addAccumulator,
    required _i14.DidSignature signature,
  }) {
    final _call = _i15.Call.values.addAccumulator(
      addAccumulator: addAccumulator,
      signature: signature,
    );
    return _i12.RuntimeCall.values.accumulator(_call);
  }

  /// See [`Pallet::update_accumulator`].
  _i12.RuntimeCall updateAccumulator({
    required _i20.UpdateAccumulator update,
    required _i14.DidSignature signature,
  }) {
    final _call = _i15.Call.values.updateAccumulator(
      update: update,
      signature: signature,
    );
    return _i12.RuntimeCall.values.accumulator(_call);
  }

  /// See [`Pallet::remove_accumulator`].
  _i12.RuntimeCall removeAccumulator({
    required _i21.RemoveAccumulator remove,
    required _i14.DidSignature signature,
  }) {
    final _call = _i15.Call.values.removeAccumulator(
      remove: remove,
      signature: signature,
    );
    return _i12.RuntimeCall.values.accumulator(_call);
  }
}
