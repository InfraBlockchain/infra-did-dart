// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../BBSPlusPublicKey/b_b_s_plus_public_key.dart' as _i4;
import '../BBSPublicKey/b_b_s_public_key.dart' as _i3;
import '../PSPublicKey/p_s_public_key.dart' as _i5;

abstract class OffchainPublicKey {
  const OffchainPublicKey();

  factory OffchainPublicKey.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $OffchainPublicKeyCodec codec = $OffchainPublicKeyCodec();

  static const $OffchainPublicKey values = $OffchainPublicKey();

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

class $OffchainPublicKey {
  const $OffchainPublicKey();

  Bbs bbs(_i3.BBSPublicKey value0) {
    return Bbs(value0);
  }

  BBSPlus bBSPlus(_i4.BBSPlusPublicKey value0) {
    return BBSPlus(value0);
  }

  Ps ps(_i5.PSPublicKey value0) {
    return Ps(value0);
  }
}

class $OffchainPublicKeyCodec with _i1.Codec<OffchainPublicKey> {
  const $OffchainPublicKeyCodec();

  @override
  OffchainPublicKey decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Bbs._decode(input);
      case 1:
        return BBSPlus._decode(input);
      case 2:
        return Ps._decode(input);
      default:
        throw Exception('OffchainPublicKey: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    OffchainPublicKey value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Bbs:
        (value as Bbs).encodeTo(output);
        break;
      case BBSPlus:
        (value as BBSPlus).encodeTo(output);
        break;
      case Ps:
        (value as Ps).encodeTo(output);
        break;
      default:
        throw Exception(
            'OffchainPublicKey: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(OffchainPublicKey value) {
    switch (value.runtimeType) {
      case Bbs:
        return (value as Bbs)._sizeHint();
      case BBSPlus:
        return (value as BBSPlus)._sizeHint();
      case Ps:
        return (value as Ps)._sizeHint();
      default:
        throw Exception(
            'OffchainPublicKey: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Bbs extends OffchainPublicKey {
  const Bbs(this.value0);

  factory Bbs._decode(_i1.Input input) {
    return Bbs(_i3.BBSPublicKey.codec.decode(input));
  }

  /// BBSPublicKey<T>
  final _i3.BBSPublicKey value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'BBS': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i3.BBSPublicKey.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.BBSPublicKey.codec.encodeTo(
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
      other is Bbs && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class BBSPlus extends OffchainPublicKey {
  const BBSPlus(this.value0);

  factory BBSPlus._decode(_i1.Input input) {
    return BBSPlus(_i4.BBSPlusPublicKey.codec.decode(input));
  }

  /// BBSPlusPublicKey<T>
  final _i4.BBSPlusPublicKey value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'BBSPlus': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i4.BBSPlusPublicKey.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i4.BBSPlusPublicKey.codec.encodeTo(
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
      other is BBSPlus && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Ps extends OffchainPublicKey {
  const Ps(this.value0);

  factory Ps._decode(_i1.Input input) {
    return Ps(_i5.PSPublicKey.codec.decode(input));
  }

  /// PSPublicKey<T>
  final _i5.PSPublicKey value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'PS': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i5.PSPublicKey.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i5.PSPublicKey.codec.encodeTo(
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
      other is Ps && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}
