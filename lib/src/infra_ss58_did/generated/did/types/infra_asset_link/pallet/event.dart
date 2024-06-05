// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../staging_xcm/v3/multilocation/multi_location.dart' as _i3;

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

  AssetLinked assetLinked({
    required int assetId,
    required _i3.MultiLocation assetMultiLocation,
  }) {
    return AssetLinked(
      assetId: assetId,
      assetMultiLocation: assetMultiLocation,
    );
  }

  AssetUnlinked assetUnlinked({required int assetId}) {
    return AssetUnlinked(assetId: assetId);
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return AssetLinked._decode(input);
      case 1:
        return AssetUnlinked._decode(input);
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
      case AssetLinked:
        (value as AssetLinked).encodeTo(output);
        break;
      case AssetUnlinked:
        (value as AssetUnlinked).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case AssetLinked:
        return (value as AssetLinked)._sizeHint();
      case AssetUnlinked:
        return (value as AssetUnlinked)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class AssetLinked extends Event {
  const AssetLinked({
    required this.assetId,
    required this.assetMultiLocation,
  });

  factory AssetLinked._decode(_i1.Input input) {
    return AssetLinked(
      assetId: _i1.U32Codec.codec.decode(input),
      assetMultiLocation: _i3.MultiLocation.codec.decode(input),
    );
  }

  /// AssetIdOf<T>
  final int assetId;

  /// MultiLocation
  final _i3.MultiLocation assetMultiLocation;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'AssetLinked': {
          'assetId': assetId,
          'assetMultiLocation': assetMultiLocation.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(assetId);
    size = size + _i3.MultiLocation.codec.sizeHint(assetMultiLocation);
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
    _i3.MultiLocation.codec.encodeTo(
      assetMultiLocation,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AssetLinked &&
          other.assetId == assetId &&
          other.assetMultiLocation == assetMultiLocation;

  @override
  int get hashCode => Object.hash(
        assetId,
        assetMultiLocation,
      );
}

class AssetUnlinked extends Event {
  const AssetUnlinked({required this.assetId});

  factory AssetUnlinked._decode(_i1.Input input) {
    return AssetUnlinked(assetId: _i1.U32Codec.codec.decode(input));
  }

  /// AssetIdOf<T>
  final int assetId;

  @override
  Map<String, Map<String, int>> toJson() => {
        'AssetUnlinked': {'assetId': assetId}
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
      other is AssetUnlinked && other.assetId == assetId;

  @override
  int get hashCode => assetId.hashCode;
}
