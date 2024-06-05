// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;

import 'package:polkadart/polkadart.dart' as _i1;

import '../types/did_core/modules/status_list_credential/pallet/call.dart'
    as _i7;
import '../types/did_runtime/runtime_call.dart' as _i6;
import '../types/DidSignatureWithNonce/did_signature_with_nonce.dart' as _i9;
import '../types/RemoveStatusListCredentialRaw/remove_status_list_credential_raw.dart'
    as _i10;
import '../types/StatusListCredentialId/status_list_credential_id.dart' as _i2;
import '../types/StatusListCredentialWithPolicy/status_list_credential_with_policy.dart'
    as _i3;
import '../types/UpdateStatusListCredentialRaw/update_status_list_credential_raw.dart'
    as _i8;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.StatusListCredentialId,
          _i3.StatusListCredentialWithPolicy> _statusListCredentials =
      const _i1.StorageMap<_i2.StatusListCredentialId,
          _i3.StatusListCredentialWithPolicy>(
    prefix: 'StatusListCredential',
    storage: 'StatusListCredentials',
    valueCodec: _i3.StatusListCredentialWithPolicy.codec,
    hasher:
        _i1.StorageHasher.blake2b128Concat(_i2.StatusListCredentialIdCodec()),
  );

  /// Stores `StatusListCredential`s along with their modification policies.
  /// The credential itself is represented as a raw byte sequence and can be either
  /// - [`RevocationList2020Credential`](https://w3c-ccg.github.io/vc-status-rl-2020/#revocationlist2020credential)
  /// - [`StatusList2021Credential`](https://www.w3.org/TR/vc-status-list/#statuslist2021credential)
  _i4.Future<_i3.StatusListCredentialWithPolicy?> statusListCredentials(
    _i2.StatusListCredentialId key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _statusListCredentials.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _statusListCredentials.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `statusListCredentials`.
  _i5.Uint8List statusListCredentialsKey(_i2.StatusListCredentialId key1) {
    final hashedKey = _statusListCredentials.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `statusListCredentials`.
  _i5.Uint8List statusListCredentialsMapPrefix() {
    final hashedKey = _statusListCredentials.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::create`].
  _i6.RuntimeCall create({
    required _i2.StatusListCredentialId id,
    required _i3.StatusListCredentialWithPolicy credential,
  }) {
    final _call = _i7.Call.values.create(
      id: id,
      credential: credential,
    );
    return _i6.RuntimeCall.values.statusListCredential(_call);
  }

  /// See [`Pallet::update`].
  _i6.RuntimeCall update({
    required _i8.UpdateStatusListCredentialRaw updateCredential,
    required List<_i9.DidSignatureWithNonce> proof,
  }) {
    final _call = _i7.Call.values.update(
      updateCredential: updateCredential,
      proof: proof,
    );
    return _i6.RuntimeCall.values.statusListCredential(_call);
  }

  /// See [`Pallet::remove`].
  _i6.RuntimeCall remove({
    required _i10.RemoveStatusListCredentialRaw removeCredential,
    required List<_i9.DidSignatureWithNonce> proof,
  }) {
    final _call = _i7.Call.values.remove(
      removeCredential: removeCredential,
      proof: proof,
    );
    return _i6.RuntimeCall.values.statusListCredential(_call);
  }
}
