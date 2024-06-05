// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i6;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i4;

import '../types/did_runtime/runtime_call.dart' as _i7;
import '../types/pallet_multisig/multisig.dart' as _i3;
import '../types/pallet_multisig/pallet/call.dart' as _i8;
import '../types/pallet_multisig/timepoint.dart' as _i9;
import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/sp_weights/weight_v2/weight.dart' as _i10;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageDoubleMap<_i2.AccountId32, List<int>, _i3.Multisig>
      _multisigs =
      const _i1.StorageDoubleMap<_i2.AccountId32, List<int>, _i3.Multisig>(
    prefix: 'Multisig',
    storage: 'Multisigs',
    valueCodec: _i3.Multisig.codec,
    hasher1: _i1.StorageHasher.twoxx64Concat(_i2.AccountId32Codec()),
    hasher2: _i1.StorageHasher.blake2b128Concat(_i4.U8ArrayCodec(32)),
  );

  /// The set of open multisig operations.
  _i5.Future<_i3.Multisig?> multisigs(
    _i2.AccountId32 key1,
    List<int> key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _multisigs.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _multisigs.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `multisigs`.
  _i6.Uint8List multisigsKey(
    _i2.AccountId32 key1,
    List<int> key2,
  ) {
    final hashedKey = _multisigs.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage map key prefix for `multisigs`.
  _i6.Uint8List multisigsMapPrefix(_i2.AccountId32 key1) {
    final hashedKey = _multisigs.mapPrefix(key1);
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::as_multi_threshold_1`].
  _i7.RuntimeCall asMultiThreshold1({
    required List<_i2.AccountId32> otherSignatories,
    required _i7.RuntimeCall call,
  }) {
    final _call = _i8.Call.values.asMultiThreshold1(
      otherSignatories: otherSignatories,
      call: call,
    );
    return _i7.RuntimeCall.values.multisig(_call);
  }

  /// See [`Pallet::as_multi`].
  _i7.RuntimeCall asMulti({
    required int threshold,
    required List<_i2.AccountId32> otherSignatories,
    _i9.Timepoint? maybeTimepoint,
    required _i7.RuntimeCall call,
    required _i10.Weight maxWeight,
  }) {
    final _call = _i8.Call.values.asMulti(
      threshold: threshold,
      otherSignatories: otherSignatories,
      maybeTimepoint: maybeTimepoint,
      call: call,
      maxWeight: maxWeight,
    );
    return _i7.RuntimeCall.values.multisig(_call);
  }

  /// See [`Pallet::approve_as_multi`].
  _i7.RuntimeCall approveAsMulti({
    required int threshold,
    required List<_i2.AccountId32> otherSignatories,
    _i9.Timepoint? maybeTimepoint,
    required List<int> callHash,
    required _i10.Weight maxWeight,
  }) {
    final _call = _i8.Call.values.approveAsMulti(
      threshold: threshold,
      otherSignatories: otherSignatories,
      maybeTimepoint: maybeTimepoint,
      callHash: callHash,
      maxWeight: maxWeight,
    );
    return _i7.RuntimeCall.values.multisig(_call);
  }

  /// See [`Pallet::cancel_as_multi`].
  _i7.RuntimeCall cancelAsMulti({
    required int threshold,
    required List<_i2.AccountId32> otherSignatories,
    required _i9.Timepoint timepoint,
    required List<int> callHash,
  }) {
    final _call = _i8.Call.values.cancelAsMulti(
      threshold: threshold,
      otherSignatories: otherSignatories,
      timepoint: timepoint,
      callHash: callHash,
    );
    return _i7.RuntimeCall.values.multisig(_call);
  }
}

class Constants {
  Constants();

  /// The base amount of currency needed to reserve for creating a multisig execution or to
  /// store a dispatch call for later.
  ///
  /// This is held for an additional storage item whose value size is
  /// `4 + sizeof((BlockNumber, Balance, AccountId))` bytes and whose key size is
  /// `32 + sizeof(AccountId)` bytes.
  final BigInt depositBase = BigInt.from(2008800000);

  /// The amount of currency needed per unit threshold when creating a multisig execution.
  ///
  /// This is held for adding 32 bytes more into a pre-existing storage value.
  final BigInt depositFactor = BigInt.from(3200000);

  /// The maximum amount of signatories allowed in the multisig.
  final int maxSignatories = 100;
}
