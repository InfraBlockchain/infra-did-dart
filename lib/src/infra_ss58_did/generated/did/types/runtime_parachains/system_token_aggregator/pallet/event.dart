// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../../staging_xcm/v3/multilocation/multi_location.dart' as _i3;

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

  Map<String, Map<String, dynamic>> toJson();
}

class $Event {
  const $Event();

  SystemTokenAggregated systemTokenAggregated({
    required _i3.MultiLocation assetMultiLoc,
    required BigInt amount,
  }) {
    return SystemTokenAggregated(
      assetMultiLoc: assetMultiLoc,
      amount: amount,
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
        return SystemTokenAggregated._decode(input);
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
      case SystemTokenAggregated:
        (value as SystemTokenAggregated).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case SystemTokenAggregated:
        return (value as SystemTokenAggregated)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Aggrate System Token Successfully
class SystemTokenAggregated extends Event {
  const SystemTokenAggregated({
    required this.assetMultiLoc,
    required this.amount,
  });

  factory SystemTokenAggregated._decode(_i1.Input input) {
    return SystemTokenAggregated(
      assetMultiLoc: _i3.MultiLocation.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// MultiLocation
  final _i3.MultiLocation assetMultiLoc;

  /// u128
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'SystemTokenAggregated': {
          'assetMultiLoc': assetMultiLoc.toJson(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiLocation.codec.sizeHint(assetMultiLoc);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.MultiLocation.codec.encodeTo(
      assetMultiLoc,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SystemTokenAggregated &&
          other.assetMultiLoc == assetMultiLoc &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        assetMultiLoc,
        amount,
      );
}
