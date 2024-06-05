// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i35;

import 'package:polkadart/polkadart.dart' as _i1;

import 'pallets/accumulator.dart' as _i27;
import 'pallets/anchor.dart' as _i25;
import 'pallets/asset_link.dart' as _i21;
import 'pallets/assets.dart' as _i19;
import 'pallets/attest.dart' as _i26;
import 'pallets/aura.dart' as _i12;
import 'pallets/aura_ext.dart' as _i13;
import 'pallets/authorship.dart' as _i9;
import 'pallets/balances.dart' as _i7;
import 'pallets/blob_store.dart' as _i24;
import 'pallets/collator_selection.dart' as _i10;
import 'pallets/d_i_d_module.dart' as _i22;
import 'pallets/dmp_queue.dart' as _i16;
import 'pallets/infra_para_core.dart' as _i4;
import 'pallets/infra_xcm.dart' as _i15;
import 'pallets/multisig.dart' as _i17;
import 'pallets/offchain_signatures.dart' as _i28;
import 'pallets/parachain_info.dart' as _i6;
import 'pallets/parachain_system.dart' as _i3;
import 'pallets/proxy.dart' as _i18;
import 'pallets/revoke.dart' as _i23;
import 'pallets/session.dart' as _i11;
import 'pallets/status_list_credential.dart' as _i29;
import 'pallets/sudo.dart' as _i31;
import 'pallets/system.dart' as _i2;
import 'pallets/system_token_aggregator.dart' as _i34;
import 'pallets/system_token_tx_payment.dart' as _i33;
import 'pallets/timestamp.dart' as _i5;
import 'pallets/transaction_payment.dart' as _i8;
import 'pallets/trusted_entity.dart' as _i30;
import 'pallets/uniques.dart' as _i20;
import 'pallets/utility.dart' as _i32;
import 'pallets/xcmp_queue.dart' as _i14;

class Queries {
  Queries(_i1.StateApi api)
      : system = _i2.Queries(api),
        parachainSystem = _i3.Queries(api),
        infraParaCore = _i4.Queries(api),
        timestamp = _i5.Queries(api),
        parachainInfo = _i6.Queries(api),
        balances = _i7.Queries(api),
        transactionPayment = _i8.Queries(api),
        authorship = _i9.Queries(api),
        collatorSelection = _i10.Queries(api),
        session = _i11.Queries(api),
        aura = _i12.Queries(api),
        auraExt = _i13.Queries(api),
        xcmpQueue = _i14.Queries(api),
        infraXcm = _i15.Queries(api),
        dmpQueue = _i16.Queries(api),
        multisig = _i17.Queries(api),
        proxy = _i18.Queries(api),
        assets = _i19.Queries(api),
        uniques = _i20.Queries(api),
        assetLink = _i21.Queries(api),
        dIDModule = _i22.Queries(api),
        revoke = _i23.Queries(api),
        blobStore = _i24.Queries(api),
        anchor = _i25.Queries(api),
        attest = _i26.Queries(api),
        accumulator = _i27.Queries(api),
        offchainSignatures = _i28.Queries(api),
        statusListCredential = _i29.Queries(api),
        trustedEntity = _i30.Queries(api),
        sudo = _i31.Queries(api);

  final _i2.Queries system;

  final _i3.Queries parachainSystem;

  final _i4.Queries infraParaCore;

  final _i5.Queries timestamp;

  final _i6.Queries parachainInfo;

  final _i7.Queries balances;

  final _i8.Queries transactionPayment;

  final _i9.Queries authorship;

  final _i10.Queries collatorSelection;

  final _i11.Queries session;

  final _i12.Queries aura;

  final _i13.Queries auraExt;

  final _i14.Queries xcmpQueue;

  final _i15.Queries infraXcm;

  final _i16.Queries dmpQueue;

  final _i17.Queries multisig;

  final _i18.Queries proxy;

  final _i19.Queries assets;

  final _i20.Queries uniques;

  final _i21.Queries assetLink;

  final _i22.Queries dIDModule;

  final _i23.Queries revoke;

  final _i24.Queries blobStore;

  final _i25.Queries anchor;

  final _i26.Queries attest;

  final _i27.Queries accumulator;

  final _i28.Queries offchainSignatures;

  final _i29.Queries statusListCredential;

  final _i30.Queries trustedEntity;

  final _i31.Queries sudo;
}

class Extrinsics {
  Extrinsics();

  final _i2.Txs system = _i2.Txs();

  final _i3.Txs parachainSystem = _i3.Txs();

  final _i4.Txs infraParaCore = _i4.Txs();

  final _i5.Txs timestamp = _i5.Txs();

  final _i7.Txs balances = _i7.Txs();

  final _i10.Txs collatorSelection = _i10.Txs();

  final _i11.Txs session = _i11.Txs();

  final _i14.Txs xcmpQueue = _i14.Txs();

  final _i15.Txs infraXcm = _i15.Txs();

  final _i16.Txs dmpQueue = _i16.Txs();

  final _i32.Txs utility = _i32.Txs();

  final _i17.Txs multisig = _i17.Txs();

  final _i18.Txs proxy = _i18.Txs();

  final _i19.Txs assets = _i19.Txs();

  final _i20.Txs uniques = _i20.Txs();

  final _i22.Txs dIDModule = _i22.Txs();

  final _i23.Txs revoke = _i23.Txs();

  final _i24.Txs blobStore = _i24.Txs();

  final _i25.Txs anchor = _i25.Txs();

  final _i26.Txs attest = _i26.Txs();

  final _i27.Txs accumulator = _i27.Txs();

  final _i28.Txs offchainSignatures = _i28.Txs();

  final _i29.Txs statusListCredential = _i29.Txs();

  final _i30.Txs trustedEntity = _i30.Txs();

  final _i31.Txs sudo = _i31.Txs();
}

class Constants {
  Constants();

  final _i2.Constants system = _i2.Constants();

  final _i4.Constants infraParaCore = _i4.Constants();

  final _i5.Constants timestamp = _i5.Constants();

  final _i7.Constants balances = _i7.Constants();

  final _i8.Constants transactionPayment = _i8.Constants();

  final _i33.Constants systemTokenTxPayment = _i33.Constants();

  final _i32.Constants utility = _i32.Constants();

  final _i17.Constants multisig = _i17.Constants();

  final _i18.Constants proxy = _i18.Constants();

  final _i19.Constants assets = _i19.Constants();

  final _i20.Constants uniques = _i20.Constants();

  final _i34.Constants systemTokenAggregator = _i34.Constants();
}

class Rpc {
  const Rpc({
    required this.state,
    required this.system,
  });

  final _i1.StateApi state;

  final _i1.SystemApi system;
}

class Registry {
  Registry();

  final int extrinsicVersion = 4;

  List getSignedExtensionTypes() {
    return ['CheckMortality', 'CheckNonce', 'ChargeSystemToken'];
  }

  List getSignedExtensionExtra() {
    return [
      'CheckSpecVersion',
      'CheckTxVersion',
      'CheckGenesis',
      'CheckMortality'
    ];
  }
}

class Did {
  Did._(
    this._provider,
    this.rpc,
  )   : query = Queries(rpc.state),
        constant = Constants(),
        tx = Extrinsics(),
        registry = Registry();

  factory Did(_i1.Provider provider) {
    final rpc = Rpc(
      state: _i1.StateApi(provider),
      system: _i1.SystemApi(provider),
    );
    return Did._(
      provider,
      rpc,
    );
  }

  factory Did.url(Uri url) {
    final provider = _i1.Provider.fromUri(url);
    return Did(provider);
  }

  final _i1.Provider _provider;

  final Queries query;

  final Constants constant;

  final Rpc rpc;

  final Extrinsics tx;

  final Registry registry;

  _i35.Future connect() async {
    return await _provider.connect();
  }

  _i35.Future disconnect() async {
    return await _provider.disconnect();
  }
}
