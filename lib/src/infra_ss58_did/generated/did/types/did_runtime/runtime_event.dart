// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../cumulus_pallet_dmp_queue/pallet/event.dart' as _i14;
import '../cumulus_pallet_infra_parachain_core/pallet/event.dart' as _i5;
import '../cumulus_pallet_parachain_system/pallet/event.dart' as _i4;
import '../cumulus_pallet_xcm/pallet/event.dart' as _i13;
import '../cumulus_pallet_xcmp_queue/pallet/event.dart' as _i11;
import '../did_core/modules/accumulator/pallet/event.dart' as _i25;
import '../did_core/modules/anchor/pallet/event.dart' as _i24;
import '../did_core/modules/did/pallet/event.dart' as _i22;
import '../did_core/modules/offchain_signatures/pallet/event.dart' as _i26;
import '../did_core/modules/revoke/pallet/event.dart' as _i23;
import '../did_core/modules/status_list_credential/pallet/event.dart' as _i27;
import '../did_core/modules/trusted_entity/pallet/event.dart' as _i28;
import '../frame_system/pallet/event.dart' as _i3;
import '../infra_asset_link/pallet/event.dart' as _i20;
import '../pallet_assets/pallet/event.dart' as _i18;
import '../pallet_balances/pallet/event.dart' as _i6;
import '../pallet_collator_selection/pallet/event.dart' as _i9;
import '../pallet_multisig/pallet/event.dart' as _i16;
import '../pallet_proxy/pallet/event.dart' as _i17;
import '../pallet_session/pallet/event.dart' as _i10;
import '../pallet_sudo/pallet/event.dart' as _i29;
import '../pallet_system_token_tx_payment/pallet/event.dart' as _i8;
import '../pallet_transaction_payment/pallet/event.dart' as _i7;
import '../pallet_uniques/pallet/event.dart' as _i19;
import '../pallet_utility/pallet/event.dart' as _i15;
import '../pallet_xcm/pallet/event.dart' as _i12;
import '../runtime_parachains/system_token_aggregator/pallet/event.dart'
    as _i21;

abstract class RuntimeEvent {
  const RuntimeEvent();

  factory RuntimeEvent.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $RuntimeEventCodec codec = $RuntimeEventCodec();

  static const $RuntimeEvent values = $RuntimeEvent();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, dynamic>> toJson();
}

class $RuntimeEvent {
  const $RuntimeEvent();

  System system(_i3.Event value0) {
    return System(value0);
  }

  ParachainSystem parachainSystem(_i4.Event value0) {
    return ParachainSystem(value0);
  }

  InfraParaCore infraParaCore(_i5.Event value0) {
    return InfraParaCore(value0);
  }

  Balances balances(_i6.Event value0) {
    return Balances(value0);
  }

  TransactionPayment transactionPayment(_i7.Event value0) {
    return TransactionPayment(value0);
  }

  SystemTokenTxPayment systemTokenTxPayment(_i8.Event value0) {
    return SystemTokenTxPayment(value0);
  }

  CollatorSelection collatorSelection(_i9.Event value0) {
    return CollatorSelection(value0);
  }

  Session session(_i10.Event value0) {
    return Session(value0);
  }

  XcmpQueue xcmpQueue(_i11.Event value0) {
    return XcmpQueue(value0);
  }

  InfraXcm infraXcm(_i12.Event value0) {
    return InfraXcm(value0);
  }

  CumulusXcm cumulusXcm(_i13.Event value0) {
    return CumulusXcm(value0);
  }

  DmpQueue dmpQueue(_i14.Event value0) {
    return DmpQueue(value0);
  }

  Utility utility(_i15.Event value0) {
    return Utility(value0);
  }

  Multisig multisig(_i16.Event value0) {
    return Multisig(value0);
  }

  Proxy proxy(_i17.Event value0) {
    return Proxy(value0);
  }

  Assets assets(_i18.Event value0) {
    return Assets(value0);
  }

  Uniques uniques(_i19.Event value0) {
    return Uniques(value0);
  }

  AssetLink assetLink(_i20.Event value0) {
    return AssetLink(value0);
  }

  SystemTokenAggregator systemTokenAggregator(_i21.Event value0) {
    return SystemTokenAggregator(value0);
  }

  DIDModule dIDModule(_i22.Event value0) {
    return DIDModule(value0);
  }

  Revoke revoke(_i23.Event value0) {
    return Revoke(value0);
  }

  Anchor anchor(_i24.Event value0) {
    return Anchor(value0);
  }

  Accumulator accumulator(_i25.Event value0) {
    return Accumulator(value0);
  }

  OffchainSignatures offchainSignatures(_i26.Event value0) {
    return OffchainSignatures(value0);
  }

  StatusListCredential statusListCredential(_i27.Event value0) {
    return StatusListCredential(value0);
  }

  TrustedEntity trustedEntity(_i28.Event value0) {
    return TrustedEntity(value0);
  }

  Sudo sudo(_i29.Event value0) {
    return Sudo(value0);
  }
}

class $RuntimeEventCodec with _i1.Codec<RuntimeEvent> {
  const $RuntimeEventCodec();

  @override
  RuntimeEvent decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return System._decode(input);
      case 1:
        return ParachainSystem._decode(input);
      case 2:
        return InfraParaCore._decode(input);
      case 10:
        return Balances._decode(input);
      case 11:
        return TransactionPayment._decode(input);
      case 12:
        return SystemTokenTxPayment._decode(input);
      case 21:
        return CollatorSelection._decode(input);
      case 22:
        return Session._decode(input);
      case 30:
        return XcmpQueue._decode(input);
      case 31:
        return InfraXcm._decode(input);
      case 32:
        return CumulusXcm._decode(input);
      case 33:
        return DmpQueue._decode(input);
      case 40:
        return Utility._decode(input);
      case 41:
        return Multisig._decode(input);
      case 42:
        return Proxy._decode(input);
      case 50:
        return Assets._decode(input);
      case 51:
        return Uniques._decode(input);
      case 52:
        return AssetLink._decode(input);
      case 53:
        return SystemTokenAggregator._decode(input);
      case 61:
        return DIDModule._decode(input);
      case 62:
        return Revoke._decode(input);
      case 64:
        return Anchor._decode(input);
      case 66:
        return Accumulator._decode(input);
      case 67:
        return OffchainSignatures._decode(input);
      case 68:
        return StatusListCredential._decode(input);
      case 69:
        return TrustedEntity._decode(input);
      case 99:
        return Sudo._decode(input);
      default:
        throw Exception('RuntimeEvent: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    RuntimeEvent value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case System:
        (value as System).encodeTo(output);
        break;
      case ParachainSystem:
        (value as ParachainSystem).encodeTo(output);
        break;
      case InfraParaCore:
        (value as InfraParaCore).encodeTo(output);
        break;
      case Balances:
        (value as Balances).encodeTo(output);
        break;
      case TransactionPayment:
        (value as TransactionPayment).encodeTo(output);
        break;
      case SystemTokenTxPayment:
        (value as SystemTokenTxPayment).encodeTo(output);
        break;
      case CollatorSelection:
        (value as CollatorSelection).encodeTo(output);
        break;
      case Session:
        (value as Session).encodeTo(output);
        break;
      case XcmpQueue:
        (value as XcmpQueue).encodeTo(output);
        break;
      case InfraXcm:
        (value as InfraXcm).encodeTo(output);
        break;
      case CumulusXcm:
        (value as CumulusXcm).encodeTo(output);
        break;
      case DmpQueue:
        (value as DmpQueue).encodeTo(output);
        break;
      case Utility:
        (value as Utility).encodeTo(output);
        break;
      case Multisig:
        (value as Multisig).encodeTo(output);
        break;
      case Proxy:
        (value as Proxy).encodeTo(output);
        break;
      case Assets:
        (value as Assets).encodeTo(output);
        break;
      case Uniques:
        (value as Uniques).encodeTo(output);
        break;
      case AssetLink:
        (value as AssetLink).encodeTo(output);
        break;
      case SystemTokenAggregator:
        (value as SystemTokenAggregator).encodeTo(output);
        break;
      case DIDModule:
        (value as DIDModule).encodeTo(output);
        break;
      case Revoke:
        (value as Revoke).encodeTo(output);
        break;
      case Anchor:
        (value as Anchor).encodeTo(output);
        break;
      case Accumulator:
        (value as Accumulator).encodeTo(output);
        break;
      case OffchainSignatures:
        (value as OffchainSignatures).encodeTo(output);
        break;
      case StatusListCredential:
        (value as StatusListCredential).encodeTo(output);
        break;
      case TrustedEntity:
        (value as TrustedEntity).encodeTo(output);
        break;
      case Sudo:
        (value as Sudo).encodeTo(output);
        break;
      default:
        throw Exception(
            'RuntimeEvent: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(RuntimeEvent value) {
    switch (value.runtimeType) {
      case System:
        return (value as System)._sizeHint();
      case ParachainSystem:
        return (value as ParachainSystem)._sizeHint();
      case InfraParaCore:
        return (value as InfraParaCore)._sizeHint();
      case Balances:
        return (value as Balances)._sizeHint();
      case TransactionPayment:
        return (value as TransactionPayment)._sizeHint();
      case SystemTokenTxPayment:
        return (value as SystemTokenTxPayment)._sizeHint();
      case CollatorSelection:
        return (value as CollatorSelection)._sizeHint();
      case Session:
        return (value as Session)._sizeHint();
      case XcmpQueue:
        return (value as XcmpQueue)._sizeHint();
      case InfraXcm:
        return (value as InfraXcm)._sizeHint();
      case CumulusXcm:
        return (value as CumulusXcm)._sizeHint();
      case DmpQueue:
        return (value as DmpQueue)._sizeHint();
      case Utility:
        return (value as Utility)._sizeHint();
      case Multisig:
        return (value as Multisig)._sizeHint();
      case Proxy:
        return (value as Proxy)._sizeHint();
      case Assets:
        return (value as Assets)._sizeHint();
      case Uniques:
        return (value as Uniques)._sizeHint();
      case AssetLink:
        return (value as AssetLink)._sizeHint();
      case SystemTokenAggregator:
        return (value as SystemTokenAggregator)._sizeHint();
      case DIDModule:
        return (value as DIDModule)._sizeHint();
      case Revoke:
        return (value as Revoke)._sizeHint();
      case Anchor:
        return (value as Anchor)._sizeHint();
      case Accumulator:
        return (value as Accumulator)._sizeHint();
      case OffchainSignatures:
        return (value as OffchainSignatures)._sizeHint();
      case StatusListCredential:
        return (value as StatusListCredential)._sizeHint();
      case TrustedEntity:
        return (value as TrustedEntity)._sizeHint();
      case Sudo:
        return (value as Sudo)._sizeHint();
      default:
        throw Exception(
            'RuntimeEvent: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class System extends RuntimeEvent {
  const System(this.value0);

  factory System._decode(_i1.Input input) {
    return System(_i3.Event.codec.decode(input));
  }

  /// frame_system::Event<Runtime>
  final _i3.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'System': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i3.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is System && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class ParachainSystem extends RuntimeEvent {
  const ParachainSystem(this.value0);

  factory ParachainSystem._decode(_i1.Input input) {
    return ParachainSystem(_i4.Event.codec.decode(input));
  }

  /// cumulus_pallet_parachain_system::Event<Runtime>
  final _i4.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'ParachainSystem': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i4.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i4.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ParachainSystem && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class InfraParaCore extends RuntimeEvent {
  const InfraParaCore(this.value0);

  factory InfraParaCore._decode(_i1.Input input) {
    return InfraParaCore(_i5.Event.codec.decode(input));
  }

  /// cumulus_pallet_infra_parachain_core::Event<Runtime>
  final _i5.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'InfraParaCore': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i5.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i5.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is InfraParaCore && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Balances extends RuntimeEvent {
  const Balances(this.value0);

  factory Balances._decode(_i1.Input input) {
    return Balances(_i6.Event.codec.decode(input));
  }

  /// pallet_balances::Event<Runtime>
  final _i6.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Balances': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i6.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i6.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Balances && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class TransactionPayment extends RuntimeEvent {
  const TransactionPayment(this.value0);

  factory TransactionPayment._decode(_i1.Input input) {
    return TransactionPayment(_i7.Event.codec.decode(input));
  }

  /// pallet_transaction_payment::Event<Runtime>
  final _i7.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'TransactionPayment': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i7.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    _i7.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TransactionPayment && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class SystemTokenTxPayment extends RuntimeEvent {
  const SystemTokenTxPayment(this.value0);

  factory SystemTokenTxPayment._decode(_i1.Input input) {
    return SystemTokenTxPayment(_i8.Event.codec.decode(input));
  }

  /// pallet_system_token_tx_payment::Event<Runtime>
  final _i8.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'SystemTokenTxPayment': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i8.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      12,
      output,
    );
    _i8.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SystemTokenTxPayment && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class CollatorSelection extends RuntimeEvent {
  const CollatorSelection(this.value0);

  factory CollatorSelection._decode(_i1.Input input) {
    return CollatorSelection(_i9.Event.codec.decode(input));
  }

  /// pallet_collator_selection::Event<Runtime>
  final _i9.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'CollatorSelection': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i9.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      21,
      output,
    );
    _i9.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CollatorSelection && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Session extends RuntimeEvent {
  const Session(this.value0);

  factory Session._decode(_i1.Input input) {
    return Session(_i10.Event.codec.decode(input));
  }

  /// pallet_session::Event
  final _i10.Event value0;

  @override
  Map<String, Map<String, Map<String, int>>> toJson() =>
      {'Session': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i10.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      22,
      output,
    );
    _i10.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Session && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class XcmpQueue extends RuntimeEvent {
  const XcmpQueue(this.value0);

  factory XcmpQueue._decode(_i1.Input input) {
    return XcmpQueue(_i11.Event.codec.decode(input));
  }

  /// cumulus_pallet_xcmp_queue::Event<Runtime>
  final _i11.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'XcmpQueue': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i11.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      30,
      output,
    );
    _i11.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is XcmpQueue && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class InfraXcm extends RuntimeEvent {
  const InfraXcm(this.value0);

  factory InfraXcm._decode(_i1.Input input) {
    return InfraXcm(_i12.Event.codec.decode(input));
  }

  /// pallet_xcm::Event<Runtime>
  final _i12.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'InfraXcm': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i12.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      31,
      output,
    );
    _i12.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is InfraXcm && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class CumulusXcm extends RuntimeEvent {
  const CumulusXcm(this.value0);

  factory CumulusXcm._decode(_i1.Input input) {
    return CumulusXcm(_i13.Event.codec.decode(input));
  }

  /// cumulus_pallet_xcm::Event<Runtime>
  final _i13.Event value0;

  @override
  Map<String, Map<String, List<dynamic>>> toJson() =>
      {'CumulusXcm': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i13.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      32,
      output,
    );
    _i13.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CumulusXcm && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class DmpQueue extends RuntimeEvent {
  const DmpQueue(this.value0);

  factory DmpQueue._decode(_i1.Input input) {
    return DmpQueue(_i14.Event.codec.decode(input));
  }

  /// cumulus_pallet_dmp_queue::Event<Runtime>
  final _i14.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'DmpQueue': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i14.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      33,
      output,
    );
    _i14.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DmpQueue && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Utility extends RuntimeEvent {
  const Utility(this.value0);

  factory Utility._decode(_i1.Input input) {
    return Utility(_i15.Event.codec.decode(input));
  }

  /// pallet_utility::Event
  final _i15.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'Utility': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i15.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      40,
      output,
    );
    _i15.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Utility && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Multisig extends RuntimeEvent {
  const Multisig(this.value0);

  factory Multisig._decode(_i1.Input input) {
    return Multisig(_i16.Event.codec.decode(input));
  }

  /// pallet_multisig::Event<Runtime>
  final _i16.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Multisig': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i16.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      41,
      output,
    );
    _i16.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Multisig && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Proxy extends RuntimeEvent {
  const Proxy(this.value0);

  factory Proxy._decode(_i1.Input input) {
    return Proxy(_i17.Event.codec.decode(input));
  }

  /// pallet_proxy::Event<Runtime>
  final _i17.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Proxy': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i17.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      42,
      output,
    );
    _i17.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Proxy && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Assets extends RuntimeEvent {
  const Assets(this.value0);

  factory Assets._decode(_i1.Input input) {
    return Assets(_i18.Event.codec.decode(input));
  }

  /// pallet_assets::Event<Runtime>
  final _i18.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Assets': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i18.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      50,
      output,
    );
    _i18.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Assets && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Uniques extends RuntimeEvent {
  const Uniques(this.value0);

  factory Uniques._decode(_i1.Input input) {
    return Uniques(_i19.Event.codec.decode(input));
  }

  /// pallet_uniques::Event<Runtime>
  final _i19.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Uniques': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i19.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      51,
      output,
    );
    _i19.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Uniques && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class AssetLink extends RuntimeEvent {
  const AssetLink(this.value0);

  factory AssetLink._decode(_i1.Input input) {
    return AssetLink(_i20.Event.codec.decode(input));
  }

  /// pallet_asset_link::Event<Runtime>
  final _i20.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'AssetLink': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i20.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      52,
      output,
    );
    _i20.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AssetLink && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class SystemTokenAggregator extends RuntimeEvent {
  const SystemTokenAggregator(this.value0);

  factory SystemTokenAggregator._decode(_i1.Input input) {
    return SystemTokenAggregator(_i21.Event.codec.decode(input));
  }

  /// system_token_aggregator::Event<Runtime>
  final _i21.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'SystemTokenAggregator': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i21.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      53,
      output,
    );
    _i21.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SystemTokenAggregator && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class DIDModule extends RuntimeEvent {
  const DIDModule(this.value0);

  factory DIDModule._decode(_i1.Input input) {
    return DIDModule(_i22.Event.codec.decode(input));
  }

  /// did::Event<Runtime>
  final _i22.Event value0;

  @override
  Map<String, Map<String, List<dynamic>>> toJson() =>
      {'DIDModule': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i22.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      61,
      output,
    );
    _i22.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DIDModule && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Revoke extends RuntimeEvent {
  const Revoke(this.value0);

  factory Revoke._decode(_i1.Input input) {
    return Revoke(_i23.Event.codec.decode(input));
  }

  /// revoke::Event
  final _i23.Event value0;

  @override
  Map<String, Map<String, List<int>>> toJson() => {'Revoke': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i23.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      62,
      output,
    );
    _i23.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Revoke && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Anchor extends RuntimeEvent {
  const Anchor(this.value0);

  factory Anchor._decode(_i1.Input input) {
    return Anchor(_i24.Event.codec.decode(input));
  }

  /// anchor::Event<Runtime>
  final _i24.Event value0;

  @override
  Map<String, Map<String, List<List<int>>>> toJson() =>
      {'Anchor': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i24.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      64,
      output,
    );
    _i24.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Anchor && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Accumulator extends RuntimeEvent {
  const Accumulator(this.value0);

  factory Accumulator._decode(_i1.Input input) {
    return Accumulator(_i25.Event.codec.decode(input));
  }

  /// accumulator::Event
  final _i25.Event value0;

  @override
  Map<String, Map<String, List<dynamic>>> toJson() =>
      {'Accumulator': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i25.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      66,
      output,
    );
    _i25.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Accumulator && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class OffchainSignatures extends RuntimeEvent {
  const OffchainSignatures(this.value0);

  factory OffchainSignatures._decode(_i1.Input input) {
    return OffchainSignatures(_i26.Event.codec.decode(input));
  }

  /// offchain_signatures::Event
  final _i26.Event value0;

  @override
  Map<String, Map<String, List<dynamic>>> toJson() =>
      {'OffchainSignatures': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i26.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      67,
      output,
    );
    _i26.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is OffchainSignatures && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class StatusListCredential extends RuntimeEvent {
  const StatusListCredential(this.value0);

  factory StatusListCredential._decode(_i1.Input input) {
    return StatusListCredential(_i27.Event.codec.decode(input));
  }

  /// status_list_credential::Event
  final _i27.Event value0;

  @override
  Map<String, Map<String, List<int>>> toJson() =>
      {'StatusListCredential': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i27.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      68,
      output,
    );
    _i27.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is StatusListCredential && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class TrustedEntity extends RuntimeEvent {
  const TrustedEntity(this.value0);

  factory TrustedEntity._decode(_i1.Input input) {
    return TrustedEntity(_i28.Event.codec.decode(input));
  }

  /// trusted_entity::Event
  final _i28.Event value0;

  @override
  Map<String, Map<String, List<int>>> toJson() =>
      {'TrustedEntity': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i28.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      69,
      output,
    );
    _i28.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TrustedEntity && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Sudo extends RuntimeEvent {
  const Sudo(this.value0);

  factory Sudo._decode(_i1.Input input) {
    return Sudo(_i29.Event.codec.decode(input));
  }

  /// pallet_sudo::Event<Runtime>
  final _i29.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Sudo': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i29.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      99,
      output,
    );
    _i29.Event.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Sudo && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}
