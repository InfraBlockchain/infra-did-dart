// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i19;
import 'dart:typed_data' as _i20;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/cumulus_pallet_parachain_system/code_upgrade_authorization.dart'
    as _i16;
import '../types/cumulus_pallet_parachain_system/pallet/call.dart' as _i23;
import '../types/cumulus_pallet_parachain_system/relay_state_snapshot/messaging_state_snapshot.dart'
    as _i10;
import '../types/cumulus_pallet_parachain_system/unincluded_segment/ancestor.dart'
    as _i2;
import '../types/cumulus_pallet_parachain_system/unincluded_segment/segment_tracker.dart'
    as _i4;
import '../types/cumulus_primitives_parachain_inherent/message_queue_chain.dart'
    as _i12;
import '../types/cumulus_primitives_parachain_inherent/parachain_inherent_data.dart'
    as _i22;
import '../types/did_runtime/runtime_call.dart' as _i21;
import '../types/infrablockchain_core_primitives/outbound_hrmp_message.dart'
    as _i14;
import '../types/parachain_primitives/primitives/id.dart' as _i13;
import '../types/primitive_types/h256.dart' as _i24;
import '../types/primitives/v6/abridged_host_configuration.dart' as _i11;
import '../types/primitives/v6/persisted_validation_data.dart' as _i5;
import '../types/primitives/v6/upgrade_go_ahead.dart' as _i8;
import '../types/primitives/v6/upgrade_restriction.dart' as _i6;
import '../types/sp_runtime/types/token/infra_system_config.dart' as _i7;
import '../types/sp_runtime/types/token/remote_asset_metadata.dart' as _i18;
import '../types/sp_runtime/types/vote/types/pot_votes.dart' as _i17;
import '../types/sp_trie/storage_proof/storage_proof.dart' as _i9;
import '../types/sp_weights/weight_v2/weight.dart' as _i15;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<List<_i2.Ancestor>> _unincludedSegment =
      const _i1.StorageValue<List<_i2.Ancestor>>(
    prefix: 'ParachainSystem',
    storage: 'UnincludedSegment',
    valueCodec: _i3.SequenceCodec<_i2.Ancestor>(_i2.Ancestor.codec),
  );

  final _i1.StorageValue<_i4.SegmentTracker> _aggregatedUnincludedSegment =
      const _i1.StorageValue<_i4.SegmentTracker>(
    prefix: 'ParachainSystem',
    storage: 'AggregatedUnincludedSegment',
    valueCodec: _i4.SegmentTracker.codec,
  );

  final _i1.StorageValue<List<int>> _pendingValidationCode =
      const _i1.StorageValue<List<int>>(
    prefix: 'ParachainSystem',
    storage: 'PendingValidationCode',
    valueCodec: _i3.U8SequenceCodec.codec,
  );

  final _i1.StorageValue<List<int>> _newValidationCode =
      const _i1.StorageValue<List<int>>(
    prefix: 'ParachainSystem',
    storage: 'NewValidationCode',
    valueCodec: _i3.U8SequenceCodec.codec,
  );

  final _i1.StorageValue<_i5.PersistedValidationData> _validationData =
      const _i1.StorageValue<_i5.PersistedValidationData>(
    prefix: 'ParachainSystem',
    storage: 'ValidationData',
    valueCodec: _i5.PersistedValidationData.codec,
  );

  final _i1.StorageValue<bool> _didSetValidationCode =
      const _i1.StorageValue<bool>(
    prefix: 'ParachainSystem',
    storage: 'DidSetValidationCode',
    valueCodec: _i3.BoolCodec.codec,
  );

  final _i1.StorageValue<int> _lastRelayChainBlockNumber =
      const _i1.StorageValue<int>(
    prefix: 'ParachainSystem',
    storage: 'LastRelayChainBlockNumber',
    valueCodec: _i3.U32Codec.codec,
  );

  final _i1.StorageValue<_i6.UpgradeRestriction?> _upgradeRestrictionSignal =
      const _i1.StorageValue<_i6.UpgradeRestriction?>(
    prefix: 'ParachainSystem',
    storage: 'UpgradeRestrictionSignal',
    valueCodec:
        _i3.OptionCodec<_i6.UpgradeRestriction>(_i6.UpgradeRestriction.codec),
  );

  final _i1.StorageValue<_i7.InfraSystemConfig?> _updatedInfraSystemConfig =
      const _i1.StorageValue<_i7.InfraSystemConfig?>(
    prefix: 'ParachainSystem',
    storage: 'UpdatedInfraSystemConfig',
    valueCodec:
        _i3.OptionCodec<_i7.InfraSystemConfig>(_i7.InfraSystemConfig.codec),
  );

  final _i1.StorageValue<_i8.UpgradeGoAhead?> _upgradeGoAhead =
      const _i1.StorageValue<_i8.UpgradeGoAhead?>(
    prefix: 'ParachainSystem',
    storage: 'UpgradeGoAhead',
    valueCodec: _i3.OptionCodec<_i8.UpgradeGoAhead>(_i8.UpgradeGoAhead.codec),
  );

  final _i1.StorageValue<_i9.StorageProof> _relayStateProof =
      const _i1.StorageValue<_i9.StorageProof>(
    prefix: 'ParachainSystem',
    storage: 'RelayStateProof',
    valueCodec: _i9.StorageProof.codec,
  );

  final _i1.StorageValue<_i10.MessagingStateSnapshot> _relevantMessagingState =
      const _i1.StorageValue<_i10.MessagingStateSnapshot>(
    prefix: 'ParachainSystem',
    storage: 'RelevantMessagingState',
    valueCodec: _i10.MessagingStateSnapshot.codec,
  );

  final _i1.StorageValue<_i11.AbridgedHostConfiguration> _hostConfiguration =
      const _i1.StorageValue<_i11.AbridgedHostConfiguration>(
    prefix: 'ParachainSystem',
    storage: 'HostConfiguration',
    valueCodec: _i11.AbridgedHostConfiguration.codec,
  );

  final _i1.StorageValue<_i12.MessageQueueChain> _lastDmqMqcHead =
      const _i1.StorageValue<_i12.MessageQueueChain>(
    prefix: 'ParachainSystem',
    storage: 'LastDmqMqcHead',
    valueCodec: _i12.MessageQueueChainCodec(),
  );

  final _i1.StorageValue<Map<_i13.Id, _i12.MessageQueueChain>>
      _lastHrmpMqcHeads =
      const _i1.StorageValue<Map<_i13.Id, _i12.MessageQueueChain>>(
    prefix: 'ParachainSystem',
    storage: 'LastHrmpMqcHeads',
    valueCodec: _i3.BTreeMapCodec<_i13.Id, _i12.MessageQueueChain>(
      keyCodec: _i13.IdCodec(),
      valueCodec: _i12.MessageQueueChainCodec(),
    ),
  );

  final _i1.StorageValue<int> _processedDownwardMessages =
      const _i1.StorageValue<int>(
    prefix: 'ParachainSystem',
    storage: 'ProcessedDownwardMessages',
    valueCodec: _i3.U32Codec.codec,
  );

  final _i1.StorageValue<int> _hrmpWatermark = const _i1.StorageValue<int>(
    prefix: 'ParachainSystem',
    storage: 'HrmpWatermark',
    valueCodec: _i3.U32Codec.codec,
  );

  final _i1.StorageValue<List<_i14.OutboundHrmpMessage>> _hrmpOutboundMessages =
      const _i1.StorageValue<List<_i14.OutboundHrmpMessage>>(
    prefix: 'ParachainSystem',
    storage: 'HrmpOutboundMessages',
    valueCodec: _i3.SequenceCodec<_i14.OutboundHrmpMessage>(
        _i14.OutboundHrmpMessage.codec),
  );

  final _i1.StorageValue<List<List<int>>> _upwardMessages =
      const _i1.StorageValue<List<List<int>>>(
    prefix: 'ParachainSystem',
    storage: 'UpwardMessages',
    valueCodec: _i3.SequenceCodec<List<int>>(_i3.U8SequenceCodec.codec),
  );

  final _i1.StorageValue<List<List<int>>> _pendingUpwardMessages =
      const _i1.StorageValue<List<List<int>>>(
    prefix: 'ParachainSystem',
    storage: 'PendingUpwardMessages',
    valueCodec: _i3.SequenceCodec<List<int>>(_i3.U8SequenceCodec.codec),
  );

  final _i1.StorageValue<int> _announcedHrmpMessagesPerCandidate =
      const _i1.StorageValue<int>(
    prefix: 'ParachainSystem',
    storage: 'AnnouncedHrmpMessagesPerCandidate',
    valueCodec: _i3.U32Codec.codec,
  );

  final _i1.StorageValue<_i15.Weight> _reservedXcmpWeightOverride =
      const _i1.StorageValue<_i15.Weight>(
    prefix: 'ParachainSystem',
    storage: 'ReservedXcmpWeightOverride',
    valueCodec: _i15.Weight.codec,
  );

  final _i1.StorageValue<_i15.Weight> _reservedDmpWeightOverride =
      const _i1.StorageValue<_i15.Weight>(
    prefix: 'ParachainSystem',
    storage: 'ReservedDmpWeightOverride',
    valueCodec: _i15.Weight.codec,
  );

  final _i1.StorageValue<_i16.CodeUpgradeAuthorization> _authorizedUpgrade =
      const _i1.StorageValue<_i16.CodeUpgradeAuthorization>(
    prefix: 'ParachainSystem',
    storage: 'AuthorizedUpgrade',
    valueCodec: _i16.CodeUpgradeAuthorization.codec,
  );

  final _i1.StorageValue<List<int>> _customValidationHeadData =
      const _i1.StorageValue<List<int>>(
    prefix: 'ParachainSystem',
    storage: 'CustomValidationHeadData',
    valueCodec: _i3.U8SequenceCodec.codec,
  );

  final _i1.StorageValue<_i17.PotVotes> _collectedPotVotes =
      const _i1.StorageValue<_i17.PotVotes>(
    prefix: 'ParachainSystem',
    storage: 'CollectedPotVotes',
    valueCodec: _i17.PotVotes.codec,
  );

  final _i1.StorageValue<_i18.RemoteAssetMetadata> _requestedAsset =
      const _i1.StorageValue<_i18.RemoteAssetMetadata>(
    prefix: 'ParachainSystem',
    storage: 'RequestedAsset',
    valueCodec: _i18.RemoteAssetMetadata.codec,
  );

  /// Latest included block descendants the runtime accepted. In other words, these are
  /// ancestors of the currently executing block which have not been included in the observed
  /// relay-chain state.
  ///
  /// The segment length is limited by the capacity returned from the [`ConsensusHook`] configured
  /// in the pallet.
  _i19.Future<List<_i2.Ancestor>> unincludedSegment({_i1.BlockHash? at}) async {
    final hashedKey = _unincludedSegment.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _unincludedSegment.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// Storage field that keeps track of bandwidth used by the unincluded segment along with the
  /// latest the latest HRMP watermark. Used for limiting the acceptance of new blocks with
  /// respect to relay chain constraints.
  _i19.Future<_i4.SegmentTracker?> aggregatedUnincludedSegment(
      {_i1.BlockHash? at}) async {
    final hashedKey = _aggregatedUnincludedSegment.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _aggregatedUnincludedSegment.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// In case of a scheduled upgrade, this storage field contains the validation code to be
  /// applied.
  ///
  /// As soon as the relay chain gives us the go-ahead signal, we will overwrite the
  /// [`:code`][sp_core::storage::well_known_keys::CODE] which will result the next block process
  /// with the new validation code. This concludes the upgrade process.
  _i19.Future<List<int>> pendingValidationCode({_i1.BlockHash? at}) async {
    final hashedKey = _pendingValidationCode.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _pendingValidationCode.decodeValue(bytes);
    }
    return List<int>.filled(
      0,
      0,
      growable: true,
    ); /* Default */
  }

  /// Validation code that is set by the parachain and is to be communicated to collator and
  /// consequently the relay-chain.
  ///
  /// This will be cleared in `on_initialize` of each new block if no other pallet already set
  /// the value.
  _i19.Future<List<int>?> newValidationCode({_i1.BlockHash? at}) async {
    final hashedKey = _newValidationCode.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _newValidationCode.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The [`PersistedValidationData`] set for this block.
  /// This value is expected to be set only once per block and it's never stored
  /// in the trie.
  _i19.Future<_i5.PersistedValidationData?> validationData(
      {_i1.BlockHash? at}) async {
    final hashedKey = _validationData.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _validationData.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Were the validation data set to notify the relay chain?
  _i19.Future<bool> didSetValidationCode({_i1.BlockHash? at}) async {
    final hashedKey = _didSetValidationCode.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _didSetValidationCode.decodeValue(bytes);
    }
    return false; /* Default */
  }

  /// The relay chain block number associated with the last parachain block.
  ///
  /// This is updated in `on_finalize`.
  _i19.Future<int> lastRelayChainBlockNumber({_i1.BlockHash? at}) async {
    final hashedKey = _lastRelayChainBlockNumber.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _lastRelayChainBlockNumber.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// An option which indicates if the relay-chain restricts signalling a validation code upgrade.
  /// In other words, if this is `Some` and [`NewValidationCode`] is `Some` then the produced
  /// candidate will be invalid.
  ///
  /// This storage item is a mirror of the corresponding value for the current parachain from the
  /// relay-chain. This value is ephemeral which means it doesn't hit the storage. This value is
  /// set after the inherent.
  _i19.Future<_i6.UpgradeRestriction?> upgradeRestrictionSignal(
      {_i1.BlockHash? at}) async {
    final hashedKey = _upgradeRestrictionSignal.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _upgradeRestrictionSignal.decodeValue(bytes);
    }
    return null; /* Default */
  }

  _i19.Future<_i7.InfraSystemConfig?> updatedInfraSystemConfig(
      {_i1.BlockHash? at}) async {
    final hashedKey = _updatedInfraSystemConfig.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _updatedInfraSystemConfig.decodeValue(bytes);
    }
    return null; /* Default */
  }

  /// Optional upgrade go-ahead signal from the relay-chain.
  ///
  /// This storage item is a mirror of the corresponding value for the current parachain from the
  /// relay-chain. This value is ephemeral which means it doesn't hit the storage. This value is
  /// set after the inherent.
  _i19.Future<_i8.UpgradeGoAhead?> upgradeGoAhead({_i1.BlockHash? at}) async {
    final hashedKey = _upgradeGoAhead.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _upgradeGoAhead.decodeValue(bytes);
    }
    return null; /* Default */
  }

  /// The state proof for the last relay parent block.
  ///
  /// This field is meant to be updated each block with the validation data inherent. Therefore,
  /// before processing of the inherent, e.g. in `on_initialize` this data may be stale.
  ///
  /// This data is also absent from the genesis.
  _i19.Future<_i9.StorageProof?> relayStateProof({_i1.BlockHash? at}) async {
    final hashedKey = _relayStateProof.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _relayStateProof.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The snapshot of some state related to messaging relevant to the current parachain as per
  /// the relay parent.
  ///
  /// This field is meant to be updated each block with the validation data inherent. Therefore,
  /// before processing of the inherent, e.g. in `on_initialize` this data may be stale.
  ///
  /// This data is also absent from the genesis.
  _i19.Future<_i10.MessagingStateSnapshot?> relevantMessagingState(
      {_i1.BlockHash? at}) async {
    final hashedKey = _relevantMessagingState.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _relevantMessagingState.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The parachain host configuration that was obtained from the relay parent.
  ///
  /// This field is meant to be updated each block with the validation data inherent. Therefore,
  /// before processing of the inherent, e.g. in `on_initialize` this data may be stale.
  ///
  /// This data is also absent from the genesis.
  _i19.Future<_i11.AbridgedHostConfiguration?> hostConfiguration(
      {_i1.BlockHash? at}) async {
    final hashedKey = _hostConfiguration.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _hostConfiguration.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The last downward message queue chain head we have observed.
  ///
  /// This value is loaded before and saved after processing inbound downward messages carried
  /// by the system inherent.
  _i19.Future<_i12.MessageQueueChain> lastDmqMqcHead(
      {_i1.BlockHash? at}) async {
    final hashedKey = _lastDmqMqcHead.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _lastDmqMqcHead.decodeValue(bytes);
    }
    return List<int>.filled(
      32,
      0,
      growable: false,
    ); /* Default */
  }

  /// The message queue chain heads we have observed per each channel incoming channel.
  ///
  /// This value is loaded before and saved after processing inbound downward messages carried
  /// by the system inherent.
  _i19.Future<Map<_i13.Id, _i12.MessageQueueChain>> lastHrmpMqcHeads(
      {_i1.BlockHash? at}) async {
    final hashedKey = _lastHrmpMqcHeads.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _lastHrmpMqcHeads.decodeValue(bytes);
    }
    return <_i13.Id, _i12.MessageQueueChain>{}; /* Default */
  }

  /// Number of downward messages processed in a block.
  ///
  /// This will be cleared in `on_initialize` of each new block.
  _i19.Future<int> processedDownwardMessages({_i1.BlockHash? at}) async {
    final hashedKey = _processedDownwardMessages.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _processedDownwardMessages.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// HRMP watermark that was set in a block.
  ///
  /// This will be cleared in `on_initialize` of each new block.
  _i19.Future<int> hrmpWatermark({_i1.BlockHash? at}) async {
    final hashedKey = _hrmpWatermark.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _hrmpWatermark.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// HRMP messages that were sent in a block.
  ///
  /// This will be cleared in `on_initialize` of each new block.
  _i19.Future<List<_i14.OutboundHrmpMessage>> hrmpOutboundMessages(
      {_i1.BlockHash? at}) async {
    final hashedKey = _hrmpOutboundMessages.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _hrmpOutboundMessages.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// Upward messages that were sent in a block.
  ///
  /// This will be cleared in `on_initialize` of each new block.
  _i19.Future<List<List<int>>> upwardMessages({_i1.BlockHash? at}) async {
    final hashedKey = _upwardMessages.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _upwardMessages.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// Upward messages that are still pending and not yet send to the relay chain.
  _i19.Future<List<List<int>>> pendingUpwardMessages(
      {_i1.BlockHash? at}) async {
    final hashedKey = _pendingUpwardMessages.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _pendingUpwardMessages.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// The number of HRMP messages we observed in `on_initialize` and thus used that number for
  /// announcing the weight of `on_initialize` and `on_finalize`.
  _i19.Future<int> announcedHrmpMessagesPerCandidate(
      {_i1.BlockHash? at}) async {
    final hashedKey = _announcedHrmpMessagesPerCandidate.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _announcedHrmpMessagesPerCandidate.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// The weight we reserve at the beginning of the block for processing XCMP messages. This
  /// overrides the amount set in the Config trait.
  _i19.Future<_i15.Weight?> reservedXcmpWeightOverride(
      {_i1.BlockHash? at}) async {
    final hashedKey = _reservedXcmpWeightOverride.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _reservedXcmpWeightOverride.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The weight we reserve at the beginning of the block for processing DMP messages. This
  /// overrides the amount set in the Config trait.
  _i19.Future<_i15.Weight?> reservedDmpWeightOverride(
      {_i1.BlockHash? at}) async {
    final hashedKey = _reservedDmpWeightOverride.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _reservedDmpWeightOverride.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The next authorized upgrade, if there is one.
  _i19.Future<_i16.CodeUpgradeAuthorization?> authorizedUpgrade(
      {_i1.BlockHash? at}) async {
    final hashedKey = _authorizedUpgrade.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _authorizedUpgrade.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// A custom head data that should be returned as result of `validate_block`.
  ///
  /// See `Pallet::set_custom_validation_head_data` for more information.
  _i19.Future<List<int>?> customValidationHeadData({_i1.BlockHash? at}) async {
    final hashedKey = _customValidationHeadData.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _customValidationHeadData.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The vote weight of a specific account for a specific asset.
  _i19.Future<_i17.PotVotes?> collectedPotVotes({_i1.BlockHash? at}) async {
    final hashedKey = _collectedPotVotes.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _collectedPotVotes.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  _i19.Future<_i18.RemoteAssetMetadata?> requestedAsset(
      {_i1.BlockHash? at}) async {
    final hashedKey = _requestedAsset.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _requestedAsset.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `unincludedSegment`.
  _i20.Uint8List unincludedSegmentKey() {
    final hashedKey = _unincludedSegment.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `aggregatedUnincludedSegment`.
  _i20.Uint8List aggregatedUnincludedSegmentKey() {
    final hashedKey = _aggregatedUnincludedSegment.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `pendingValidationCode`.
  _i20.Uint8List pendingValidationCodeKey() {
    final hashedKey = _pendingValidationCode.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `newValidationCode`.
  _i20.Uint8List newValidationCodeKey() {
    final hashedKey = _newValidationCode.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `validationData`.
  _i20.Uint8List validationDataKey() {
    final hashedKey = _validationData.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `didSetValidationCode`.
  _i20.Uint8List didSetValidationCodeKey() {
    final hashedKey = _didSetValidationCode.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `lastRelayChainBlockNumber`.
  _i20.Uint8List lastRelayChainBlockNumberKey() {
    final hashedKey = _lastRelayChainBlockNumber.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `upgradeRestrictionSignal`.
  _i20.Uint8List upgradeRestrictionSignalKey() {
    final hashedKey = _upgradeRestrictionSignal.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `updatedInfraSystemConfig`.
  _i20.Uint8List updatedInfraSystemConfigKey() {
    final hashedKey = _updatedInfraSystemConfig.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `upgradeGoAhead`.
  _i20.Uint8List upgradeGoAheadKey() {
    final hashedKey = _upgradeGoAhead.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `relayStateProof`.
  _i20.Uint8List relayStateProofKey() {
    final hashedKey = _relayStateProof.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `relevantMessagingState`.
  _i20.Uint8List relevantMessagingStateKey() {
    final hashedKey = _relevantMessagingState.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `hostConfiguration`.
  _i20.Uint8List hostConfigurationKey() {
    final hashedKey = _hostConfiguration.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `lastDmqMqcHead`.
  _i20.Uint8List lastDmqMqcHeadKey() {
    final hashedKey = _lastDmqMqcHead.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `lastHrmpMqcHeads`.
  _i20.Uint8List lastHrmpMqcHeadsKey() {
    final hashedKey = _lastHrmpMqcHeads.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `processedDownwardMessages`.
  _i20.Uint8List processedDownwardMessagesKey() {
    final hashedKey = _processedDownwardMessages.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `hrmpWatermark`.
  _i20.Uint8List hrmpWatermarkKey() {
    final hashedKey = _hrmpWatermark.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `hrmpOutboundMessages`.
  _i20.Uint8List hrmpOutboundMessagesKey() {
    final hashedKey = _hrmpOutboundMessages.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `upwardMessages`.
  _i20.Uint8List upwardMessagesKey() {
    final hashedKey = _upwardMessages.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `pendingUpwardMessages`.
  _i20.Uint8List pendingUpwardMessagesKey() {
    final hashedKey = _pendingUpwardMessages.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `announcedHrmpMessagesPerCandidate`.
  _i20.Uint8List announcedHrmpMessagesPerCandidateKey() {
    final hashedKey = _announcedHrmpMessagesPerCandidate.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `reservedXcmpWeightOverride`.
  _i20.Uint8List reservedXcmpWeightOverrideKey() {
    final hashedKey = _reservedXcmpWeightOverride.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `reservedDmpWeightOverride`.
  _i20.Uint8List reservedDmpWeightOverrideKey() {
    final hashedKey = _reservedDmpWeightOverride.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `authorizedUpgrade`.
  _i20.Uint8List authorizedUpgradeKey() {
    final hashedKey = _authorizedUpgrade.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `customValidationHeadData`.
  _i20.Uint8List customValidationHeadDataKey() {
    final hashedKey = _customValidationHeadData.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `collectedPotVotes`.
  _i20.Uint8List collectedPotVotesKey() {
    final hashedKey = _collectedPotVotes.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `requestedAsset`.
  _i20.Uint8List requestedAssetKey() {
    final hashedKey = _requestedAsset.hashedKey();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::set_validation_data`].
  _i21.RuntimeCall setValidationData(
      {required _i22.ParachainInherentData data}) {
    final _call = _i23.Call.values.setValidationData(data: data);
    return _i21.RuntimeCall.values.parachainSystem(_call);
  }

  /// See [`Pallet::sudo_send_upward_message`].
  _i21.RuntimeCall sudoSendUpwardMessage({required List<int> message}) {
    final _call = _i23.Call.values.sudoSendUpwardMessage(message: message);
    return _i21.RuntimeCall.values.parachainSystem(_call);
  }

  /// See [`Pallet::authorize_upgrade`].
  _i21.RuntimeCall authorizeUpgrade({
    required _i24.H256 codeHash,
    required bool checkVersion,
  }) {
    final _call = _i23.Call.values.authorizeUpgrade(
      codeHash: codeHash,
      checkVersion: checkVersion,
    );
    return _i21.RuntimeCall.values.parachainSystem(_call);
  }

  /// See [`Pallet::enact_authorized_upgrade`].
  _i21.RuntimeCall enactAuthorizedUpgrade({required List<int> code}) {
    final _call = _i23.Call.values.enactAuthorizedUpgrade(code: code);
    return _i21.RuntimeCall.values.parachainSystem(_call);
  }
}
