// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../cumulus_pallet_dmp_queue/pallet/call.dart' as _i12;
import '../cumulus_pallet_infra_parachain_core/pallet/call.dart' as _i5;
import '../cumulus_pallet_parachain_system/pallet/call.dart' as _i4;
import '../cumulus_pallet_xcmp_queue/pallet/call.dart' as _i10;
import '../did_core/modules/accumulator/pallet/call.dart' as _i23;
import '../did_core/modules/anchor/pallet/call.dart' as _i21;
import '../did_core/modules/attest/pallet/call.dart' as _i22;
import '../did_core/modules/blob/pallet/call.dart' as _i20;
import '../did_core/modules/did/pallet/call.dart' as _i18;
import '../did_core/modules/offchain_signatures/pallet/call.dart' as _i24;
import '../did_core/modules/revoke/pallet/call.dart' as _i19;
import '../did_core/modules/status_list_credential/pallet/call.dart' as _i25;
import '../did_core/modules/trusted_entity/pallet/call.dart' as _i26;
import '../frame_system/pallet/call.dart' as _i3;
import '../pallet_assets/pallet/call.dart' as _i16;
import '../pallet_balances/pallet/call.dart' as _i7;
import '../pallet_collator_selection/pallet/call.dart' as _i8;
import '../pallet_multisig/pallet/call.dart' as _i14;
import '../pallet_proxy/pallet/call.dart' as _i15;
import '../pallet_session/pallet/call.dart' as _i9;
import '../pallet_sudo/pallet/call.dart' as _i27;
import '../pallet_timestamp/pallet/call.dart' as _i6;
import '../pallet_uniques/pallet/call.dart' as _i17;
import '../pallet_utility/pallet/call.dart' as _i13;
import '../pallet_xcm/pallet/call.dart' as _i11;

abstract class RuntimeCall {
  const RuntimeCall();

  factory RuntimeCall.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $RuntimeCallCodec codec = $RuntimeCallCodec();

  static const $RuntimeCall values = $RuntimeCall();

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

class $RuntimeCall {
  const $RuntimeCall();

  System system(_i3.Call value0) {
    return System(value0);
  }

  ParachainSystem parachainSystem(_i4.Call value0) {
    return ParachainSystem(value0);
  }

  InfraParaCore infraParaCore(_i5.Call value0) {
    return InfraParaCore(value0);
  }

  Timestamp timestamp(_i6.Call value0) {
    return Timestamp(value0);
  }

  Balances balances(_i7.Call value0) {
    return Balances(value0);
  }

  CollatorSelection collatorSelection(_i8.Call value0) {
    return CollatorSelection(value0);
  }

  Session session(_i9.Call value0) {
    return Session(value0);
  }

  XcmpQueue xcmpQueue(_i10.Call value0) {
    return XcmpQueue(value0);
  }

  InfraXcm infraXcm(_i11.Call value0) {
    return InfraXcm(value0);
  }

  DmpQueue dmpQueue(_i12.Call value0) {
    return DmpQueue(value0);
  }

  Utility utility(_i13.Call value0) {
    return Utility(value0);
  }

  Multisig multisig(_i14.Call value0) {
    return Multisig(value0);
  }

  Proxy proxy(_i15.Call value0) {
    return Proxy(value0);
  }

  Assets assets(_i16.Call value0) {
    return Assets(value0);
  }

  Uniques uniques(_i17.Call value0) {
    return Uniques(value0);
  }

  DIDModule dIDModule(_i18.Call value0) {
    return DIDModule(value0);
  }

  Revoke revoke(_i19.Call value0) {
    return Revoke(value0);
  }

  BlobStore blobStore(_i20.Call value0) {
    return BlobStore(value0);
  }

  Anchor anchor(_i21.Call value0) {
    return Anchor(value0);
  }

  Attest attest(_i22.Call value0) {
    return Attest(value0);
  }

  Accumulator accumulator(_i23.Call value0) {
    return Accumulator(value0);
  }

  OffchainSignatures offchainSignatures(_i24.Call value0) {
    return OffchainSignatures(value0);
  }

  StatusListCredential statusListCredential(_i25.Call value0) {
    return StatusListCredential(value0);
  }

  TrustedEntity trustedEntity(_i26.Call value0) {
    return TrustedEntity(value0);
  }

  Sudo sudo(_i27.Call value0) {
    return Sudo(value0);
  }
}

class $RuntimeCallCodec with _i1.Codec<RuntimeCall> {
  const $RuntimeCallCodec();

  @override
  RuntimeCall decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return System._decode(input);
      case 1:
        return ParachainSystem._decode(input);
      case 2:
        return InfraParaCore._decode(input);
      case 3:
        return Timestamp._decode(input);
      case 10:
        return Balances._decode(input);
      case 21:
        return CollatorSelection._decode(input);
      case 22:
        return Session._decode(input);
      case 30:
        return XcmpQueue._decode(input);
      case 31:
        return InfraXcm._decode(input);
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
      case 61:
        return DIDModule._decode(input);
      case 62:
        return Revoke._decode(input);
      case 63:
        return BlobStore._decode(input);
      case 64:
        return Anchor._decode(input);
      case 65:
        return Attest._decode(input);
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
        throw Exception('RuntimeCall: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    RuntimeCall value,
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
      case Timestamp:
        (value as Timestamp).encodeTo(output);
        break;
      case Balances:
        (value as Balances).encodeTo(output);
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
      case DIDModule:
        (value as DIDModule).encodeTo(output);
        break;
      case Revoke:
        (value as Revoke).encodeTo(output);
        break;
      case BlobStore:
        (value as BlobStore).encodeTo(output);
        break;
      case Anchor:
        (value as Anchor).encodeTo(output);
        break;
      case Attest:
        (value as Attest).encodeTo(output);
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
            'RuntimeCall: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(RuntimeCall value) {
    switch (value.runtimeType) {
      case System:
        return (value as System)._sizeHint();
      case ParachainSystem:
        return (value as ParachainSystem)._sizeHint();
      case InfraParaCore:
        return (value as InfraParaCore)._sizeHint();
      case Timestamp:
        return (value as Timestamp)._sizeHint();
      case Balances:
        return (value as Balances)._sizeHint();
      case CollatorSelection:
        return (value as CollatorSelection)._sizeHint();
      case Session:
        return (value as Session)._sizeHint();
      case XcmpQueue:
        return (value as XcmpQueue)._sizeHint();
      case InfraXcm:
        return (value as InfraXcm)._sizeHint();
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
      case DIDModule:
        return (value as DIDModule)._sizeHint();
      case Revoke:
        return (value as Revoke)._sizeHint();
      case BlobStore:
        return (value as BlobStore)._sizeHint();
      case Anchor:
        return (value as Anchor)._sizeHint();
      case Attest:
        return (value as Attest)._sizeHint();
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
            'RuntimeCall: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class System extends RuntimeCall {
  const System(this.value0);

  factory System._decode(_i1.Input input) {
    return System(_i3.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<System, Runtime>
  final _i3.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'System': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i3.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.Call.codec.encodeTo(
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

class ParachainSystem extends RuntimeCall {
  const ParachainSystem(this.value0);

  factory ParachainSystem._decode(_i1.Input input) {
    return ParachainSystem(_i4.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<ParachainSystem, Runtime>
  final _i4.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'ParachainSystem': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i4.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i4.Call.codec.encodeTo(
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

class InfraParaCore extends RuntimeCall {
  const InfraParaCore(this.value0);

  factory InfraParaCore._decode(_i1.Input input) {
    return InfraParaCore(_i5.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<InfraParaCore, Runtime>
  final _i5.Call value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'InfraParaCore': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i5.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i5.Call.codec.encodeTo(
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

class Timestamp extends RuntimeCall {
  const Timestamp(this.value0);

  factory Timestamp._decode(_i1.Input input) {
    return Timestamp(_i6.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Timestamp, Runtime>
  final _i6.Call value0;

  @override
  Map<String, Map<String, Map<String, BigInt>>> toJson() =>
      {'Timestamp': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i6.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i6.Call.codec.encodeTo(
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
      other is Timestamp && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Balances extends RuntimeCall {
  const Balances(this.value0);

  factory Balances._decode(_i1.Input input) {
    return Balances(_i7.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Balances, Runtime>
  final _i7.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Balances': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i7.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i7.Call.codec.encodeTo(
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

class CollatorSelection extends RuntimeCall {
  const CollatorSelection(this.value0);

  factory CollatorSelection._decode(_i1.Input input) {
    return CollatorSelection(_i8.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<CollatorSelection, Runtime>
  final _i8.Call value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'CollatorSelection': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i8.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      21,
      output,
    );
    _i8.Call.codec.encodeTo(
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

class Session extends RuntimeCall {
  const Session(this.value0);

  factory Session._decode(_i1.Input input) {
    return Session(_i9.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Session, Runtime>
  final _i9.Call value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'Session': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i9.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      22,
      output,
    );
    _i9.Call.codec.encodeTo(
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

class XcmpQueue extends RuntimeCall {
  const XcmpQueue(this.value0);

  factory XcmpQueue._decode(_i1.Input input) {
    return XcmpQueue(_i10.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<XcmpQueue, Runtime>
  final _i10.Call value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'XcmpQueue': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i10.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      30,
      output,
    );
    _i10.Call.codec.encodeTo(
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

class InfraXcm extends RuntimeCall {
  const InfraXcm(this.value0);

  factory InfraXcm._decode(_i1.Input input) {
    return InfraXcm(_i11.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<InfraXcm, Runtime>
  final _i11.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'InfraXcm': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i11.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      31,
      output,
    );
    _i11.Call.codec.encodeTo(
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

class DmpQueue extends RuntimeCall {
  const DmpQueue(this.value0);

  factory DmpQueue._decode(_i1.Input input) {
    return DmpQueue(_i12.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<DmpQueue, Runtime>
  final _i12.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'DmpQueue': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i12.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      33,
      output,
    );
    _i12.Call.codec.encodeTo(
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

class Utility extends RuntimeCall {
  const Utility(this.value0);

  factory Utility._decode(_i1.Input input) {
    return Utility(_i13.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Utility, Runtime>
  final _i13.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Utility': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i13.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      40,
      output,
    );
    _i13.Call.codec.encodeTo(
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

class Multisig extends RuntimeCall {
  const Multisig(this.value0);

  factory Multisig._decode(_i1.Input input) {
    return Multisig(_i14.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Multisig, Runtime>
  final _i14.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Multisig': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i14.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      41,
      output,
    );
    _i14.Call.codec.encodeTo(
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

class Proxy extends RuntimeCall {
  const Proxy(this.value0);

  factory Proxy._decode(_i1.Input input) {
    return Proxy(_i15.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Proxy, Runtime>
  final _i15.Call value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'Proxy': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i15.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      42,
      output,
    );
    _i15.Call.codec.encodeTo(
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

class Assets extends RuntimeCall {
  const Assets(this.value0);

  factory Assets._decode(_i1.Input input) {
    return Assets(_i16.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Assets, Runtime>
  final _i16.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Assets': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i16.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      50,
      output,
    );
    _i16.Call.codec.encodeTo(
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

class Uniques extends RuntimeCall {
  const Uniques(this.value0);

  factory Uniques._decode(_i1.Input input) {
    return Uniques(_i17.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Uniques, Runtime>
  final _i17.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Uniques': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i17.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      51,
      output,
    );
    _i17.Call.codec.encodeTo(
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

class DIDModule extends RuntimeCall {
  const DIDModule(this.value0);

  factory DIDModule._decode(_i1.Input input) {
    return DIDModule(_i18.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<DIDModule, Runtime>
  final _i18.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'DIDModule': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i18.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      61,
      output,
    );
    _i18.Call.codec.encodeTo(
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

class Revoke extends RuntimeCall {
  const Revoke(this.value0);

  factory Revoke._decode(_i1.Input input) {
    return Revoke(_i19.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Revoke, Runtime>
  final _i19.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Revoke': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i19.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      62,
      output,
    );
    _i19.Call.codec.encodeTo(
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

class BlobStore extends RuntimeCall {
  const BlobStore(this.value0);

  factory BlobStore._decode(_i1.Input input) {
    return BlobStore(_i20.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<BlobStore, Runtime>
  final _i20.Call value0;

  @override
  Map<String, Map<String, Map<String, Map<String, dynamic>>>> toJson() =>
      {'BlobStore': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i20.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      63,
      output,
    );
    _i20.Call.codec.encodeTo(
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
      other is BlobStore && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Anchor extends RuntimeCall {
  const Anchor(this.value0);

  factory Anchor._decode(_i1.Input input) {
    return Anchor(_i21.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Anchor, Runtime>
  final _i21.Call value0;

  @override
  Map<String, Map<String, Map<String, List<int>>>> toJson() =>
      {'Anchor': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i21.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      64,
      output,
    );
    _i21.Call.codec.encodeTo(
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

class Attest extends RuntimeCall {
  const Attest(this.value0);

  factory Attest._decode(_i1.Input input) {
    return Attest(_i22.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Attest, Runtime>
  final _i22.Call value0;

  @override
  Map<String, Map<String, Map<String, Map<String, dynamic>>>> toJson() =>
      {'Attest': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i22.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      65,
      output,
    );
    _i22.Call.codec.encodeTo(
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
      other is Attest && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Accumulator extends RuntimeCall {
  const Accumulator(this.value0);

  factory Accumulator._decode(_i1.Input input) {
    return Accumulator(_i23.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Accumulator, Runtime>
  final _i23.Call value0;

  @override
  Map<String, Map<String, Map<String, Map<String, dynamic>>>> toJson() =>
      {'Accumulator': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i23.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      66,
      output,
    );
    _i23.Call.codec.encodeTo(
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

class OffchainSignatures extends RuntimeCall {
  const OffchainSignatures(this.value0);

  factory OffchainSignatures._decode(_i1.Input input) {
    return OffchainSignatures(_i24.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<OffchainSignatures, Runtime>
  final _i24.Call value0;

  @override
  Map<String, Map<String, Map<String, Map<String, dynamic>>>> toJson() =>
      {'OffchainSignatures': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i24.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      67,
      output,
    );
    _i24.Call.codec.encodeTo(
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

class StatusListCredential extends RuntimeCall {
  const StatusListCredential(this.value0);

  factory StatusListCredential._decode(_i1.Input input) {
    return StatusListCredential(_i25.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<StatusListCredential, Runtime>
  final _i25.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'StatusListCredential': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i25.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      68,
      output,
    );
    _i25.Call.codec.encodeTo(
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

class TrustedEntity extends RuntimeCall {
  const TrustedEntity(this.value0);

  factory TrustedEntity._decode(_i1.Input input) {
    return TrustedEntity(_i26.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<TrustedEntity, Runtime>
  final _i26.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'TrustedEntity': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i26.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      69,
      output,
    );
    _i26.Call.codec.encodeTo(
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

class Sudo extends RuntimeCall {
  const Sudo(this.value0);

  factory Sudo._decode(_i1.Input input) {
    return Sudo(_i27.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Sudo, Runtime>
  final _i27.Call value0;

  @override
  Map<String, Map<String, Map<String, Map<String, dynamic>>>> toJson() =>
      {'Sudo': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i27.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      99,
      output,
    );
    _i27.Call.codec.encodeTo(
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
