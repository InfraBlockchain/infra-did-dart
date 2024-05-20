// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../../../StatusListCredentialId/status_list_credential_id.dart'
    as _i3;

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

  StatusListCredentialCreated statusListCredentialCreated(
      _i3.StatusListCredentialId value0) {
    return StatusListCredentialCreated(value0);
  }

  StatusListCredentialUpdated statusListCredentialUpdated(
      _i3.StatusListCredentialId value0) {
    return StatusListCredentialUpdated(value0);
  }

  StatusListCredentialRemoved statusListCredentialRemoved(
      _i3.StatusListCredentialId value0) {
    return StatusListCredentialRemoved(value0);
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return StatusListCredentialCreated._decode(input);
      case 1:
        return StatusListCredentialUpdated._decode(input);
      case 2:
        return StatusListCredentialRemoved._decode(input);
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
      case StatusListCredentialCreated:
        (value as StatusListCredentialCreated).encodeTo(output);
        break;
      case StatusListCredentialUpdated:
        (value as StatusListCredentialUpdated).encodeTo(output);
        break;
      case StatusListCredentialRemoved:
        (value as StatusListCredentialRemoved).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case StatusListCredentialCreated:
        return (value as StatusListCredentialCreated)._sizeHint();
      case StatusListCredentialUpdated:
        return (value as StatusListCredentialUpdated)._sizeHint();
      case StatusListCredentialRemoved:
        return (value as StatusListCredentialRemoved)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// `StatusListCredential` with the given id was created.
class StatusListCredentialCreated extends Event {
  const StatusListCredentialCreated(this.value0);

  factory StatusListCredentialCreated._decode(_i1.Input input) {
    return StatusListCredentialCreated(
        const _i1.U8ArrayCodec(32).decode(input));
  }

  /// StatusListCredentialId
  final _i3.StatusListCredentialId value0;

  @override
  Map<String, List<int>> toJson() =>
      {'StatusListCredentialCreated': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.StatusListCredentialIdCodec().sizeHint(value0);
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
      other is StatusListCredentialCreated &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

/// `StatusListCredential` with the given id was updated.
class StatusListCredentialUpdated extends Event {
  const StatusListCredentialUpdated(this.value0);

  factory StatusListCredentialUpdated._decode(_i1.Input input) {
    return StatusListCredentialUpdated(
        const _i1.U8ArrayCodec(32).decode(input));
  }

  /// StatusListCredentialId
  final _i3.StatusListCredentialId value0;

  @override
  Map<String, List<int>> toJson() =>
      {'StatusListCredentialUpdated': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.StatusListCredentialIdCodec().sizeHint(value0);
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
      other is StatusListCredentialUpdated &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

/// `StatusListCredential` with the given id was removed.
class StatusListCredentialRemoved extends Event {
  const StatusListCredentialRemoved(this.value0);

  factory StatusListCredentialRemoved._decode(_i1.Input input) {
    return StatusListCredentialRemoved(
        const _i1.U8ArrayCodec(32).decode(input));
  }

  /// StatusListCredentialId
  final _i3.StatusListCredentialId value0;

  @override
  Map<String, List<int>> toJson() =>
      {'StatusListCredentialRemoved': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.StatusListCredentialIdCodec().sizeHint(value0);
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
      other is StatusListCredentialRemoved &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
