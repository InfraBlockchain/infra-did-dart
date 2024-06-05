// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;

import 'package:polkadart/polkadart.dart' as _i1;

import '../types/Attestation/attestation.dart' as _i3;
import '../types/Attester/attester.dart' as _i2;
import '../types/did_core/modules/attest/pallet/call.dart' as _i9;
import '../types/did_runtime/runtime_call.dart' as _i6;
import '../types/DidSignature/did_signature_4.dart' as _i8;
import '../types/SetAttestationClaim/set_attestation_claim.dart' as _i7;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.Attester, _i3.Attestation> _attestations =
      const _i1.StorageMap<_i2.Attester, _i3.Attestation>(
    prefix: 'Attest',
    storage: 'Attestations',
    valueCodec: _i3.Attestation.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i2.AttesterCodec()),
  );

  /// The priority value provides replay protection and also gives attestations a partial
  /// ordering. Signatures with lesser or equal priority to those previously posted by the same
  /// entity are not accepted by the chain.
  ///
  /// Notice that priority is not a block-number. This is intentional as it yields some desired
  /// properties and allows some potential use-cases:
  ///   - When publishing consecutive attestations, the attester need not care at which block a a
  ///     previous attestation was included. This means attestations can be made over a
  ///     mono-directional channel.
  ///   - Timestamps may be used as priority when available.
  ///   - A timeline of future attestations may be constructed by encrypting multiple signatures,
  ///     each with the output of a verifiable delay function. A "final" attestation may be
  ///     selected by assigning it the highest priority in the batch. The "final" attestation will
  ///     be acceptable by the runtime regardless of whether its predecessors were submitted.
  ///
  /// An attestation on chain with iri set to None is semantically meaningless. Setting the
  /// iri to None is equivalent to attesting to the empty claimgraph.
  ///
  /// When Attestations::get(did).iri == Some(dat) and dat is a valid utf-8 Iri:
  /// `[did dock:attestsDocumentContents dat]`.
  _i4.Future<_i3.Attestation> attestations(
    _i2.Attester key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _attestations.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _attestations.decodeValue(bytes);
    }
    return _i3.Attestation(
      priority: BigInt.zero,
      iri: null,
    ); /* Default */
  }

  /// Returns the storage key for `attestations`.
  _i5.Uint8List attestationsKey(_i2.Attester key1) {
    final hashedKey = _attestations.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `attestations`.
  _i5.Uint8List attestationsMapPrefix() {
    final hashedKey = _attestations.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::set_claim`].
  _i6.RuntimeCall setClaim({
    required _i7.SetAttestationClaim attests,
    required _i8.DidSignature signature,
  }) {
    final _call = _i9.Call.values.setClaim(
      attests: attests,
      signature: signature,
    );
    return _i6.RuntimeCall.values.attest(_call);
  }
}
