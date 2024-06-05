// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../../../primitive_types/h256.dart' as _i3;
import '../../../../sp_core/crypto/account_id32.dart' as _i4;

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

  Map<String, List<List<int>>> toJson();
}

class $Event {
  const $Event();

  AnchorDeployed anchorDeployed(
    _i3.H256 value0,
    _i4.AccountId32 value1,
  ) {
    return AnchorDeployed(
      value0,
      value1,
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
        return AnchorDeployed._decode(input);
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
      case AnchorDeployed:
        (value as AnchorDeployed).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case AnchorDeployed:
        return (value as AnchorDeployed)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// A new permanent anchor was posted.
class AnchorDeployed extends Event {
  const AnchorDeployed(
    this.value0,
    this.value1,
  );

  factory AnchorDeployed._decode(_i1.Input input) {
    return AnchorDeployed(
      const _i1.U8ArrayCodec(32).decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// T::Hash
  final _i3.H256 value0;

  /// T::AccountId
  final _i4.AccountId32 value1;

  @override
  Map<String, List<List<int>>> toJson() => {
        'AnchorDeployed': [
          value0.toList(),
          value1.toList(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.H256Codec().sizeHint(value0);
    size = size + const _i4.AccountId32Codec().sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value1,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AnchorDeployed &&
          _i5.listsEqual(
            other.value0,
            value0,
          ) &&
          _i5.listsEqual(
            other.value1,
            value1,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}
