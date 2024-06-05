// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../../../RegistryId/registry_id.dart' as _i3;

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

  Map<String, List<int>> toJson();
}

class $Event {
  const $Event();

  RegistryAdded registryAdded(_i3.RegistryId value0) {
    return RegistryAdded(value0);
  }

  RevokedInRegistry revokedInRegistry(_i3.RegistryId value0) {
    return RevokedInRegistry(value0);
  }

  UnrevokedInRegistry unrevokedInRegistry(_i3.RegistryId value0) {
    return UnrevokedInRegistry(value0);
  }

  RegistryRemoved registryRemoved(_i3.RegistryId value0) {
    return RegistryRemoved(value0);
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return RegistryAdded._decode(input);
      case 1:
        return RevokedInRegistry._decode(input);
      case 2:
        return UnrevokedInRegistry._decode(input);
      case 3:
        return RegistryRemoved._decode(input);
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
      case RegistryAdded:
        (value as RegistryAdded).encodeTo(output);
        break;
      case RevokedInRegistry:
        (value as RevokedInRegistry).encodeTo(output);
        break;
      case UnrevokedInRegistry:
        (value as UnrevokedInRegistry).encodeTo(output);
        break;
      case RegistryRemoved:
        (value as RegistryRemoved).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case RegistryAdded:
        return (value as RegistryAdded)._sizeHint();
      case RevokedInRegistry:
        return (value as RevokedInRegistry)._sizeHint();
      case UnrevokedInRegistry:
        return (value as UnrevokedInRegistry)._sizeHint();
      case RegistryRemoved:
        return (value as RegistryRemoved)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Registry with given id created
class RegistryAdded extends Event {
  const RegistryAdded(this.value0);

  factory RegistryAdded._decode(_i1.Input input) {
    return RegistryAdded(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// RegistryId
  final _i3.RegistryId value0;

  @override
  Map<String, List<int>> toJson() => {'RegistryAdded': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.RegistryIdCodec().sizeHint(value0);
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
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RegistryAdded &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

/// Some items were revoked from given registry id
class RevokedInRegistry extends Event {
  const RevokedInRegistry(this.value0);

  factory RevokedInRegistry._decode(_i1.Input input) {
    return RevokedInRegistry(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// RegistryId
  final _i3.RegistryId value0;

  @override
  Map<String, List<int>> toJson() => {'RevokedInRegistry': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.RegistryIdCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
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
      other is RevokedInRegistry &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

/// Some items were un-revoked from given registry id
class UnrevokedInRegistry extends Event {
  const UnrevokedInRegistry(this.value0);

  factory UnrevokedInRegistry._decode(_i1.Input input) {
    return UnrevokedInRegistry(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// RegistryId
  final _i3.RegistryId value0;

  @override
  Map<String, List<int>> toJson() => {'UnrevokedInRegistry': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.RegistryIdCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
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
      other is UnrevokedInRegistry &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

/// Registry with given id removed
class RegistryRemoved extends Event {
  const RegistryRemoved(this.value0);

  factory RegistryRemoved._decode(_i1.Input input) {
    return RegistryRemoved(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// RegistryId
  final _i3.RegistryId value0;

  @override
  Map<String, List<int>> toJson() => {'RegistryRemoved': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.RegistryIdCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
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
      other is RegistryRemoved &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
