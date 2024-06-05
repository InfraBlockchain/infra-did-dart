// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../../../../Did/did.dart' as _i5;
import '../../../../IncId/inc_id.dart' as _i4;
import '../../../../SignatureParamsOwner/signature_params_owner.dart' as _i3;

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
    _i3.SignatureParamsOwner value0,
    _i4.IncId value1,
  ) {
    return ParamsAdded(
      value0,
      value1,
    );
  }

  ParamsRemoved paramsRemoved(
    _i3.SignatureParamsOwner value0,
    _i4.IncId value1,
  ) {
    return ParamsRemoved(
      value0,
      value1,
    );
  }

  KeyAdded keyAdded(
    _i5.Did value0,
    _i4.IncId value1,
  ) {
    return KeyAdded(
      value0,
      value1,
    );
  }

  KeyRemoved keyRemoved(
    _i5.Did value0,
    _i4.IncId value1,
  ) {
    return KeyRemoved(
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
        return ParamsAdded._decode(input);
      case 1:
        return ParamsRemoved._decode(input);
      case 2:
        return KeyAdded._decode(input);
      case 3:
        return KeyRemoved._decode(input);
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

  /// SignatureParamsOwner
  final _i3.SignatureParamsOwner value0;

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
    size = size + const _i3.SignatureParamsOwnerCodec().sizeHint(value0);
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

  /// SignatureParamsOwner
  final _i3.SignatureParamsOwner value0;

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
    size = size + const _i3.SignatureParamsOwnerCodec().sizeHint(value0);
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

  /// Did
  final _i5.Did value0;

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
    size = size + const _i5.DidCodec().sizeHint(value0);
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
      other is KeyAdded &&
          _i6.listsEqual(
            other.value0,
            value0,
          ) &&
          other.value1 == value1;

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

  /// Did
  final _i5.Did value0;

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
    size = size + const _i5.DidCodec().sizeHint(value0);
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
      other is KeyRemoved &&
          _i6.listsEqual(
            other.value0,
            value0,
          ) &&
          other.value1 == value1;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}
