// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i6;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/did_runtime/runtime_call.dart' as _i7;
import '../types/pallet_collator_selection/pallet/call.dart' as _i8;
import '../types/pallet_collator_selection/pallet/candidate_info.dart' as _i4;
import '../types/sp_core/crypto/account_id32.dart' as _i2;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<List<_i2.AccountId32>> _invulnerables =
      const _i1.StorageValue<List<_i2.AccountId32>>(
    prefix: 'CollatorSelection',
    storage: 'Invulnerables',
    valueCodec: _i3.SequenceCodec<_i2.AccountId32>(_i2.AccountId32Codec()),
  );

  final _i1.StorageValue<List<_i4.CandidateInfo>> _candidates =
      const _i1.StorageValue<List<_i4.CandidateInfo>>(
    prefix: 'CollatorSelection',
    storage: 'Candidates',
    valueCodec: _i3.SequenceCodec<_i4.CandidateInfo>(_i4.CandidateInfo.codec),
  );

  final _i1.StorageMap<_i2.AccountId32, int> _lastAuthoredBlock =
      const _i1.StorageMap<_i2.AccountId32, int>(
    prefix: 'CollatorSelection',
    storage: 'LastAuthoredBlock',
    valueCodec: _i3.U32Codec.codec,
    hasher: _i1.StorageHasher.twoxx64Concat(_i2.AccountId32Codec()),
  );

  final _i1.StorageValue<int> _desiredCandidates = const _i1.StorageValue<int>(
    prefix: 'CollatorSelection',
    storage: 'DesiredCandidates',
    valueCodec: _i3.U32Codec.codec,
  );

  final _i1.StorageValue<BigInt> _candidacyBond =
      const _i1.StorageValue<BigInt>(
    prefix: 'CollatorSelection',
    storage: 'CandidacyBond',
    valueCodec: _i3.U128Codec.codec,
  );

  /// The invulnerable, permissioned collators. This list must be sorted.
  _i5.Future<List<_i2.AccountId32>> invulnerables({_i1.BlockHash? at}) async {
    final hashedKey = _invulnerables.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _invulnerables.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// The (community, limited) collation candidates. `Candidates` and `Invulnerables` should be
  /// mutually exclusive.
  _i5.Future<List<_i4.CandidateInfo>> candidates({_i1.BlockHash? at}) async {
    final hashedKey = _candidates.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _candidates.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// Last block authored by collator.
  _i5.Future<int> lastAuthoredBlock(
    _i2.AccountId32 key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _lastAuthoredBlock.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _lastAuthoredBlock.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// Desired number of candidates.
  ///
  /// This should ideally always be less than [`Config::MaxCandidates`] for weights to be correct.
  _i5.Future<int> desiredCandidates({_i1.BlockHash? at}) async {
    final hashedKey = _desiredCandidates.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _desiredCandidates.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// Fixed amount to deposit to become a collator.
  ///
  /// When a collator calls `leave_intent` they immediately receive the deposit back.
  _i5.Future<BigInt> candidacyBond({_i1.BlockHash? at}) async {
    final hashedKey = _candidacyBond.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _candidacyBond.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// Returns the storage key for `invulnerables`.
  _i6.Uint8List invulnerablesKey() {
    final hashedKey = _invulnerables.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `candidates`.
  _i6.Uint8List candidatesKey() {
    final hashedKey = _candidates.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `lastAuthoredBlock`.
  _i6.Uint8List lastAuthoredBlockKey(_i2.AccountId32 key1) {
    final hashedKey = _lastAuthoredBlock.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `desiredCandidates`.
  _i6.Uint8List desiredCandidatesKey() {
    final hashedKey = _desiredCandidates.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `candidacyBond`.
  _i6.Uint8List candidacyBondKey() {
    final hashedKey = _candidacyBond.hashedKey();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `lastAuthoredBlock`.
  _i6.Uint8List lastAuthoredBlockMapPrefix() {
    final hashedKey = _lastAuthoredBlock.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::set_invulnerables`].
  _i7.RuntimeCall setInvulnerables({required List<_i2.AccountId32> new_}) {
    final _call = _i8.Call.values.setInvulnerables(new_: new_);
    return _i7.RuntimeCall.values.collatorSelection(_call);
  }

  /// See [`Pallet::set_desired_candidates`].
  _i7.RuntimeCall setDesiredCandidates({required int max}) {
    final _call = _i8.Call.values.setDesiredCandidates(max: max);
    return _i7.RuntimeCall.values.collatorSelection(_call);
  }

  /// See [`Pallet::set_candidacy_bond`].
  _i7.RuntimeCall setCandidacyBond({required BigInt bond}) {
    final _call = _i8.Call.values.setCandidacyBond(bond: bond);
    return _i7.RuntimeCall.values.collatorSelection(_call);
  }

  /// See [`Pallet::register_as_candidate`].
  _i7.RuntimeCall registerAsCandidate() {
    final _call = _i8.Call.values.registerAsCandidate();
    return _i7.RuntimeCall.values.collatorSelection(_call);
  }

  /// See [`Pallet::leave_intent`].
  _i7.RuntimeCall leaveIntent() {
    final _call = _i8.Call.values.leaveIntent();
    return _i7.RuntimeCall.values.collatorSelection(_call);
  }

  /// See [`Pallet::add_invulnerable`].
  _i7.RuntimeCall addInvulnerable({required _i2.AccountId32 who}) {
    final _call = _i8.Call.values.addInvulnerable(who: who);
    return _i7.RuntimeCall.values.collatorSelection(_call);
  }

  /// See [`Pallet::remove_invulnerable`].
  _i7.RuntimeCall removeInvulnerable({required _i2.AccountId32 who}) {
    final _call = _i8.Call.values.removeInvulnerable(who: who);
    return _i7.RuntimeCall.values.collatorSelection(_call);
  }
}
