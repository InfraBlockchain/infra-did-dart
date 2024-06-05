// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../Bytes64/bytes64.dart' as _i3;

abstract class SigValue {
  const SigValue();

  factory SigValue.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $SigValueCodec codec = $SigValueCodec();

  static const $SigValue values = $SigValue();

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

class $SigValue {
  const $SigValue();

  Sr25519 sr25519(_i3.Bytes64 value0) {
    return Sr25519(value0);
  }

  Ed25519 ed25519(_i3.Bytes64 value0) {
    return Ed25519(value0);
  }
}

class $SigValueCodec with _i1.Codec<SigValue> {
  const $SigValueCodec();

  @override
  SigValue decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Sr25519._decode(input);
      case 1:
        return Ed25519._decode(input);
      default:
        throw Exception('SigValue: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    SigValue value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Sr25519:
        (value as Sr25519).encodeTo(output);
        break;
      case Ed25519:
        (value as Ed25519).encodeTo(output);
        break;
      default:
        throw Exception(
            'SigValue: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(SigValue value) {
    switch (value.runtimeType) {
      case Sr25519:
        return (value as Sr25519)._sizeHint();
      case Ed25519:
        return (value as Ed25519)._sizeHint();
      default:
        throw Exception(
            'SigValue: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Sr25519 extends SigValue {
  const Sr25519(this.value0);

  factory Sr25519._decode(_i1.Input input) {
    return Sr25519(const _i1.U8ArrayCodec(64).decode(input));
  }

  /// Bytes64
  final _i3.Bytes64 value0;

  @override
  Map<String, List<int>> toJson() => {'Sr25519': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.Bytes64Codec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(64).encodeTo(
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
      other is Sr25519 &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class Ed25519 extends SigValue {
  const Ed25519(this.value0);

  factory Ed25519._decode(_i1.Input input) {
    return Ed25519(const _i1.U8ArrayCodec(64).decode(input));
  }

  /// Bytes64
  final _i3.Bytes64 value0;

  @override
  Map<String, List<int>> toJson() => {'Ed25519': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.Bytes64Codec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(64).encodeTo(
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
      other is Ed25519 &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
