// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:typed_data' as _i9;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/did_runtime/runtime_call.dart' as _i10;
import '../types/pallet_assets/pallet/call.dart' as _i12;
import '../types/pallet_assets/types/approval.dart' as _i6;
import '../types/pallet_assets/types/asset_account.dart' as _i5;
import '../types/pallet_assets/types/asset_details.dart' as _i2;
import '../types/pallet_assets/types/asset_metadata.dart' as _i7;
import '../types/sp_core/crypto/account_id32.dart' as _i4;
import '../types/sp_runtime/multiaddress/multi_address.dart' as _i11;
import '../types/sp_runtime/types/token/fiat.dart' as _i13;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<int, _i2.AssetDetails> _asset =
      const _i1.StorageMap<int, _i2.AssetDetails>(
    prefix: 'Assets',
    storage: 'Asset',
    valueCodec: _i2.AssetDetails.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
  );

  final _i1.StorageDoubleMap<int, _i4.AccountId32, _i5.AssetAccount> _account =
      const _i1.StorageDoubleMap<int, _i4.AccountId32, _i5.AssetAccount>(
    prefix: 'Assets',
    storage: 'Account',
    valueCodec: _i5.AssetAccount.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
    hasher2: _i1.StorageHasher.blake2b128Concat(_i4.AccountId32Codec()),
  );

  final _i1
      .StorageTripleMap<int, _i4.AccountId32, _i4.AccountId32, _i6.Approval>
      _approvals = const _i1.StorageTripleMap<int, _i4.AccountId32,
          _i4.AccountId32, _i6.Approval>(
    prefix: 'Assets',
    storage: 'Approvals',
    valueCodec: _i6.Approval.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
    hasher2: _i1.StorageHasher.blake2b128Concat(_i4.AccountId32Codec()),
    hasher3: _i1.StorageHasher.blake2b128Concat(_i4.AccountId32Codec()),
  );

  final _i1.StorageMap<int, _i7.AssetMetadata> _metadata =
      const _i1.StorageMap<int, _i7.AssetMetadata>(
    prefix: 'Assets',
    storage: 'Metadata',
    valueCodec: _i7.AssetMetadata.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
  );

  /// Details of an asset.
  _i8.Future<_i2.AssetDetails?> asset(
    int key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _asset.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _asset.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The holdings of a specific account for a specific asset.
  _i8.Future<_i5.AssetAccount?> account(
    int key1,
    _i4.AccountId32 key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _account.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _account.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Approved balance transfers. First balance is the amount approved for transfer. Second
  /// is the amount of `T::Currency` reserved for storing this.
  /// First key is the asset ID, second key is the owner and third key is the delegate.
  _i8.Future<_i6.Approval?> approvals(
    int key1,
    _i4.AccountId32 key2,
    _i4.AccountId32 key3, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _approvals.hashedKeyFor(
      key1,
      key2,
      key3,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _approvals.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Metadata of an asset.
  _i8.Future<_i7.AssetMetadata?> metadata(
    int key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _metadata.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _metadata.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `asset`.
  _i9.Uint8List assetKey(int key1) {
    final hashedKey = _asset.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `account`.
  _i9.Uint8List accountKey(
    int key1,
    _i4.AccountId32 key2,
  ) {
    final hashedKey = _account.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `approvals`.
  _i9.Uint8List approvalsKey(
    int key1,
    _i4.AccountId32 key2,
    _i4.AccountId32 key3,
  ) {
    final hashedKey = _approvals.hashedKeyFor(
      key1,
      key2,
      key3,
    );
    return hashedKey;
  }

  /// Returns the storage key for `metadata`.
  _i9.Uint8List metadataKey(int key1) {
    final hashedKey = _metadata.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `asset`.
  _i9.Uint8List assetMapPrefix() {
    final hashedKey = _asset.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `account`.
  _i9.Uint8List accountMapPrefix(int key1) {
    final hashedKey = _account.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `metadata`.
  _i9.Uint8List metadataMapPrefix() {
    final hashedKey = _metadata.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::create`].
  _i10.RuntimeCall create({
    required BigInt id,
    required _i11.MultiAddress admin,
    required BigInt minBalance,
  }) {
    final _call = _i12.Call.values.create(
      id: id,
      admin: admin,
      minBalance: minBalance,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::force_create`].
  _i10.RuntimeCall forceCreate({
    required BigInt id,
    required _i11.MultiAddress owner,
    required bool isSufficient,
    required BigInt minBalance,
  }) {
    final _call = _i12.Call.values.forceCreate(
      id: id,
      owner: owner,
      isSufficient: isSufficient,
      minBalance: minBalance,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::start_destroy`].
  _i10.RuntimeCall startDestroy({required BigInt id}) {
    final _call = _i12.Call.values.startDestroy(id: id);
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::destroy_accounts`].
  _i10.RuntimeCall destroyAccounts({required BigInt id}) {
    final _call = _i12.Call.values.destroyAccounts(id: id);
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::destroy_approvals`].
  _i10.RuntimeCall destroyApprovals({required BigInt id}) {
    final _call = _i12.Call.values.destroyApprovals(id: id);
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::finish_destroy`].
  _i10.RuntimeCall finishDestroy({required BigInt id}) {
    final _call = _i12.Call.values.finishDestroy(id: id);
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::mint`].
  _i10.RuntimeCall mint({
    required BigInt id,
    required _i11.MultiAddress beneficiary,
    required BigInt amount,
  }) {
    final _call = _i12.Call.values.mint(
      id: id,
      beneficiary: beneficiary,
      amount: amount,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::burn`].
  _i10.RuntimeCall burn({
    required BigInt id,
    required _i11.MultiAddress who,
    required BigInt amount,
  }) {
    final _call = _i12.Call.values.burn(
      id: id,
      who: who,
      amount: amount,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::transfer`].
  _i10.RuntimeCall transfer({
    required BigInt id,
    required _i11.MultiAddress target,
    required BigInt amount,
  }) {
    final _call = _i12.Call.values.transfer(
      id: id,
      target: target,
      amount: amount,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::transfer_keep_alive`].
  _i10.RuntimeCall transferKeepAlive({
    required BigInt id,
    required _i11.MultiAddress target,
    required BigInt amount,
  }) {
    final _call = _i12.Call.values.transferKeepAlive(
      id: id,
      target: target,
      amount: amount,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::force_transfer`].
  _i10.RuntimeCall forceTransfer({
    required BigInt id,
    required _i11.MultiAddress source,
    required _i11.MultiAddress dest,
    required BigInt amount,
  }) {
    final _call = _i12.Call.values.forceTransfer(
      id: id,
      source: source,
      dest: dest,
      amount: amount,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::freeze`].
  _i10.RuntimeCall freeze({
    required BigInt id,
    required _i11.MultiAddress who,
  }) {
    final _call = _i12.Call.values.freeze(
      id: id,
      who: who,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::thaw`].
  _i10.RuntimeCall thaw({
    required BigInt id,
    required _i11.MultiAddress who,
  }) {
    final _call = _i12.Call.values.thaw(
      id: id,
      who: who,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::freeze_asset`].
  _i10.RuntimeCall freezeAsset({required BigInt id}) {
    final _call = _i12.Call.values.freezeAsset(id: id);
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::thaw_asset`].
  _i10.RuntimeCall thawAsset({required BigInt id}) {
    final _call = _i12.Call.values.thawAsset(id: id);
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::transfer_ownership`].
  _i10.RuntimeCall transferOwnership({
    required BigInt id,
    required _i11.MultiAddress owner,
  }) {
    final _call = _i12.Call.values.transferOwnership(
      id: id,
      owner: owner,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::set_team`].
  _i10.RuntimeCall setTeam({
    required BigInt id,
    required _i11.MultiAddress issuer,
    required _i11.MultiAddress admin,
    required _i11.MultiAddress freezer,
  }) {
    final _call = _i12.Call.values.setTeam(
      id: id,
      issuer: issuer,
      admin: admin,
      freezer: freezer,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::set_metadata`].
  _i10.RuntimeCall setMetadata({
    required BigInt id,
    _i13.Fiat? currencyType,
    required List<int> name,
    required List<int> symbol,
    required int decimals,
  }) {
    final _call = _i12.Call.values.setMetadata(
      id: id,
      currencyType: currencyType,
      name: name,
      symbol: symbol,
      decimals: decimals,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::clear_metadata`].
  _i10.RuntimeCall clearMetadata({required BigInt id}) {
    final _call = _i12.Call.values.clearMetadata(id: id);
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::force_set_metadata`].
  _i10.RuntimeCall forceSetMetadata({
    required BigInt id,
    required _i13.Fiat currencyType,
    required List<int> name,
    required List<int> symbol,
    required int decimals,
    required bool isFrozen,
  }) {
    final _call = _i12.Call.values.forceSetMetadata(
      id: id,
      currencyType: currencyType,
      name: name,
      symbol: symbol,
      decimals: decimals,
      isFrozen: isFrozen,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::force_clear_metadata`].
  _i10.RuntimeCall forceClearMetadata({required BigInt id}) {
    final _call = _i12.Call.values.forceClearMetadata(id: id);
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::force_asset_status`].
  _i10.RuntimeCall forceAssetStatus({
    required BigInt id,
    required _i11.MultiAddress owner,
    required _i11.MultiAddress issuer,
    required _i11.MultiAddress admin,
    required _i11.MultiAddress freezer,
    required BigInt minBalance,
    required bool isSufficient,
    required bool isFrozen,
  }) {
    final _call = _i12.Call.values.forceAssetStatus(
      id: id,
      owner: owner,
      issuer: issuer,
      admin: admin,
      freezer: freezer,
      minBalance: minBalance,
      isSufficient: isSufficient,
      isFrozen: isFrozen,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::approve_transfer`].
  _i10.RuntimeCall approveTransfer({
    required BigInt id,
    required _i11.MultiAddress delegate,
    required BigInt amount,
  }) {
    final _call = _i12.Call.values.approveTransfer(
      id: id,
      delegate: delegate,
      amount: amount,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::cancel_approval`].
  _i10.RuntimeCall cancelApproval({
    required BigInt id,
    required _i11.MultiAddress delegate,
  }) {
    final _call = _i12.Call.values.cancelApproval(
      id: id,
      delegate: delegate,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::force_cancel_approval`].
  _i10.RuntimeCall forceCancelApproval({
    required BigInt id,
    required _i11.MultiAddress owner,
    required _i11.MultiAddress delegate,
  }) {
    final _call = _i12.Call.values.forceCancelApproval(
      id: id,
      owner: owner,
      delegate: delegate,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::transfer_approved`].
  _i10.RuntimeCall transferApproved({
    required BigInt id,
    required _i11.MultiAddress owner,
    required _i11.MultiAddress destination,
    required BigInt amount,
  }) {
    final _call = _i12.Call.values.transferApproved(
      id: id,
      owner: owner,
      destination: destination,
      amount: amount,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::touch`].
  _i10.RuntimeCall touch({required BigInt id}) {
    final _call = _i12.Call.values.touch(id: id);
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::refund`].
  _i10.RuntimeCall refund({
    required BigInt id,
    required bool allowBurn,
  }) {
    final _call = _i12.Call.values.refund(
      id: id,
      allowBurn: allowBurn,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::set_min_balance`].
  _i10.RuntimeCall setMinBalance({
    required BigInt id,
    required BigInt minBalance,
  }) {
    final _call = _i12.Call.values.setMinBalance(
      id: id,
      minBalance: minBalance,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::touch_other`].
  _i10.RuntimeCall touchOther({
    required BigInt id,
    required _i11.MultiAddress who,
  }) {
    final _call = _i12.Call.values.touchOther(
      id: id,
      who: who,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::refund_other`].
  _i10.RuntimeCall refundOther({
    required BigInt id,
    required _i11.MultiAddress who,
  }) {
    final _call = _i12.Call.values.refundOther(
      id: id,
      who: who,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::block`].
  _i10.RuntimeCall block({
    required BigInt id,
    required _i11.MultiAddress who,
  }) {
    final _call = _i12.Call.values.block(
      id: id,
      who: who,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }

  /// See [`Pallet::force_transfer2`].
  _i10.RuntimeCall forceTransfer2({
    required BigInt id,
    required _i11.MultiAddress source,
    required _i11.MultiAddress dest,
    required BigInt amount,
  }) {
    final _call = _i12.Call.values.forceTransfer2(
      id: id,
      source: source,
      dest: dest,
      amount: amount,
    );
    return _i10.RuntimeCall.values.assets(_call);
  }
}

class Constants {
  Constants();

  /// Max number of items to destroy per `destroy_accounts` and `destroy_approvals` call.
  ///
  /// Must be configured to result in a weight that makes each call fit in a block.
  final int removeItemsLimit = 1000;

  /// The basic amount of funds that must be reserved for an asset.
  final BigInt assetDeposit = BigInt.from(10000000000);

  /// The amount of funds that must be reserved for a non-provider asset account to be
  /// maintained.
  final BigInt assetAccountDeposit = BigInt.from(2001600000);

  /// The basic amount of funds that must be reserved when adding metadata to your asset.
  final BigInt metadataDepositBase = BigInt.from(2006800000);

  /// The additional funds that must be reserved for the number of bytes you store in your
  /// metadata.
  final BigInt metadataDepositPerByte = BigInt.from(100000);

  /// The amount of funds that must be reserved when creating a new approval.
  final BigInt approvalDeposit = BigInt.from(1000000000);
}
