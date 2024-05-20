// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:typed_data' as _i9;

import 'package:polkadart/polkadart.dart' as _i1;

import '../types/AddOffchainSignatureParams/add_offchain_signature_params.dart'
    as _i11;
import '../types/AddOffchainSignaturePublicKey/add_offchain_signature_public_key.dart'
    as _i14;
import '../types/Did/did.dart' as _i5;
import '../types/did_core/common/storage_version/storage_version.dart' as _i7;
import '../types/did_core/modules/offchain_signatures/pallet/call.dart' as _i13;
import '../types/did_runtime/runtime_call.dart' as _i10;
import '../types/DidSignature/did_signature_1.dart' as _i15;
import '../types/DidSignature/did_signature_6.dart' as _i12;
import '../types/IncId/inc_id.dart' as _i3;
import '../types/OffchainPublicKey/offchain_public_key.dart' as _i6;
import '../types/OffchainSignatureParams/offchain_signature_params.dart' as _i4;
import '../types/RemoveOffchainSignatureParams/remove_offchain_signature_params.dart'
    as _i16;
import '../types/RemoveOffchainSignaturePublicKey/remove_offchain_signature_public_key.dart'
    as _i17;
import '../types/SignatureParamsOwner/signature_params_owner.dart' as _i2;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.SignatureParamsOwner, _i3.IncId> _paramsCounter =
      const _i1.StorageMap<_i2.SignatureParamsOwner, _i3.IncId>(
    prefix: 'OffchainSignatures',
    storage: 'ParamsCounter',
    valueCodec: _i3.IncIdCodec(),
    hasher: _i1.StorageHasher.blake2b128Concat(_i2.SignatureParamsOwnerCodec()),
  );

  final _i1.StorageDoubleMap<_i2.SignatureParamsOwner, _i3.IncId,
          _i4.OffchainSignatureParams> _signatureParams =
      const _i1.StorageDoubleMap<_i2.SignatureParamsOwner, _i3.IncId,
          _i4.OffchainSignatureParams>(
    prefix: 'OffchainSignatures',
    storage: 'SignatureParams',
    valueCodec: _i4.OffchainSignatureParams.codec,
    hasher1:
        _i1.StorageHasher.blake2b128Concat(_i2.SignatureParamsOwnerCodec()),
    hasher2: _i1.StorageHasher.identity(_i3.IncIdCodec()),
  );

  final _i1.StorageDoubleMap<_i5.Did, _i3.IncId, _i6.OffchainPublicKey>
      _publicKeys =
      const _i1.StorageDoubleMap<_i5.Did, _i3.IncId, _i6.OffchainPublicKey>(
    prefix: 'OffchainSignatures',
    storage: 'PublicKeys',
    valueCodec: _i6.OffchainPublicKey.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i5.DidCodec()),
    hasher2: _i1.StorageHasher.identity(_i3.IncIdCodec()),
  );

  final _i1.StorageValue<_i7.StorageVersion> _version =
      const _i1.StorageValue<_i7.StorageVersion>(
    prefix: 'OffchainSignatures',
    storage: 'Version',
    valueCodec: _i7.StorageVersion.codec,
  );

  /// Pair of counters where each is used to assign unique id to parameters and public keys
  /// respectively. On adding new params or keys, corresponding counter is increased by 1 but
  /// the counters don't decrease on removal
  _i8.Future<_i3.IncId> paramsCounter(
    _i2.SignatureParamsOwner key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _paramsCounter.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _paramsCounter.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// Signature parameters are stored as key value (did, counter) -> signature parameters
  _i8.Future<_i4.OffchainSignatureParams?> signatureParams(
    _i2.SignatureParamsOwner key1,
    _i3.IncId key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _signatureParams.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _signatureParams.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Public keys are stored as key value (did, counter) -> public key
  _i8.Future<_i6.OffchainPublicKey?> publicKeys(
    _i5.Did key1,
    _i3.IncId key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _publicKeys.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _publicKeys.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  _i8.Future<_i7.StorageVersion> version({_i1.BlockHash? at}) async {
    final hashedKey = _version.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _version.decodeValue(bytes);
    }
    return _i7.StorageVersion.singleKey; /* Default */
  }

  /// Returns the storage key for `paramsCounter`.
  _i9.Uint8List paramsCounterKey(_i2.SignatureParamsOwner key1) {
    final hashedKey = _paramsCounter.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `signatureParams`.
  _i9.Uint8List signatureParamsKey(
    _i2.SignatureParamsOwner key1,
    _i3.IncId key2,
  ) {
    final hashedKey = _signatureParams.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `publicKeys`.
  _i9.Uint8List publicKeysKey(
    _i5.Did key1,
    _i3.IncId key2,
  ) {
    final hashedKey = _publicKeys.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `version`.
  _i9.Uint8List versionKey() {
    final hashedKey = _version.hashedKey();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `paramsCounter`.
  _i9.Uint8List paramsCounterMapPrefix() {
    final hashedKey = _paramsCounter.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `signatureParams`.
  _i9.Uint8List signatureParamsMapPrefix(_i2.SignatureParamsOwner key1) {
    final hashedKey = _signatureParams.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `publicKeys`.
  _i9.Uint8List publicKeysMapPrefix(_i5.Did key1) {
    final hashedKey = _publicKeys.mapPrefix(key1);
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::add_params`].
  _i10.RuntimeCall addParams({
    required _i11.AddOffchainSignatureParams params,
    required _i12.DidSignature signature,
  }) {
    final _call = _i13.Call.values.addParams(
      params: params,
      signature: signature,
    );
    return _i10.RuntimeCall.values.offchainSignatures(_call);
  }

  /// See [`Pallet::add_public_key`].
  _i10.RuntimeCall addPublicKey({
    required _i14.AddOffchainSignaturePublicKey publicKey,
    required _i15.DidSignature signature,
  }) {
    final _call = _i13.Call.values.addPublicKey(
      publicKey: publicKey,
      signature: signature,
    );
    return _i10.RuntimeCall.values.offchainSignatures(_call);
  }

  /// See [`Pallet::remove_params`].
  _i10.RuntimeCall removeParams({
    required _i16.RemoveOffchainSignatureParams remove,
    required _i12.DidSignature signature,
  }) {
    final _call = _i13.Call.values.removeParams(
      remove: remove,
      signature: signature,
    );
    return _i10.RuntimeCall.values.offchainSignatures(_call);
  }

  /// See [`Pallet::remove_public_key`].
  _i10.RuntimeCall removePublicKey({
    required _i17.RemoveOffchainSignaturePublicKey remove,
    required _i15.DidSignature signature,
  }) {
    final _call = _i13.Call.values.removePublicKey(
      remove: remove,
      signature: signature,
    );
    return _i10.RuntimeCall.values.offchainSignatures(_call);
  }
}
