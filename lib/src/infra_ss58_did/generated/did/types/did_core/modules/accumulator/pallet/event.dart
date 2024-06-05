// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../../../../AccumulatorId/accumulator_id.dart' as _i5;
import '../../../../AccumulatorOwner/accumulator_owner.dart' as _i3;
import '../../../../Bytes/bytes.dart' as _i6;
import '../../../../IncId/inc_id.dart' as _i4;

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

  Map<String, List<dynamic>> toJson();
}

class $Event {
  const $Event();

  ParamsAdded paramsAdded(
    _i3.AccumulatorOwner value0,
    _i4.IncId value1,
  ) {
    return ParamsAdded(
      value0,
      value1,
    );
  }

  ParamsRemoved paramsRemoved(
    _i3.AccumulatorOwner value0,
    _i4.IncId value1,
  ) {
    return ParamsRemoved(
      value0,
      value1,
    );
  }

  KeyAdded keyAdded(
    _i3.AccumulatorOwner value0,
    _i4.IncId value1,
  ) {
    return KeyAdded(
      value0,
      value1,
    );
  }

  KeyRemoved keyRemoved(
    _i3.AccumulatorOwner value0,
    _i4.IncId value1,
  ) {
    return KeyRemoved(
      value0,
      value1,
    );
  }

  AccumulatorAdded accumulatorAdded(
    _i5.AccumulatorId value0,
    _i6.Bytes value1,
  ) {
    return AccumulatorAdded(
      value0,
      value1,
    );
  }

  AccumulatorUpdated accumulatorUpdated(
    _i5.AccumulatorId value0,
    _i6.Bytes value1,
  ) {
    return AccumulatorUpdated(
      value0,
      value1,
    );
  }

  AccumulatorRemoved accumulatorRemoved(_i5.AccumulatorId value0) {
    return AccumulatorRemoved(value0);
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return ParamsAdded._decode(input);
      case 1:
        return ParamsRemoved._decode(input);
      case 2:
        return KeyAdded._decode(input);
      case 3:
        return KeyRemoved._decode(input);
      case 4:
        return AccumulatorAdded._decode(input);
      case 5:
        return AccumulatorUpdated._decode(input);
      case 6:
        return AccumulatorRemoved._decode(input);
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
      case ParamsAdded:
        (value as ParamsAdded).encodeTo(output);
        break;
      case ParamsRemoved:
        (value as ParamsRemoved).encodeTo(output);
        break;
      case KeyAdded:
        (value as KeyAdded).encodeTo(output);
        break;
      case KeyRemoved:
        (value as KeyRemoved).encodeTo(output);
        break;
      case AccumulatorAdded:
        (value as AccumulatorAdded).encodeTo(output);
        break;
      case AccumulatorUpdated:
        (value as AccumulatorUpdated).encodeTo(output);
        break;
      case AccumulatorRemoved:
        (value as AccumulatorRemoved).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case ParamsAdded:
        return (value as ParamsAdded)._sizeHint();
      case ParamsRemoved:
        return (value as ParamsRemoved)._sizeHint();
      case KeyAdded:
        return (value as KeyAdded)._sizeHint();
      case KeyRemoved:
        return (value as KeyRemoved)._sizeHint();
      case AccumulatorAdded:
        return (value as AccumulatorAdded)._sizeHint();
      case AccumulatorUpdated:
        return (value as AccumulatorUpdated)._sizeHint();
      case AccumulatorRemoved:
        return (value as AccumulatorRemoved)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class ParamsAdded extends Event {
  const ParamsAdded(
    this.value0,
    this.value1,
  );

  factory ParamsAdded._decode(_i1.Input input) {
    return ParamsAdded(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U32Codec.codec.decode(input),
    );
  }

  /// AccumulatorOwner
  final _i3.AccumulatorOwner value0;

  /// IncId
  final _i4.IncId value1;

  @override
  Map<String, List<dynamic>> toJson() => {
        'ParamsAdded': [
          value0.toList(),
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccumulatorOwnerCodec().sizeHint(value0);
    size = size + const _i4.IncIdCodec().sizeHint(value1);
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
    _i1.U32Codec.codec.encodeTo(
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
      other is ParamsAdded && other.value0 == value0 && other.value1 == value1;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

class ParamsRemoved extends Event {
  const ParamsRemoved(
    this.value0,
    this.value1,
  );

  factory ParamsRemoved._decode(_i1.Input input) {
    return ParamsRemoved(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U32Codec.codec.decode(input),
    );
  }

  /// AccumulatorOwner
  final _i3.AccumulatorOwner value0;

  /// IncId
  final _i4.IncId value1;

  @override
  Map<String, List<dynamic>> toJson() => {
        'ParamsRemoved': [
          value0.toList(),
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccumulatorOwnerCodec().sizeHint(value0);
    size = size + const _i4.IncIdCodec().sizeHint(value1);
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
    _i1.U32Codec.codec.encodeTo(
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
      other is ParamsRemoved &&
          other.value0 == value0 &&
          other.value1 == value1;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

class KeyAdded extends Event {
  const KeyAdded(
    this.value0,
    this.value1,
  );

  factory KeyAdded._decode(_i1.Input input) {
    return KeyAdded(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U32Codec.codec.decode(input),
    );
  }

  /// AccumulatorOwner
  final _i3.AccumulatorOwner value0;

  /// IncId
  final _i4.IncId value1;

  @override
  Map<String, List<dynamic>> toJson() => {
        'KeyAdded': [
          value0.toList(),
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccumulatorOwnerCodec().sizeHint(value0);
    size = size + const _i4.IncIdCodec().sizeHint(value1);
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
    _i1.U32Codec.codec.encodeTo(
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
      other is KeyAdded && other.value0 == value0 && other.value1 == value1;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

class KeyRemoved extends Event {
  const KeyRemoved(
    this.value0,
    this.value1,
  );

  factory KeyRemoved._decode(_i1.Input input) {
    return KeyRemoved(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U32Codec.codec.decode(input),
    );
  }

  /// AccumulatorOwner
  final _i3.AccumulatorOwner value0;

  /// IncId
  final _i4.IncId value1;

  @override
  Map<String, List<dynamic>> toJson() => {
        'KeyRemoved': [
          value0.toList(),
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccumulatorOwnerCodec().sizeHint(value0);
    size = size + const _i4.IncIdCodec().sizeHint(value1);
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
    _i1.U32Codec.codec.encodeTo(
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
      other is KeyRemoved && other.value0 == value0 && other.value1 == value1;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

class AccumulatorAdded extends Event {
  const AccumulatorAdded(
    this.value0,
    this.value1,
  );

  factory AccumulatorAdded._decode(_i1.Input input) {
    return AccumulatorAdded(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// AccumulatorId
  final _i5.AccumulatorId value0;

  /// Bytes
  final _i6.Bytes value1;

  @override
  Map<String, List<List<int>>> toJson() => {
        'AccumulatorAdded': [
          value0.toList(),
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i5.AccumulatorIdCodec().sizeHint(value0);
    size = size + const _i6.BytesCodec().sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value0,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
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
      other is AccumulatorAdded &&
          _i7.listsEqual(
            other.value0,
            value0,
          ) &&
          _i7.listsEqual(
            other.value1,
            value1,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

class AccumulatorUpdated extends Event {
  const AccumulatorUpdated(
    this.value0,
    this.value1,
  );

  factory AccumulatorUpdated._decode(_i1.Input input) {
    return AccumulatorUpdated(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// AccumulatorId
  final _i5.AccumulatorId value0;

  /// Bytes
  final _i6.Bytes value1;

  @override
  Map<String, List<List<int>>> toJson() => {
        'AccumulatorUpdated': [
          value0.toList(),
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i5.AccumulatorIdCodec().sizeHint(value0);
    size = size + const _i6.BytesCodec().sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value0,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
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
      other is AccumulatorUpdated &&
          _i7.listsEqual(
            other.value0,
            value0,
          ) &&
          _i7.listsEqual(
            other.value1,
            value1,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

class AccumulatorRemoved extends Event {
  const AccumulatorRemoved(this.value0);

  factory AccumulatorRemoved._decode(_i1.Input input) {
    return AccumulatorRemoved(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// AccumulatorId
  final _i5.AccumulatorId value0;

  @override
  Map<String, List<int>> toJson() => {'AccumulatorRemoved': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i5.AccumulatorIdCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
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
      other is AccumulatorRemoved &&
          _i7.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
