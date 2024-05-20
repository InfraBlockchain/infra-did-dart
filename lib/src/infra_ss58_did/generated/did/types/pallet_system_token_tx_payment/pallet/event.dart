// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i3;
import '../types/detail.dart' as _i4;

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

  SystemTokenTxFeePaid systemTokenTxFeePaid({
    required _i3.AccountId32 feePayer,
    required _i4.Detail detail,
    _i3.AccountId32? voteCandidate,
  }) {
    return SystemTokenTxFeePaid(
      feePayer: feePayer,
      detail: detail,
      voteCandidate: voteCandidate,
    );
  }

  OnBootstrapping onBootstrapping() {
    return OnBootstrapping();
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return SystemTokenTxFeePaid._decode(input);
      case 1:
        return const OnBootstrapping();
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
      case SystemTokenTxFeePaid:
        (value as SystemTokenTxFeePaid).encodeTo(output);
        break;
      case OnBootstrapping:
        (value as OnBootstrapping).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case SystemTokenTxFeePaid:
        return (value as SystemTokenTxFeePaid)._sizeHint();
      case OnBootstrapping:
        return 1;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// A transaction fee `actual_fee`, of which `tip` was added to the minimum inclusion fee,
/// has been paid by `who` in an asset `asset_id`.
class SystemTokenTxFeePaid extends Event {
  const SystemTokenTxFeePaid({
    required this.feePayer,
    required this.detail,
    this.voteCandidate,
  });

  factory SystemTokenTxFeePaid._decode(_i1.Input input) {
    return SystemTokenTxFeePaid(
      feePayer: const _i1.U8ArrayCodec(32).decode(input),
      detail: _i4.Detail.codec.decode(input),
      voteCandidate:
          const _i1.OptionCodec<_i3.AccountId32>(_i3.AccountId32Codec())
              .decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 feePayer;

  /// Detail<T>
  final _i4.Detail detail;

  /// Option<VoteAccountId>
  final _i3.AccountId32? voteCandidate;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'SystemTokenTxFeePaid': {
          'feePayer': feePayer.toList(),
          'detail': detail.toJson(),
          'voteCandidate': voteCandidate?.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(feePayer);
    size = size + _i4.Detail.codec.sizeHint(detail);
    size = size +
        const _i1.OptionCodec<_i3.AccountId32>(_i3.AccountId32Codec())
            .sizeHint(voteCandidate);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      feePayer,
      output,
    );
    _i4.Detail.codec.encodeTo(
      detail,
      output,
    );
    const _i1.OptionCodec<_i3.AccountId32>(_i3.AccountId32Codec()).encodeTo(
      voteCandidate,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SystemTokenTxFeePaid &&
          _i5.listsEqual(
            other.feePayer,
            feePayer,
          ) &&
          other.detail == detail &&
          other.voteCandidate == voteCandidate;

  @override
  int get hashCode => Object.hash(
        feePayer,
        detail,
        voteCandidate,
      );
}

/// Currently, Runtime is in bootstrap mode.
class OnBootstrapping extends Event {
  const OnBootstrapping();

  @override
  Map<String, dynamic> toJson() => {'OnBootstrapping': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is OnBootstrapping;

  @override
  int get hashCode => runtimeType.hashCode;
}
