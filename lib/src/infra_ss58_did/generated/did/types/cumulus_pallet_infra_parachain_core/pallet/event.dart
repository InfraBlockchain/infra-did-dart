// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../../sp_core/crypto/account_id32.dart' as _i4;
import '../../sp_runtime/types/fee/extrinsic_metadata.dart' as _i3;
import '../../sp_runtime/types/token/system_token_id.dart' as _i5;

/// The `Event` enum of this pallet
abstract class Event {
  const Event();

  factory Event.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EventCodec codec = $EventCodec();

  static const $Event values = $Event();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, dynamic> toJson();
}

class $Event {
  const $Event();

  Registered registered({required int assetId}) {
    return Registered(assetId: assetId);
  }

  Deregistered deregistered({required int assetId}) {
    return Deregistered(assetId: assetId);
  }

  FeeTableUpdated feeTableUpdated({
    required _i3.ExtrinsicMetadata extrinsicMetadata,
    required BigInt fee,
  }) {
    return FeeTableUpdated(
      extrinsicMetadata: extrinsicMetadata,
      fee: fee,
    );
  }

  SystemTokenWeightUpdated systemTokenWeightUpdated({required int assetId}) {
    return SystemTokenWeightUpdated(assetId: assetId);
  }

  BootstrapEnded bootstrapEnded() {
    return BootstrapEnded();
  }

  ParaCoreAdminUpdated paraCoreAdminUpdated({required _i4.AccountId32 who}) {
    return ParaCoreAdminUpdated(who: who);
  }

  RegisterRequested registerRequested({
    required int assetId,
    required int exp,
  }) {
    return RegisterRequested(
      assetId: assetId,
      exp: exp,
    );
  }

  WrappedCreated wrappedCreated({
    required int assetId,
    required _i5.SystemTokenId original,
  }) {
    return WrappedCreated(
      assetId: assetId,
      original: original,
    );
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Registered._decode(input);
      case 1:
        return Deregistered._decode(input);
      case 2:
        return FeeTableUpdated._decode(input);
      case 3:
        return SystemTokenWeightUpdated._decode(input);
      case 4:
        return const BootstrapEnded();
      case 5:
        return ParaCoreAdminUpdated._decode(input);
      case 6:
        return RegisterRequested._decode(input);
      case 7:
        return WrappedCreated._decode(input);
      default:
        throw Exception('Event: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Event value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Registered:
        (value as Registered).encodeTo(output);
        break;
      case Deregistered:
        (value as Deregistered).encodeTo(output);
        break;
      case FeeTableUpdated:
        (value as FeeTableUpdated).encodeTo(output);
        break;
      case SystemTokenWeightUpdated:
        (value as SystemTokenWeightUpdated).encodeTo(output);
        break;
      case BootstrapEnded:
        (value as BootstrapEnded).encodeTo(output);
        break;
      case ParaCoreAdminUpdated:
        (value as ParaCoreAdminUpdated).encodeTo(output);
        break;
      case RegisterRequested:
        (value as RegisterRequested).encodeTo(output);
        break;
      case WrappedCreated:
        (value as WrappedCreated).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case Registered:
        return (value as Registered)._sizeHint();
      case Deregistered:
        return (value as Deregistered)._sizeHint();
      case FeeTableUpdated:
        return (value as FeeTableUpdated)._sizeHint();
      case SystemTokenWeightUpdated:
        return (value as SystemTokenWeightUpdated)._sizeHint();
      case BootstrapEnded:
        return 1;
      case ParaCoreAdminUpdated:
        return (value as ParaCoreAdminUpdated)._sizeHint();
      case RegisterRequested:
        return (value as RegisterRequested)._sizeHint();
      case WrappedCreated:
        return (value as WrappedCreated)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// System Token has been regierested by Relay-chain governance
class Registered extends Event {
  const Registered({required this.assetId});

  factory Registered._decode(_i1.Input input) {
    return Registered(assetId: _i1.U32Codec.codec.decode(input));
  }

  /// SystemTokenAssetId
  final int assetId;

  @override
  Map<String, Map<String, int>> toJson() => {
        'Registered': {'assetId': assetId}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(assetId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      assetId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Registered && other.assetId == assetId;

  @override
  int get hashCode => assetId.hashCode;
}

/// System Token has been deregistered by Relay-chain governance
class Deregistered extends Event {
  const Deregistered({required this.assetId});

  factory Deregistered._decode(_i1.Input input) {
    return Deregistered(assetId: _i1.U32Codec.codec.decode(input));
  }

  /// SystemTokenAssetId
  final int assetId;

  @override
  Map<String, Map<String, int>> toJson() => {
        'Deregistered': {'assetId': assetId}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(assetId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      assetId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Deregistered && other.assetId == assetId;

  @override
  int get hashCode => assetId.hashCode;
}

/// Fee table for has been updated by Relay-chain governance
class FeeTableUpdated extends Event {
  const FeeTableUpdated({
    required this.extrinsicMetadata,
    required this.fee,
  });

  factory FeeTableUpdated._decode(_i1.Input input) {
    return FeeTableUpdated(
      extrinsicMetadata: _i3.ExtrinsicMetadata.codec.decode(input),
      fee: _i1.U128Codec.codec.decode(input),
    );
  }

  /// ExtrinsicMetadata
  final _i3.ExtrinsicMetadata extrinsicMetadata;

  /// SystemTokenBalance
  final BigInt fee;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'FeeTableUpdated': {
          'extrinsicMetadata': extrinsicMetadata.toJson(),
          'fee': fee,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.ExtrinsicMetadata.codec.sizeHint(extrinsicMetadata);
    size = size + _i1.U128Codec.codec.sizeHint(fee);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i3.ExtrinsicMetadata.codec.encodeTo(
      extrinsicMetadata,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      fee,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is FeeTableUpdated &&
          other.extrinsicMetadata == extrinsicMetadata &&
          other.fee == fee;

  @override
  int get hashCode => Object.hash(
        extrinsicMetadata,
        fee,
      );
}

/// Weight of System Token has been updated by Relay-chain governance
class SystemTokenWeightUpdated extends Event {
  const SystemTokenWeightUpdated({required this.assetId});

  factory SystemTokenWeightUpdated._decode(_i1.Input input) {
    return SystemTokenWeightUpdated(assetId: _i1.U32Codec.codec.decode(input));
  }

  /// SystemTokenAssetId
  final int assetId;

  @override
  Map<String, Map<String, int>> toJson() => {
        'SystemTokenWeightUpdated': {'assetId': assetId}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(assetId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      assetId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SystemTokenWeightUpdated && other.assetId == assetId;

  @override
  int get hashCode => assetId.hashCode;
}

/// Bootstrap has been ended by Relay-chain governance.
class BootstrapEnded extends Event {
  const BootstrapEnded();

  @override
  Map<String, dynamic> toJson() => {'BootstrapEnded': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is BootstrapEnded;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// Origin of this pallet has been set by Relay-chain governance.
class ParaCoreAdminUpdated extends Event {
  const ParaCoreAdminUpdated({required this.who});

  factory ParaCoreAdminUpdated._decode(_i1.Input input) {
    return ParaCoreAdminUpdated(who: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::AccountId
  final _i4.AccountId32 who;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'ParaCoreAdminUpdated': {'who': who.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i4.AccountId32Codec().sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ParaCoreAdminUpdated &&
          _i6.listsEqual(
            other.who,
            who,
          );

  @override
  int get hashCode => who.hashCode;
}

/// System Token registration has been requested
class RegisterRequested extends Event {
  const RegisterRequested({
    required this.assetId,
    required this.exp,
  });

  factory RegisterRequested._decode(_i1.Input input) {
    return RegisterRequested(
      assetId: _i1.U32Codec.codec.decode(input),
      exp: _i1.U32Codec.codec.decode(input),
    );
  }

  /// SystemTokenAssetId
  final int assetId;

  /// BlockNumberFor<T>
  final int exp;

  @override
  Map<String, Map<String, int>> toJson() => {
        'RegisterRequested': {
          'assetId': assetId,
          'exp': exp,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(assetId);
    size = size + _i1.U32Codec.codec.sizeHint(exp);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      assetId,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      exp,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RegisterRequested &&
          other.assetId == assetId &&
          other.exp == exp;

  @override
  int get hashCode => Object.hash(
        assetId,
        exp,
      );
}

/// Wrapped local asset has been created
class WrappedCreated extends Event {
  const WrappedCreated({
    required this.assetId,
    required this.original,
  });

  factory WrappedCreated._decode(_i1.Input input) {
    return WrappedCreated(
      assetId: _i1.U32Codec.codec.decode(input),
      original: _i5.SystemTokenId.codec.decode(input),
    );
  }

  /// SystemTokenAssetId
  final int assetId;

  /// SystemTokenId
  final _i5.SystemTokenId original;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'WrappedCreated': {
          'assetId': assetId,
          'original': original.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(assetId);
    size = size + _i5.SystemTokenId.codec.sizeHint(original);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      assetId,
      output,
    );
    _i5.SystemTokenId.codec.encodeTo(
      original,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WrappedCreated &&
          other.assetId == assetId &&
          other.original == original;

  @override
  int get hashCode => Object.hash(
        assetId,
        original,
      );
}
