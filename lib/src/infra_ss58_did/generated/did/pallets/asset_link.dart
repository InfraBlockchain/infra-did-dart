// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/staging_xcm/v3/multilocation/multi_location.dart' as _i2;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<int, _i2.MultiLocation> _assetIdMultiLocation =
      const _i1.StorageMap<int, _i2.MultiLocation>(
    prefix: 'AssetLink',
    storage: 'AssetIdMultiLocation',
    valueCodec: _i2.MultiLocation.codec,
    hasher: _i1.StorageHasher.twoxx64Concat(_i3.U32Codec.codec),
  );

  final _i1.StorageMap<_i2.MultiLocation, int> _assetMultiLocationId =
      const _i1.StorageMap<_i2.MultiLocation, int>(
    prefix: 'AssetLink',
    storage: 'AssetMultiLocationId',
    valueCodec: _i3.U32Codec.codec,
    hasher: _i1.StorageHasher.twoxx64Concat(_i2.MultiLocation.codec),
  );

  _i4.Future<_i2.MultiLocation?> assetIdMultiLocation(
    int key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _assetIdMultiLocation.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _assetIdMultiLocation.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  _i4.Future<int?> assetMultiLocationId(
    _i2.MultiLocation key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _assetMultiLocationId.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _assetMultiLocationId.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `assetIdMultiLocation`.
  _i5.Uint8List assetIdMultiLocationKey(int key1) {
    final hashedKey = _assetIdMultiLocation.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `assetMultiLocationId`.
  _i5.Uint8List assetMultiLocationIdKey(_i2.MultiLocation key1) {
    final hashedKey = _assetMultiLocationId.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `assetIdMultiLocation`.
  _i5.Uint8List assetIdMultiLocationMapPrefix() {
    final hashedKey = _assetIdMultiLocation.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `assetMultiLocationId`.
  _i5.Uint8List assetMultiLocationIdMapPrefix() {
    final hashedKey = _assetMultiLocationId.mapPrefix();
    return hashedKey;
  }
}
