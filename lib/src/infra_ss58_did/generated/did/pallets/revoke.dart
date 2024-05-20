// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:typed_data' as _i8;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i5;

import '../types/AddRegistry/add_registry.dart' as _i10;
import '../types/did_core/common/storage_version/storage_version.dart' as _i6;
import '../types/did_core/modules/revoke/pallet/call.dart' as _i11;
import '../types/did_runtime/runtime_call.dart' as _i9;
import '../types/DidSignatureWithNonce/did_signature_with_nonce.dart' as _i13;
import '../types/Registry/registry.dart' as _i3;
import '../types/RegistryId/registry_id.dart' as _i2;
import '../types/RemoveRegistryRaw/remove_registry_raw.dart' as _i15;
import '../types/RevokeId/revoke_id.dart' as _i4;
import '../types/RevokeRaw/revoke_raw.dart' as _i12;
import '../types/UnRevokeRaw/un_revoke_raw.dart' as _i14;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.RegistryId, _i3.Registry> _registries =
      const _i1.StorageMap<_i2.RegistryId, _i3.Registry>(
    prefix: 'Revoke',
    storage: 'Registries',
    valueCodec: _i3.Registry.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i2.RegistryIdCodec()),
  );

  final _i1.StorageDoubleMap<_i2.RegistryId, _i4.RevokeId, dynamic>
      _revocations =
      const _i1.StorageDoubleMap<_i2.RegistryId, _i4.RevokeId, dynamic>(
    prefix: 'Revoke',
    storage: 'Revocations',
    valueCodec: _i5.NullCodec.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i2.RegistryIdCodec()),
    hasher2: _i1.StorageHasher.blake2b256(_i4.RevokeIdCodec()),
  );

  final _i1.StorageValue<_i6.StorageVersion> _version =
      const _i1.StorageValue<_i6.StorageVersion>(
    prefix: 'Revoke',
    storage: 'Version',
    valueCodec: _i6.StorageVersion.codec,
  );

  /// Registry metadata
  _i7.Future<_i3.Registry?> registries(
    _i2.RegistryId key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _registries.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _registries.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The single global revocation set
  _i7.Future<dynamic> revocations(
    _i2.RegistryId key1,
    _i4.RevokeId key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _revocations.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _revocations.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  _i7.Future<_i6.StorageVersion> version({_i1.BlockHash? at}) async {
    final hashedKey = _version.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _version.decodeValue(bytes);
    }
    return _i6.StorageVersion.singleKey; /* Default */
  }

  /// Returns the storage key for `registries`.
  _i8.Uint8List registriesKey(_i2.RegistryId key1) {
    final hashedKey = _registries.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `revocations`.
  _i8.Uint8List revocationsKey(
    _i2.RegistryId key1,
    _i4.RevokeId key2,
  ) {
    final hashedKey = _revocations.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `version`.
  _i8.Uint8List versionKey() {
    final hashedKey = _version.hashedKey();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `registries`.
  _i8.Uint8List registriesMapPrefix() {
    final hashedKey = _registries.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `revocations`.
  _i8.Uint8List revocationsMapPrefix(_i2.RegistryId key1) {
    final hashedKey = _revocations.mapPrefix(key1);
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::new_registry`].
  _i9.RuntimeCall newRegistry({required _i10.AddRegistry addRegistry}) {
    final _call = _i11.Call.values.newRegistry(addRegistry: addRegistry);
    return _i9.RuntimeCall.values.revoke(_call);
  }

  /// See [`Pallet::revoke`].
  _i9.RuntimeCall revoke({
    required _i12.RevokeRaw revoke,
    required List<_i13.DidSignatureWithNonce> proof,
  }) {
    final _call = _i11.Call.values.revoke(
      revoke: revoke,
      proof: proof,
    );
    return _i9.RuntimeCall.values.revoke(_call);
  }

  /// See [`Pallet::unrevoke`].
  _i9.RuntimeCall unrevoke({
    required _i14.UnRevokeRaw unrevoke,
    required List<_i13.DidSignatureWithNonce> proof,
  }) {
    final _call = _i11.Call.values.unrevoke(
      unrevoke: unrevoke,
      proof: proof,
    );
    return _i9.RuntimeCall.values.revoke(_call);
  }

  /// See [`Pallet::remove_registry`].
  _i9.RuntimeCall removeRegistry({
    required _i15.RemoveRegistryRaw removal,
    required List<_i13.DidSignatureWithNonce> proof,
  }) {
    final _call = _i11.Call.values.removeRegistry(
      removal: removal,
      proof: proof,
    );
    return _i9.RuntimeCall.values.revoke(_call);
  }
}
