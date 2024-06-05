// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;
import 'dart:typed_data' as _i12;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i7;

import '../types/AddControllers/add_controllers.dart' as _i21;
import '../types/AddKeys/add_keys.dart' as _i18;
import '../types/AddServiceEndpoint/add_service_endpoint.dart' as _i23;
import '../types/AggregatedDidDetailsResponse/aggregated_did_details_response.dart'
    as _i27;
import '../types/b_tree_set_2.dart' as _i17;
import '../types/Controller/controller.dart' as _i6;
import '../types/Did/did.dart' as _i2;
import '../types/did_core/common/storage_version/storage_version.dart' as _i10;
import '../types/did_core/modules/did/pallet/call.dart' as _i15;
import '../types/did_runtime/runtime_call.dart' as _i13;
import '../types/DidKey/did_key.dart' as _i5;
import '../types/DidRemoval/did_removal.dart' as _i25;
import '../types/DidSignature/did_signature_1.dart' as _i19;
import '../types/IncId/inc_id.dart' as _i4;
import '../types/OffChainDidDocRef/off_chain_did_doc_ref.dart' as _i14;
import '../types/RemoveControllers/remove_controllers.dart' as _i22;
import '../types/RemoveKeys/remove_keys.dart' as _i20;
import '../types/RemoveServiceEndpoint/remove_service_endpoint.dart' as _i24;
import '../types/ServiceEndpoint/service_endpoint.dart' as _i9;
import '../types/ServiceEndpointId/service_endpoint_id.dart' as _i8;
import '../types/StateChange/state_change.dart' as _i26;
import '../types/StoredDidDetails/stored_did_details.dart' as _i3;
import '../types/UncheckedDidKey/unchecked_did_key.dart' as _i16;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.Did, _i3.StoredDidDetails> _dids =
      const _i1.StorageMap<_i2.Did, _i3.StoredDidDetails>(
    prefix: 'DIDModule',
    storage: 'Dids',
    valueCodec: _i3.StoredDidDetails.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i2.DidCodec()),
  );

  final _i1.StorageDoubleMap<_i2.Did, _i4.IncId, _i5.DidKey> _didKeys =
      const _i1.StorageDoubleMap<_i2.Did, _i4.IncId, _i5.DidKey>(
    prefix: 'DIDModule',
    storage: 'DidKeys',
    valueCodec: _i5.DidKey.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i2.DidCodec()),
    hasher2: _i1.StorageHasher.identity(_i4.IncIdCodec()),
  );

  final _i1.StorageDoubleMap<_i2.Did, _i6.Controller, dynamic> _didControllers =
      const _i1.StorageDoubleMap<_i2.Did, _i6.Controller, dynamic>(
    prefix: 'DIDModule',
    storage: 'DidControllers',
    valueCodec: _i7.NullCodec.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i2.DidCodec()),
    hasher2: _i1.StorageHasher.blake2b128Concat(_i6.ControllerCodec()),
  );

  final _i1
      .StorageDoubleMap<_i2.Did, _i8.ServiceEndpointId, _i9.ServiceEndpoint>
      _didServiceEndpoints = const _i1.StorageDoubleMap<_i2.Did,
          _i8.ServiceEndpointId, _i9.ServiceEndpoint>(
    prefix: 'DIDModule',
    storage: 'DidServiceEndpoints',
    valueCodec: _i9.ServiceEndpoint.codec,
    hasher1: _i1.StorageHasher.blake2b128Concat(_i2.DidCodec()),
    hasher2: _i1.StorageHasher.blake2b128Concat(_i8.ServiceEndpointIdCodec()),
  );

  final _i1.StorageValue<_i10.StorageVersion> _version =
      const _i1.StorageValue<_i10.StorageVersion>(
    prefix: 'DIDModule',
    storage: 'Version',
    valueCodec: _i10.StorageVersion.codec,
  );

  /// Stores details of off-chain and on-chain DIDs
  _i11.Future<_i3.StoredDidDetails?> dids(
    _i2.Did key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _dids.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _dids.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Stores keys of a DID as (DID, IncId) -> DidKey. Does not check if the same key is being
  /// added multiple times to the same DID.
  _i11.Future<_i5.DidKey?> didKeys(
    _i2.Did key1,
    _i4.IncId key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _didKeys.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _didKeys.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Stores controlled - controller pairs of a DID as (DID, DID) -> zero-sized record. If a
  /// record exists, then the controller is bound.
  _i11.Future<dynamic> didControllers(
    _i2.Did key1,
    _i6.Controller key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _didControllers.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _didControllers.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Stores service endpoints of a DID as (DID, endpoint id) -> ServiceEndpoint.
  _i11.Future<_i9.ServiceEndpoint?> didServiceEndpoints(
    _i2.Did key1,
    _i8.ServiceEndpointId key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _didServiceEndpoints.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _didServiceEndpoints.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  _i11.Future<_i10.StorageVersion> version({_i1.BlockHash? at}) async {
    final hashedKey = _version.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _version.decodeValue(bytes);
    }
    return _i10.StorageVersion.singleKey; /* Default */
  }

  /// Returns the storage key for `dids`.
  _i12.Uint8List didsKey(_i2.Did key1) {
    final hashedKey = _dids.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `didKeys`.
  _i12.Uint8List didKeysKey(
    _i2.Did key1,
    _i4.IncId key2,
  ) {
    final hashedKey = _didKeys.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `didControllers`.
  _i12.Uint8List didControllersKey(
    _i2.Did key1,
    _i6.Controller key2,
  ) {
    final hashedKey = _didControllers.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `didServiceEndpoints`.
  _i12.Uint8List didServiceEndpointsKey(
    _i2.Did key1,
    _i8.ServiceEndpointId key2,
  ) {
    final hashedKey = _didServiceEndpoints.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `version`.
  _i12.Uint8List versionKey() {
    final hashedKey = _version.hashedKey();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `dids`.
  _i12.Uint8List didsMapPrefix() {
    final hashedKey = _dids.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `didKeys`.
  _i12.Uint8List didKeysMapPrefix(_i2.Did key1) {
    final hashedKey = _didKeys.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `didControllers`.
  _i12.Uint8List didControllersMapPrefix(_i2.Did key1) {
    final hashedKey = _didControllers.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `didServiceEndpoints`.
  _i12.Uint8List didServiceEndpointsMapPrefix(_i2.Did key1) {
    final hashedKey = _didServiceEndpoints.mapPrefix(key1);
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::new_offchain`].
  _i13.RuntimeCall newOffchain({
    required _i2.Did did,
    required _i14.OffChainDidDocRef didDocRef,
  }) {
    final _call = _i15.Call.values.newOffchain(
      did: did,
      didDocRef: didDocRef,
    );
    return _i13.RuntimeCall.values.dIDModule(_call);
  }

  /// See [`Pallet::set_offchain_did_doc_ref`].
  _i13.RuntimeCall setOffchainDidDocRef({
    required _i2.Did did,
    required _i14.OffChainDidDocRef didDocRef,
  }) {
    final _call = _i15.Call.values.setOffchainDidDocRef(
      did: did,
      didDocRef: didDocRef,
    );
    return _i13.RuntimeCall.values.dIDModule(_call);
  }

  /// See [`Pallet::remove_offchain_did`].
  _i13.RuntimeCall removeOffchainDid({required _i2.Did did}) {
    final _call = _i15.Call.values.removeOffchainDid(did: did);
    return _i13.RuntimeCall.values.dIDModule(_call);
  }

  /// See [`Pallet::new_onchain`].
  _i13.RuntimeCall newOnchain({
    required _i2.Did did,
    required List<_i16.UncheckedDidKey> keys,
    required _i17.BTreeSet controllers,
  }) {
    final _call = _i15.Call.values.newOnchain(
      did: did,
      keys: keys,
      controllers: controllers,
    );
    return _i13.RuntimeCall.values.dIDModule(_call);
  }

  /// See [`Pallet::add_keys`].
  _i13.RuntimeCall addKeys({
    required _i18.AddKeys keys,
    required _i19.DidSignature sig,
  }) {
    final _call = _i15.Call.values.addKeys(
      keys: keys,
      sig: sig,
    );
    return _i13.RuntimeCall.values.dIDModule(_call);
  }

  /// See [`Pallet::remove_keys`].
  _i13.RuntimeCall removeKeys({
    required _i20.RemoveKeys keys,
    required _i19.DidSignature sig,
  }) {
    final _call = _i15.Call.values.removeKeys(
      keys: keys,
      sig: sig,
    );
    return _i13.RuntimeCall.values.dIDModule(_call);
  }

  /// See [`Pallet::add_controllers`].
  _i13.RuntimeCall addControllers({
    required _i21.AddControllers controllers,
    required _i19.DidSignature sig,
  }) {
    final _call = _i15.Call.values.addControllers(
      controllers: controllers,
      sig: sig,
    );
    return _i13.RuntimeCall.values.dIDModule(_call);
  }

  /// See [`Pallet::remove_controllers`].
  _i13.RuntimeCall removeControllers({
    required _i22.RemoveControllers controllers,
    required _i19.DidSignature sig,
  }) {
    final _call = _i15.Call.values.removeControllers(
      controllers: controllers,
      sig: sig,
    );
    return _i13.RuntimeCall.values.dIDModule(_call);
  }

  /// See [`Pallet::add_service_endpoint`].
  _i13.RuntimeCall addServiceEndpoint({
    required _i23.AddServiceEndpoint serviceEndpoint,
    required _i19.DidSignature sig,
  }) {
    final _call = _i15.Call.values.addServiceEndpoint(
      serviceEndpoint: serviceEndpoint,
      sig: sig,
    );
    return _i13.RuntimeCall.values.dIDModule(_call);
  }

  /// See [`Pallet::remove_service_endpoint`].
  _i13.RuntimeCall removeServiceEndpoint({
    required _i24.RemoveServiceEndpoint serviceEndpoint,
    required _i19.DidSignature sig,
  }) {
    final _call = _i15.Call.values.removeServiceEndpoint(
      serviceEndpoint: serviceEndpoint,
      sig: sig,
    );
    return _i13.RuntimeCall.values.dIDModule(_call);
  }

  /// See [`Pallet::remove_onchain_did`].
  _i13.RuntimeCall removeOnchainDid({
    required _i25.DidRemoval removal,
    required _i19.DidSignature sig,
  }) {
    final _call = _i15.Call.values.removeOnchainDid(
      removal: removal,
      sig: sig,
    );
    return _i13.RuntimeCall.values.dIDModule(_call);
  }

  /// See [`Pallet::noop`].
  _i13.RuntimeCall noop({
    required _i26.StateChange s,
    required _i27.AggregatedDidDetailsResponse d,
  }) {
    final _call = _i15.Call.values.noop(
      s: s,
      d: d,
    );
    return _i13.RuntimeCall.values.dIDModule(_call);
  }
}
