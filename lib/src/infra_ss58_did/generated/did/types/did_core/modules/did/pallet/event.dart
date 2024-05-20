// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../../../Did/did.dart' as _i3;
import '../../../../OffChainDidDocRef/off_chain_did_doc_ref.dart' as _i4;

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

  OffChainDidAdded offChainDidAdded(
    _i3.Did value0,
    _i4.OffChainDidDocRef value1,
  ) {
    return OffChainDidAdded(
      value0,
      value1,
    );
  }

  OffChainDidUpdated offChainDidUpdated(
    _i3.Did value0,
    _i4.OffChainDidDocRef value1,
  ) {
    return OffChainDidUpdated(
      value0,
      value1,
    );
  }

  OffChainDidRemoved offChainDidRemoved(_i3.Did value0) {
    return OffChainDidRemoved(value0);
  }

  OnChainDidAdded onChainDidAdded(_i3.Did value0) {
    return OnChainDidAdded(value0);
  }

  DidKeysAdded didKeysAdded(_i3.Did value0) {
    return DidKeysAdded(value0);
  }

  DidKeysRemoved didKeysRemoved(_i3.Did value0) {
    return DidKeysRemoved(value0);
  }

  DidControllersAdded didControllersAdded(_i3.Did value0) {
    return DidControllersAdded(value0);
  }

  DidControllersRemoved didControllersRemoved(_i3.Did value0) {
    return DidControllersRemoved(value0);
  }

  DidServiceEndpointAdded didServiceEndpointAdded(_i3.Did value0) {
    return DidServiceEndpointAdded(value0);
  }

  DidServiceEndpointRemoved didServiceEndpointRemoved(_i3.Did value0) {
    return DidServiceEndpointRemoved(value0);
  }

  OnChainDidRemoved onChainDidRemoved(_i3.Did value0) {
    return OnChainDidRemoved(value0);
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return OffChainDidAdded._decode(input);
      case 1:
        return OffChainDidUpdated._decode(input);
      case 2:
        return OffChainDidRemoved._decode(input);
      case 3:
        return OnChainDidAdded._decode(input);
      case 4:
        return DidKeysAdded._decode(input);
      case 5:
        return DidKeysRemoved._decode(input);
      case 6:
        return DidControllersAdded._decode(input);
      case 7:
        return DidControllersRemoved._decode(input);
      case 8:
        return DidServiceEndpointAdded._decode(input);
      case 9:
        return DidServiceEndpointRemoved._decode(input);
      case 10:
        return OnChainDidRemoved._decode(input);
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
      case OffChainDidAdded:
        (value as OffChainDidAdded).encodeTo(output);
        break;
      case OffChainDidUpdated:
        (value as OffChainDidUpdated).encodeTo(output);
        break;
      case OffChainDidRemoved:
        (value as OffChainDidRemoved).encodeTo(output);
        break;
      case OnChainDidAdded:
        (value as OnChainDidAdded).encodeTo(output);
        break;
      case DidKeysAdded:
        (value as DidKeysAdded).encodeTo(output);
        break;
      case DidKeysRemoved:
        (value as DidKeysRemoved).encodeTo(output);
        break;
      case DidControllersAdded:
        (value as DidControllersAdded).encodeTo(output);
        break;
      case DidControllersRemoved:
        (value as DidControllersRemoved).encodeTo(output);
        break;
      case DidServiceEndpointAdded:
        (value as DidServiceEndpointAdded).encodeTo(output);
        break;
      case DidServiceEndpointRemoved:
        (value as DidServiceEndpointRemoved).encodeTo(output);
        break;
      case OnChainDidRemoved:
        (value as OnChainDidRemoved).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case OffChainDidAdded:
        return (value as OffChainDidAdded)._sizeHint();
      case OffChainDidUpdated:
        return (value as OffChainDidUpdated)._sizeHint();
      case OffChainDidRemoved:
        return (value as OffChainDidRemoved)._sizeHint();
      case OnChainDidAdded:
        return (value as OnChainDidAdded)._sizeHint();
      case DidKeysAdded:
        return (value as DidKeysAdded)._sizeHint();
      case DidKeysRemoved:
        return (value as DidKeysRemoved)._sizeHint();
      case DidControllersAdded:
        return (value as DidControllersAdded)._sizeHint();
      case DidControllersRemoved:
        return (value as DidControllersRemoved)._sizeHint();
      case DidServiceEndpointAdded:
        return (value as DidServiceEndpointAdded)._sizeHint();
      case DidServiceEndpointRemoved:
        return (value as DidServiceEndpointRemoved)._sizeHint();
      case OnChainDidRemoved:
        return (value as OnChainDidRemoved)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class OffChainDidAdded extends Event {
  const OffChainDidAdded(
    this.value0,
    this.value1,
  );

  factory OffChainDidAdded._decode(_i1.Input input) {
    return OffChainDidAdded(
      const _i1.U8ArrayCodec(32).decode(input),
      _i4.OffChainDidDocRef.codec.decode(input),
    );
  }

  /// Did
  final _i3.Did value0;

  /// OffChainDidDocRef<T>
  final _i4.OffChainDidDocRef value1;

  @override
  Map<String, List<dynamic>> toJson() => {
        'OffChainDidAdded': [
          value0.toList(),
          value1.toJson(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(value0);
    size = size + _i4.OffChainDidDocRef.codec.sizeHint(value1);
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
    _i4.OffChainDidDocRef.codec.encodeTo(
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
      other is OffChainDidAdded &&
          _i5.listsEqual(
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

class OffChainDidUpdated extends Event {
  const OffChainDidUpdated(
    this.value0,
    this.value1,
  );

  factory OffChainDidUpdated._decode(_i1.Input input) {
    return OffChainDidUpdated(
      const _i1.U8ArrayCodec(32).decode(input),
      _i4.OffChainDidDocRef.codec.decode(input),
    );
  }

  /// Did
  final _i3.Did value0;

  /// OffChainDidDocRef<T>
  final _i4.OffChainDidDocRef value1;

  @override
  Map<String, List<dynamic>> toJson() => {
        'OffChainDidUpdated': [
          value0.toList(),
          value1.toJson(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(value0);
    size = size + _i4.OffChainDidDocRef.codec.sizeHint(value1);
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
    _i4.OffChainDidDocRef.codec.encodeTo(
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
      other is OffChainDidUpdated &&
          _i5.listsEqual(
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

class OffChainDidRemoved extends Event {
  const OffChainDidRemoved(this.value0);

  factory OffChainDidRemoved._decode(_i1.Input input) {
    return OffChainDidRemoved(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// Did
  final _i3.Did value0;

  @override
  Map<String, List<int>> toJson() => {'OffChainDidRemoved': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(value0);
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
      other is OffChainDidRemoved &&
          _i5.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class OnChainDidAdded extends Event {
  const OnChainDidAdded(this.value0);

  factory OnChainDidAdded._decode(_i1.Input input) {
    return OnChainDidAdded(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// Did
  final _i3.Did value0;

  @override
  Map<String, List<int>> toJson() => {'OnChainDidAdded': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(value0);
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
      other is OnChainDidAdded &&
          _i5.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class DidKeysAdded extends Event {
  const DidKeysAdded(this.value0);

  factory DidKeysAdded._decode(_i1.Input input) {
    return DidKeysAdded(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// Did
  final _i3.Did value0;

  @override
  Map<String, List<int>> toJson() => {'DidKeysAdded': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(value0);
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
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DidKeysAdded &&
          _i5.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class DidKeysRemoved extends Event {
  const DidKeysRemoved(this.value0);

  factory DidKeysRemoved._decode(_i1.Input input) {
    return DidKeysRemoved(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// Did
  final _i3.Did value0;

  @override
  Map<String, List<int>> toJson() => {'DidKeysRemoved': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(value0);
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
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DidKeysRemoved &&
          _i5.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class DidControllersAdded extends Event {
  const DidControllersAdded(this.value0);

  factory DidControllersAdded._decode(_i1.Input input) {
    return DidControllersAdded(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// Did
  final _i3.Did value0;

  @override
  Map<String, List<int>> toJson() => {'DidControllersAdded': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(value0);
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
      other is DidControllersAdded &&
          _i5.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class DidControllersRemoved extends Event {
  const DidControllersRemoved(this.value0);

  factory DidControllersRemoved._decode(_i1.Input input) {
    return DidControllersRemoved(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// Did
  final _i3.Did value0;

  @override
  Map<String, List<int>> toJson() => {'DidControllersRemoved': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
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
      other is DidControllersRemoved &&
          _i5.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class DidServiceEndpointAdded extends Event {
  const DidServiceEndpointAdded(this.value0);

  factory DidServiceEndpointAdded._decode(_i1.Input input) {
    return DidServiceEndpointAdded(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// Did
  final _i3.Did value0;

  @override
  Map<String, List<int>> toJson() =>
      {'DidServiceEndpointAdded': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
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
      other is DidServiceEndpointAdded &&
          _i5.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class DidServiceEndpointRemoved extends Event {
  const DidServiceEndpointRemoved(this.value0);

  factory DidServiceEndpointRemoved._decode(_i1.Input input) {
    return DidServiceEndpointRemoved(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// Did
  final _i3.Did value0;

  @override
  Map<String, List<int>> toJson() =>
      {'DidServiceEndpointRemoved': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
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
      other is DidServiceEndpointRemoved &&
          _i5.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class OnChainDidRemoved extends Event {
  const OnChainDidRemoved(this.value0);

  factory OnChainDidRemoved._decode(_i1.Input input) {
    return OnChainDidRemoved(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// Did
  final _i3.Did value0;

  @override
  Map<String, List<int>> toJson() => {'OnChainDidRemoved': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
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
      other is OnChainDidRemoved &&
          _i5.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
