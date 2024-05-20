// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:typed_data' as _i10;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/did_runtime/runtime_call.dart' as _i11;
import '../types/pallet_uniques/pallet/call.dart' as _i13;
import '../types/pallet_uniques/types/collection_details.dart' as _i2;
import '../types/pallet_uniques/types/collection_metadata.dart' as _i6;
import '../types/pallet_uniques/types/destroy_witness.dart' as _i14;
import '../types/pallet_uniques/types/item_details.dart' as _i5;
import '../types/pallet_uniques/types/item_metadata.dart' as _i7;
import '../types/sp_core/crypto/account_id32.dart' as _i4;
import '../types/sp_runtime/multiaddress/multi_address.dart' as _i12;
import '../types/tuples.dart' as _i8;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<int, _i2.CollectionDetails> _class =
      const _i1.StorageMap<int, _i2.CollectionDetails>(
    prefix: 'Uniques',
    storage: 'Class',
    valueCodec: _i2.CollectionDetails.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
  );

  final _i1.StorageMap<_i4.AccountId32, int> _ownershipAcceptance =
      const _i1.StorageMap<_i4.AccountId32, int>(
    prefix: 'Uniques',
    storage: 'OwnershipAcceptance',
    valueCodec: _i3.U32Codec.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i4.AccountId32Codec()),
  );

  final _i1.StorageTripleMap<_i4.AccountId32, int, int, dynamic> _account =
      const _i1.StorageTripleMap<_i4.AccountId32, int, int, dynamic>(
    prefix: 'Uniques',
    storage: 'Account',
    valueCodec: _i3.NullCodec.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i4.AccountId32Codec()),
    hasher2: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
    hasher3: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
  );

  final _i1.StorageDoubleMap<_i4.AccountId32, int, dynamic> _classAccount =
      const _i1.StorageDoubleMap<_i4.AccountId32, int, dynamic>(
    prefix: 'Uniques',
    storage: 'ClassAccount',
    valueCodec: _i3.NullCodec.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i4.AccountId32Codec()),
    hasher2: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
  );

  final _i1.StorageDoubleMap<int, int, _i5.ItemDetails> _asset =
      const _i1.StorageDoubleMap<int, int, _i5.ItemDetails>(
    prefix: 'Uniques',
    storage: 'Asset',
    valueCodec: _i5.ItemDetails.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
    hasher2: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
  );

  final _i1.StorageMap<int, _i6.CollectionMetadata> _classMetadataOf =
      const _i1.StorageMap<int, _i6.CollectionMetadata>(
    prefix: 'Uniques',
    storage: 'ClassMetadataOf',
    valueCodec: _i6.CollectionMetadata.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
  );

  final _i1.StorageDoubleMap<int, int, _i7.ItemMetadata> _instanceMetadataOf =
      const _i1.StorageDoubleMap<int, int, _i7.ItemMetadata>(
    prefix: 'Uniques',
    storage: 'InstanceMetadataOf',
    valueCodec: _i7.ItemMetadata.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
    hasher2: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
  );

  final _i1
      .StorageTripleMap<int, int?, List<int>, _i8.Tuple2<List<int>, BigInt>>
      _attribute = const _i1.StorageTripleMap<int, int?, List<int>,
          _i8.Tuple2<List<int>, BigInt>>(
    prefix: 'Uniques',
    storage: 'Attribute',
    valueCodec: _i8.Tuple2Codec<List<int>, BigInt>(
      _i3.U8SequenceCodec.codec,
      _i3.U128Codec.codec,
    ),
    hasher1: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
    hasher2: _i1.StorageHasher.blake2b128Concat(
        _i3.OptionCodec<int>(_i3.U32Codec.codec)),
    hasher3: _i1.StorageHasher.blake2b128Concat(_i3.U8SequenceCodec.codec),
  );

  final _i1.StorageDoubleMap<int, int, _i8.Tuple2<BigInt, _i4.AccountId32?>>
      _itemPriceOf = const _i1
          .StorageDoubleMap<int, int, _i8.Tuple2<BigInt, _i4.AccountId32?>>(
    prefix: 'Uniques',
    storage: 'ItemPriceOf',
    valueCodec: _i8.Tuple2Codec<BigInt, _i4.AccountId32?>(
      _i3.U128Codec.codec,
      _i3.OptionCodec<_i4.AccountId32>(_i4.AccountId32Codec()),
    ),
    hasher1: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
    hasher2: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
  );

  final _i1.StorageMap<int, int> _collectionMaxSupply =
      const _i1.StorageMap<int, int>(
    prefix: 'Uniques',
    storage: 'CollectionMaxSupply',
    valueCodec: _i3.U32Codec.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i3.U32Codec.codec),
  );

  /// Details of a collection.
  _i9.Future<_i2.CollectionDetails?> class_(
    int key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _class.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _class.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The collection, if any, of which an account is willing to take ownership.
  _i9.Future<int?> ownershipAcceptance(
    _i4.AccountId32 key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _ownershipAcceptance.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _ownershipAcceptance.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The items held by any given account; set out this way so that items owned by a single
  /// account can be enumerated.
  _i9.Future<dynamic> account(
    _i4.AccountId32 key1,
    int key2,
    int key3, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _account.hashedKeyFor(
      key1,
      key2,
      key3,
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

  /// The collections owned by any given account; set out this way so that collections owned by
  /// a single account can be enumerated.
  _i9.Future<dynamic> classAccount(
    _i4.AccountId32 key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _classAccount.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _classAccount.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The items in existence and their ownership details.
  _i9.Future<_i5.ItemDetails?> asset(
    int key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _asset.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _asset.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Metadata of a collection.
  _i9.Future<_i6.CollectionMetadata?> classMetadataOf(
    int key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _classMetadataOf.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _classMetadataOf.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Metadata of an item.
  _i9.Future<_i7.ItemMetadata?> instanceMetadataOf(
    int key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _instanceMetadataOf.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _instanceMetadataOf.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Attributes of a collection.
  _i9.Future<_i8.Tuple2<List<int>, BigInt>?> attribute(
    int key1,
    int? key2,
    List<int> key3, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _attribute.hashedKeyFor(
      key1,
      key2,
      key3,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _attribute.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Price of an asset instance.
  _i9.Future<_i8.Tuple2<BigInt, _i4.AccountId32?>?> itemPriceOf(
    int key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _itemPriceOf.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _itemPriceOf.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Keeps track of the number of items a collection might have.
  _i9.Future<int?> collectionMaxSupply(
    int key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _collectionMaxSupply.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _collectionMaxSupply.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `class`.
  _i10.Uint8List classKey(int key1) {
    final hashedKey = _class.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `ownershipAcceptance`.
  _i10.Uint8List ownershipAcceptanceKey(_i4.AccountId32 key1) {
    final hashedKey = _ownershipAcceptance.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `account`.
  _i10.Uint8List accountKey(
    _i4.AccountId32 key1,
    int key2,
    int key3,
  ) {
    final hashedKey = _account.hashedKeyFor(
      key1,
      key2,
      key3,
    );
    return hashedKey;
  }

  /// Returns the storage key for `classAccount`.
  _i10.Uint8List classAccountKey(
    _i4.AccountId32 key1,
    int key2,
  ) {
    final hashedKey = _classAccount.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `asset`.
  _i10.Uint8List assetKey(
    int key1,
    int key2,
  ) {
    final hashedKey = _asset.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `classMetadataOf`.
  _i10.Uint8List classMetadataOfKey(int key1) {
    final hashedKey = _classMetadataOf.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `instanceMetadataOf`.
  _i10.Uint8List instanceMetadataOfKey(
    int key1,
    int key2,
  ) {
    final hashedKey = _instanceMetadataOf.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `attribute`.
  _i10.Uint8List attributeKey(
    int key1,
    int? key2,
    List<int> key3,
  ) {
    final hashedKey = _attribute.hashedKeyFor(
      key1,
      key2,
      key3,
    );
    return hashedKey;
  }

  /// Returns the storage key for `itemPriceOf`.
  _i10.Uint8List itemPriceOfKey(
    int key1,
    int key2,
  ) {
    final hashedKey = _itemPriceOf.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `collectionMaxSupply`.
  _i10.Uint8List collectionMaxSupplyKey(int key1) {
    final hashedKey = _collectionMaxSupply.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `class`.
  _i10.Uint8List classMapPrefix() {
    final hashedKey = _class.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `ownershipAcceptance`.
  _i10.Uint8List ownershipAcceptanceMapPrefix() {
    final hashedKey = _ownershipAcceptance.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `classAccount`.
  _i10.Uint8List classAccountMapPrefix(_i4.AccountId32 key1) {
    final hashedKey = _classAccount.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `asset`.
  _i10.Uint8List assetMapPrefix(int key1) {
    final hashedKey = _asset.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `classMetadataOf`.
  _i10.Uint8List classMetadataOfMapPrefix() {
    final hashedKey = _classMetadataOf.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `instanceMetadataOf`.
  _i10.Uint8List instanceMetadataOfMapPrefix(int key1) {
    final hashedKey = _instanceMetadataOf.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `itemPriceOf`.
  _i10.Uint8List itemPriceOfMapPrefix(int key1) {
    final hashedKey = _itemPriceOf.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `collectionMaxSupply`.
  _i10.Uint8List collectionMaxSupplyMapPrefix() {
    final hashedKey = _collectionMaxSupply.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::create`].
  _i11.RuntimeCall create({
    required int collection,
    required _i12.MultiAddress admin,
  }) {
    final _call = _i13.Call.values.create(
      collection: collection,
      admin: admin,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::force_create`].
  _i11.RuntimeCall forceCreate({
    required int collection,
    required _i12.MultiAddress owner,
    required bool freeHolding,
  }) {
    final _call = _i13.Call.values.forceCreate(
      collection: collection,
      owner: owner,
      freeHolding: freeHolding,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::destroy`].
  _i11.RuntimeCall destroy({
    required int collection,
    required _i14.DestroyWitness witness,
  }) {
    final _call = _i13.Call.values.destroy(
      collection: collection,
      witness: witness,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::mint`].
  _i11.RuntimeCall mint({
    required int collection,
    required int item,
    required _i12.MultiAddress owner,
  }) {
    final _call = _i13.Call.values.mint(
      collection: collection,
      item: item,
      owner: owner,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::burn`].
  _i11.RuntimeCall burn({
    required int collection,
    required int item,
    _i12.MultiAddress? checkOwner,
  }) {
    final _call = _i13.Call.values.burn(
      collection: collection,
      item: item,
      checkOwner: checkOwner,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::transfer`].
  _i11.RuntimeCall transfer({
    required int collection,
    required int item,
    required _i12.MultiAddress dest,
  }) {
    final _call = _i13.Call.values.transfer(
      collection: collection,
      item: item,
      dest: dest,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::redeposit`].
  _i11.RuntimeCall redeposit({
    required int collection,
    required List<int> items,
  }) {
    final _call = _i13.Call.values.redeposit(
      collection: collection,
      items: items,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::freeze`].
  _i11.RuntimeCall freeze({
    required int collection,
    required int item,
  }) {
    final _call = _i13.Call.values.freeze(
      collection: collection,
      item: item,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::thaw`].
  _i11.RuntimeCall thaw({
    required int collection,
    required int item,
  }) {
    final _call = _i13.Call.values.thaw(
      collection: collection,
      item: item,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::freeze_collection`].
  _i11.RuntimeCall freezeCollection({required int collection}) {
    final _call = _i13.Call.values.freezeCollection(collection: collection);
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::thaw_collection`].
  _i11.RuntimeCall thawCollection({required int collection}) {
    final _call = _i13.Call.values.thawCollection(collection: collection);
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::transfer_ownership`].
  _i11.RuntimeCall transferOwnership({
    required int collection,
    required _i12.MultiAddress owner,
  }) {
    final _call = _i13.Call.values.transferOwnership(
      collection: collection,
      owner: owner,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::set_team`].
  _i11.RuntimeCall setTeam({
    required int collection,
    required _i12.MultiAddress issuer,
    required _i12.MultiAddress admin,
    required _i12.MultiAddress freezer,
  }) {
    final _call = _i13.Call.values.setTeam(
      collection: collection,
      issuer: issuer,
      admin: admin,
      freezer: freezer,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::approve_transfer`].
  _i11.RuntimeCall approveTransfer({
    required int collection,
    required int item,
    required _i12.MultiAddress delegate,
  }) {
    final _call = _i13.Call.values.approveTransfer(
      collection: collection,
      item: item,
      delegate: delegate,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::cancel_approval`].
  _i11.RuntimeCall cancelApproval({
    required int collection,
    required int item,
    _i12.MultiAddress? maybeCheckDelegate,
  }) {
    final _call = _i13.Call.values.cancelApproval(
      collection: collection,
      item: item,
      maybeCheckDelegate: maybeCheckDelegate,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::force_item_status`].
  _i11.RuntimeCall forceItemStatus({
    required int collection,
    required _i12.MultiAddress owner,
    required _i12.MultiAddress issuer,
    required _i12.MultiAddress admin,
    required _i12.MultiAddress freezer,
    required bool freeHolding,
    required bool isFrozen,
  }) {
    final _call = _i13.Call.values.forceItemStatus(
      collection: collection,
      owner: owner,
      issuer: issuer,
      admin: admin,
      freezer: freezer,
      freeHolding: freeHolding,
      isFrozen: isFrozen,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::set_attribute`].
  _i11.RuntimeCall setAttribute({
    required int collection,
    int? maybeItem,
    required List<int> key,
    required List<int> value,
  }) {
    final _call = _i13.Call.values.setAttribute(
      collection: collection,
      maybeItem: maybeItem,
      key: key,
      value: value,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::clear_attribute`].
  _i11.RuntimeCall clearAttribute({
    required int collection,
    int? maybeItem,
    required List<int> key,
  }) {
    final _call = _i13.Call.values.clearAttribute(
      collection: collection,
      maybeItem: maybeItem,
      key: key,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::set_metadata`].
  _i11.RuntimeCall setMetadata({
    required int collection,
    required int item,
    required List<int> data,
    required bool isFrozen,
  }) {
    final _call = _i13.Call.values.setMetadata(
      collection: collection,
      item: item,
      data: data,
      isFrozen: isFrozen,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::clear_metadata`].
  _i11.RuntimeCall clearMetadata({
    required int collection,
    required int item,
  }) {
    final _call = _i13.Call.values.clearMetadata(
      collection: collection,
      item: item,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::set_collection_metadata`].
  _i11.RuntimeCall setCollectionMetadata({
    required int collection,
    required List<int> data,
    required bool isFrozen,
  }) {
    final _call = _i13.Call.values.setCollectionMetadata(
      collection: collection,
      data: data,
      isFrozen: isFrozen,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::clear_collection_metadata`].
  _i11.RuntimeCall clearCollectionMetadata({required int collection}) {
    final _call =
        _i13.Call.values.clearCollectionMetadata(collection: collection);
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::set_accept_ownership`].
  _i11.RuntimeCall setAcceptOwnership({int? maybeCollection}) {
    final _call =
        _i13.Call.values.setAcceptOwnership(maybeCollection: maybeCollection);
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::set_collection_max_supply`].
  _i11.RuntimeCall setCollectionMaxSupply({
    required int collection,
    required int maxSupply,
  }) {
    final _call = _i13.Call.values.setCollectionMaxSupply(
      collection: collection,
      maxSupply: maxSupply,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::set_price`].
  _i11.RuntimeCall setPrice({
    required int collection,
    required int item,
    BigInt? price,
    _i12.MultiAddress? whitelistedBuyer,
  }) {
    final _call = _i13.Call.values.setPrice(
      collection: collection,
      item: item,
      price: price,
      whitelistedBuyer: whitelistedBuyer,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }

  /// See [`Pallet::buy_item`].
  _i11.RuntimeCall buyItem({
    required int collection,
    required int item,
    required BigInt bidPrice,
  }) {
    final _call = _i13.Call.values.buyItem(
      collection: collection,
      item: item,
      bidPrice: bidPrice,
    );
    return _i11.RuntimeCall.values.uniques(_call);
  }
}

class Constants {
  Constants();

  /// The basic amount of funds that must be reserved for collection.
  final BigInt collectionDeposit = BigInt.from(100000000000);

  /// The basic amount of funds that must be reserved for an item.
  final BigInt itemDeposit = BigInt.from(100000000);

  /// The basic amount of funds that must be reserved when adding metadata to your item.
  final BigInt metadataDepositBase = BigInt.from(2012900000);

  /// The basic amount of funds that must be reserved when adding an attribute to an item.
  final BigInt attributeDepositBase = BigInt.from(2000000000);

  /// The additional funds that must be reserved for the number of bytes store in metadata,
  /// either "normal" metadata or attribute metadata.
  final BigInt depositPerByte = BigInt.from(100000);

  /// The maximum length of data stored on-chain.
  final int stringLimit = 128;

  /// The maximum length of an attribute key.
  final int keyLimit = 32;

  /// The maximum length of an attribute value.
  final int valueLimit = 64;
}
