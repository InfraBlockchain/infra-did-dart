// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../../did_runtime/runtime_call.dart' as _i4;
import '../../sp_core/crypto/account_id32.dart' as _i3;
import '../../sp_weights/weight_v2/weight.dart' as _i6;
import '../timepoint.dart' as _i5;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

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

class $Call {
  const $Call();

  AsMultiThreshold1 asMultiThreshold1({
    required List<_i3.AccountId32> otherSignatories,
    required _i4.RuntimeCall call,
  }) {
    return AsMultiThreshold1(
      otherSignatories: otherSignatories,
      call: call,
    );
  }

  AsMulti asMulti({
    required int threshold,
    required List<_i3.AccountId32> otherSignatories,
    _i5.Timepoint? maybeTimepoint,
    required _i4.RuntimeCall call,
    required _i6.Weight maxWeight,
  }) {
    return AsMulti(
      threshold: threshold,
      otherSignatories: otherSignatories,
      maybeTimepoint: maybeTimepoint,
      call: call,
      maxWeight: maxWeight,
    );
  }

  ApproveAsMulti approveAsMulti({
    required int threshold,
    required List<_i3.AccountId32> otherSignatories,
    _i5.Timepoint? maybeTimepoint,
    required List<int> callHash,
    required _i6.Weight maxWeight,
  }) {
    return ApproveAsMulti(
      threshold: threshold,
      otherSignatories: otherSignatories,
      maybeTimepoint: maybeTimepoint,
      callHash: callHash,
      maxWeight: maxWeight,
    );
  }

  CancelAsMulti cancelAsMulti({
    required int threshold,
    required List<_i3.AccountId32> otherSignatories,
    required _i5.Timepoint timepoint,
    required List<int> callHash,
  }) {
    return CancelAsMulti(
      threshold: threshold,
      otherSignatories: otherSignatories,
      timepoint: timepoint,
      callHash: callHash,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return AsMultiThreshold1._decode(input);
      case 1:
        return AsMulti._decode(input);
      case 2:
        return ApproveAsMulti._decode(input);
      case 3:
        return CancelAsMulti._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case AsMultiThreshold1:
        (value as AsMultiThreshold1).encodeTo(output);
        break;
      case AsMulti:
        (value as AsMulti).encodeTo(output);
        break;
      case ApproveAsMulti:
        (value as ApproveAsMulti).encodeTo(output);
        break;
      case CancelAsMulti:
        (value as CancelAsMulti).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case AsMultiThreshold1:
        return (value as AsMultiThreshold1)._sizeHint();
      case AsMulti:
        return (value as AsMulti)._sizeHint();
      case ApproveAsMulti:
        return (value as ApproveAsMulti)._sizeHint();
      case CancelAsMulti:
        return (value as CancelAsMulti)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::as_multi_threshold_1`].
class AsMultiThreshold1 extends Call {
  const AsMultiThreshold1({
    required this.otherSignatories,
    required this.call,
  });

  factory AsMultiThreshold1._decode(_i1.Input input) {
    return AsMultiThreshold1(
      otherSignatories:
          const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
              .decode(input),
      call: _i4.RuntimeCall.codec.decode(input),
    );
  }

  /// Vec<T::AccountId>
  final List<_i3.AccountId32> otherSignatories;

  /// Box<<T as Config>::RuntimeCall>
  final _i4.RuntimeCall call;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'as_multi_threshold_1': {
          'otherSignatories':
              otherSignatories.map((value) => value.toList()).toList(),
          'call': call.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
            .sizeHint(otherSignatories);
    size = size + _i4.RuntimeCall.codec.sizeHint(call);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()).encodeTo(
      otherSignatories,
      output,
    );
    _i4.RuntimeCall.codec.encodeTo(
      call,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AsMultiThreshold1 &&
          _i7.listsEqual(
            other.otherSignatories,
            otherSignatories,
          ) &&
          other.call == call;

  @override
  int get hashCode => Object.hash(
        otherSignatories,
        call,
      );
}

/// See [`Pallet::as_multi`].
class AsMulti extends Call {
  const AsMulti({
    required this.threshold,
    required this.otherSignatories,
    this.maybeTimepoint,
    required this.call,
    required this.maxWeight,
  });

  factory AsMulti._decode(_i1.Input input) {
    return AsMulti(
      threshold: _i1.U16Codec.codec.decode(input),
      otherSignatories:
          const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
              .decode(input),
      maybeTimepoint: const _i1.OptionCodec<_i5.Timepoint>(_i5.Timepoint.codec)
          .decode(input),
      call: _i4.RuntimeCall.codec.decode(input),
      maxWeight: _i6.Weight.codec.decode(input),
    );
  }

  /// u16
  final int threshold;

  /// Vec<T::AccountId>
  final List<_i3.AccountId32> otherSignatories;

  /// Option<Timepoint<BlockNumberFor<T>>>
  final _i5.Timepoint? maybeTimepoint;

  /// Box<<T as Config>::RuntimeCall>
  final _i4.RuntimeCall call;

  /// Weight
  final _i6.Weight maxWeight;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'as_multi': {
          'threshold': threshold,
          'otherSignatories':
              otherSignatories.map((value) => value.toList()).toList(),
          'maybeTimepoint': maybeTimepoint?.toJson(),
          'call': call.toJson(),
          'maxWeight': maxWeight.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(threshold);
    size = size +
        const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
            .sizeHint(otherSignatories);
    size = size +
        const _i1.OptionCodec<_i5.Timepoint>(_i5.Timepoint.codec)
            .sizeHint(maybeTimepoint);
    size = size + _i4.RuntimeCall.codec.sizeHint(call);
    size = size + _i6.Weight.codec.sizeHint(maxWeight);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      threshold,
      output,
    );
    const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()).encodeTo(
      otherSignatories,
      output,
    );
    const _i1.OptionCodec<_i5.Timepoint>(_i5.Timepoint.codec).encodeTo(
      maybeTimepoint,
      output,
    );
    _i4.RuntimeCall.codec.encodeTo(
      call,
      output,
    );
    _i6.Weight.codec.encodeTo(
      maxWeight,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AsMulti &&
          other.threshold == threshold &&
          _i7.listsEqual(
            other.otherSignatories,
            otherSignatories,
          ) &&
          other.maybeTimepoint == maybeTimepoint &&
          other.call == call &&
          other.maxWeight == maxWeight;

  @override
  int get hashCode => Object.hash(
        threshold,
        otherSignatories,
        maybeTimepoint,
        call,
        maxWeight,
      );
}

/// See [`Pallet::approve_as_multi`].
class ApproveAsMulti extends Call {
  const ApproveAsMulti({
    required this.threshold,
    required this.otherSignatories,
    this.maybeTimepoint,
    required this.callHash,
    required this.maxWeight,
  });

  factory ApproveAsMulti._decode(_i1.Input input) {
    return ApproveAsMulti(
      threshold: _i1.U16Codec.codec.decode(input),
      otherSignatories:
          const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
              .decode(input),
      maybeTimepoint: const _i1.OptionCodec<_i5.Timepoint>(_i5.Timepoint.codec)
          .decode(input),
      callHash: const _i1.U8ArrayCodec(32).decode(input),
      maxWeight: _i6.Weight.codec.decode(input),
    );
  }

  /// u16
  final int threshold;

  /// Vec<T::AccountId>
  final List<_i3.AccountId32> otherSignatories;

  /// Option<Timepoint<BlockNumberFor<T>>>
  final _i5.Timepoint? maybeTimepoint;

  /// [u8; 32]
  final List<int> callHash;

  /// Weight
  final _i6.Weight maxWeight;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'approve_as_multi': {
          'threshold': threshold,
          'otherSignatories':
              otherSignatories.map((value) => value.toList()).toList(),
          'maybeTimepoint': maybeTimepoint?.toJson(),
          'callHash': callHash.toList(),
          'maxWeight': maxWeight.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(threshold);
    size = size +
        const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
            .sizeHint(otherSignatories);
    size = size +
        const _i1.OptionCodec<_i5.Timepoint>(_i5.Timepoint.codec)
            .sizeHint(maybeTimepoint);
    size = size + const _i1.U8ArrayCodec(32).sizeHint(callHash);
    size = size + _i6.Weight.codec.sizeHint(maxWeight);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      threshold,
      output,
    );
    const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()).encodeTo(
      otherSignatories,
      output,
    );
    const _i1.OptionCodec<_i5.Timepoint>(_i5.Timepoint.codec).encodeTo(
      maybeTimepoint,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      callHash,
      output,
    );
    _i6.Weight.codec.encodeTo(
      maxWeight,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ApproveAsMulti &&
          other.threshold == threshold &&
          _i7.listsEqual(
            other.otherSignatories,
            otherSignatories,
          ) &&
          other.maybeTimepoint == maybeTimepoint &&
          _i7.listsEqual(
            other.callHash,
            callHash,
          ) &&
          other.maxWeight == maxWeight;

  @override
  int get hashCode => Object.hash(
        threshold,
        otherSignatories,
        maybeTimepoint,
        callHash,
        maxWeight,
      );
}

/// See [`Pallet::cancel_as_multi`].
class CancelAsMulti extends Call {
  const CancelAsMulti({
    required this.threshold,
    required this.otherSignatories,
    required this.timepoint,
    required this.callHash,
  });

  factory CancelAsMulti._decode(_i1.Input input) {
    return CancelAsMulti(
      threshold: _i1.U16Codec.codec.decode(input),
      otherSignatories:
          const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
              .decode(input),
      timepoint: _i5.Timepoint.codec.decode(input),
      callHash: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// u16
  final int threshold;

  /// Vec<T::AccountId>
  final List<_i3.AccountId32> otherSignatories;

  /// Timepoint<BlockNumberFor<T>>
  final _i5.Timepoint timepoint;

  /// [u8; 32]
  final List<int> callHash;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'cancel_as_multi': {
          'threshold': threshold,
          'otherSignatories':
              otherSignatories.map((value) => value.toList()).toList(),
          'timepoint': timepoint.toJson(),
          'callHash': callHash.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(threshold);
    size = size +
        const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
            .sizeHint(otherSignatories);
    size = size + _i5.Timepoint.codec.sizeHint(timepoint);
    size = size + const _i1.U8ArrayCodec(32).sizeHint(callHash);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      threshold,
      output,
    );
    const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()).encodeTo(
      otherSignatories,
      output,
    );
    _i5.Timepoint.codec.encodeTo(
      timepoint,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      callHash,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CancelAsMulti &&
          other.threshold == threshold &&
          _i7.listsEqual(
            other.otherSignatories,
            otherSignatories,
          ) &&
          other.timepoint == timepoint &&
          _i7.listsEqual(
            other.callHash,
            callHash,
          );

  @override
  int get hashCode => Object.hash(
        threshold,
        otherSignatories,
        timepoint,
        callHash,
      );
}
