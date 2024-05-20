// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:typed_data' as _i8;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i5;

import '../types/AddAuthorizer/add_authorizer.dart' as _i10;
import '../types/AddIssuerRaw/add_issuer_raw.dart' as _i12;
import '../types/AddVerifierRaw/add_verifier_raw.dart' as _i15;
import '../types/Authorizer/authorizer.dart' as _i3;
import '../types/AuthorizerId/authorizer_id.dart' as _i2;
import '../types/did_core/common/storage_version/storage_version.dart' as _i6;
import '../types/did_core/modules/trusted_entity/pallet/call.dart' as _i11;
import '../types/did_runtime/runtime_call.dart' as _i9;
import '../types/DidSignatureWithNonce/did_signature_with_nonce.dart' as _i13;
import '../types/RemoveAuthorizerRaw/remove_authorizer_raw.dart' as _i17;
import '../types/RemoveIssuerRaw/remove_issuer_raw.dart' as _i14;
import '../types/RemoveVerifierRaw/remove_verifier_raw.dart' as _i16;
import '../types/TrustedEntityId/trusted_entity_id.dart' as _i4;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.AuthorizerId, _i3.Authorizer> _authorizers =
      const _i1.StorageMap<_i2.AuthorizerId, _i3.Authorizer>(
    prefix: 'TrustedEntity',
    storage: 'Authorizers',
    valueCodec: _i3.Authorizer.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i2.AuthorizerIdCodec()),
  );

  final _i1.StorageDoubleMap<_i2.AuthorizerId, _i4.TrustedEntityId, dynamic>
      _issuers = const _i1
          .StorageDoubleMap<_i2.AuthorizerId, _i4.TrustedEntityId, dynamic>(
    prefix: 'TrustedEntity',
    storage: 'Issuers',
    valueCodec: _i5.NullCodec.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i2.AuthorizerIdCodec()),
    hasher2: _i1.StorageHasher.blake2b256(_i4.TrustedEntityIdCodec()),
  );

  final _i1.StorageDoubleMap<_i2.AuthorizerId, _i4.TrustedEntityId, dynamic>
      _verifiers = const _i1
          .StorageDoubleMap<_i2.AuthorizerId, _i4.TrustedEntityId, dynamic>(
    prefix: 'TrustedEntity',
    storage: 'Verifiers',
    valueCodec: _i5.NullCodec.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i2.AuthorizerIdCodec()),
    hasher2: _i1.StorageHasher.blake2b256(_i4.TrustedEntityIdCodec()),
  );

  final _i1.StorageValue<_i6.StorageVersion> _version =
      const _i1.StorageValue<_i6.StorageVersion>(
    prefix: 'TrustedEntity',
    storage: 'Version',
    valueCodec: _i6.StorageVersion.codec,
  );

  /// Authorizer metadata
  _i7.Future<_i3.Authorizer?> authorizers(
    _i2.AuthorizerId key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _authorizers.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _authorizers.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The single global issuer set
  _i7.Future<dynamic> issuers(
    _i2.AuthorizerId key1,
    _i4.TrustedEntityId key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _issuers.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _issuers.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The single global verifier set
  _i7.Future<dynamic> verifiers(
    _i2.AuthorizerId key1,
    _i4.TrustedEntityId key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _verifiers.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _verifiers.decodeValue(bytes);
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

  /// Returns the storage key for `authorizers`.
  _i8.Uint8List authorizersKey(_i2.AuthorizerId key1) {
    final hashedKey = _authorizers.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `issuers`.
  _i8.Uint8List issuersKey(
    _i2.AuthorizerId key1,
    _i4.TrustedEntityId key2,
  ) {
    final hashedKey = _issuers.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `verifiers`.
  _i8.Uint8List verifiersKey(
    _i2.AuthorizerId key1,
    _i4.TrustedEntityId key2,
  ) {
    final hashedKey = _verifiers.hashedKeyFor(
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

  /// Returns the storage map key prefix for `authorizers`.
  _i8.Uint8List authorizersMapPrefix() {
    final hashedKey = _authorizers.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `issuers`.
  _i8.Uint8List issuersMapPrefix(_i2.AuthorizerId key1) {
    final hashedKey = _issuers.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `verifiers`.
  _i8.Uint8List verifiersMapPrefix(_i2.AuthorizerId key1) {
    final hashedKey = _verifiers.mapPrefix(key1);
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::new_authorizer`].
  _i9.RuntimeCall newAuthorizer({required _i10.AddAuthorizer addAuthorizer}) {
    final _call = _i11.Call.values.newAuthorizer(addAuthorizer: addAuthorizer);
    return _i9.RuntimeCall.values.trustedEntity(_call);
  }

  /// See [`Pallet::add_issuer`].
  _i9.RuntimeCall addIssuer({
    required _i12.AddIssuerRaw addIssuer,
    required List<_i13.DidSignatureWithNonce> proof,
  }) {
    final _call = _i11.Call.values.addIssuer(
      addIssuer: addIssuer,
      proof: proof,
    );
    return _i9.RuntimeCall.values.trustedEntity(_call);
  }

  /// See [`Pallet::remove_issuer`].
  _i9.RuntimeCall removeIssuer({
    required _i14.RemoveIssuerRaw removeIssuer,
    required List<_i13.DidSignatureWithNonce> proof,
  }) {
    final _call = _i11.Call.values.removeIssuer(
      removeIssuer: removeIssuer,
      proof: proof,
    );
    return _i9.RuntimeCall.values.trustedEntity(_call);
  }

  /// See [`Pallet::add_verifier`].
  _i9.RuntimeCall addVerifier({
    required _i15.AddVerifierRaw addVerifier,
    required List<_i13.DidSignatureWithNonce> proof,
  }) {
    final _call = _i11.Call.values.addVerifier(
      addVerifier: addVerifier,
      proof: proof,
    );
    return _i9.RuntimeCall.values.trustedEntity(_call);
  }

  /// See [`Pallet::remove_verifier`].
  _i9.RuntimeCall removeVerifier({
    required _i16.RemoveVerifierRaw removeVerifier,
    required List<_i13.DidSignatureWithNonce> proof,
  }) {
    final _call = _i11.Call.values.removeVerifier(
      removeVerifier: removeVerifier,
      proof: proof,
    );
    return _i9.RuntimeCall.values.trustedEntity(_call);
  }

  /// See [`Pallet::remove_authorizer`].
  _i9.RuntimeCall removeAuthorizer({
    required _i17.RemoveAuthorizerRaw removal,
    required List<_i13.DidSignatureWithNonce> proof,
  }) {
    final _call = _i11.Call.values.removeAuthorizer(
      removal: removal,
      proof: proof,
    );
    return _i9.RuntimeCall.values.trustedEntity(_call);
  }
}
