// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../BoundedBytes/bounded_bytes_1.dart' as _i3;

abstract class OffChainDidDocRef {
  const OffChainDidDocRef();

  factory OffChainDidDocRef.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $OffChainDidDocRefCodec codec = $OffChainDidDocRefCodec();

  static const $OffChainDidDocRef values = $OffChainDidDocRef();

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

class $OffChainDidDocRef {
  const $OffChainDidDocRef();

  Cid cid(_i3.BoundedBytes value0) {
    return Cid(value0);
  }

  Url url(_i3.BoundedBytes value0) {
    return Url(value0);
  }

  Custom custom(_i3.BoundedBytes value0) {
    return Custom(value0);
  }
}

class $OffChainDidDocRefCodec with _i1.Codec<OffChainDidDocRef> {
  const $OffChainDidDocRefCodec();

  @override
  OffChainDidDocRef decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Cid._decode(input);
      case 1:
        return Url._decode(input);
      case 2:
        return Custom._decode(input);
      default:
        throw Exception('OffChainDidDocRef: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    OffChainDidDocRef value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Cid:
        (value as Cid).encodeTo(output);
        break;
      case Url:
        (value as Url).encodeTo(output);
        break;
      case Custom:
        (value as Custom).encodeTo(output);
        break;
      default:
        throw Exception(
            'OffChainDidDocRef: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(OffChainDidDocRef value) {
    switch (value.runtimeType) {
      case Cid:
        return (value as Cid)._sizeHint();
      case Url:
        return (value as Url)._sizeHint();
      case Custom:
        return (value as Custom)._sizeHint();
      default:
        throw Exception(
            'OffChainDidDocRef: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Cid extends OffChainDidDocRef {
  const Cid(this.value0);

  factory Cid._decode(_i1.Input input) {
    return Cid(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// BoundedBytes<T::MaxDidDocRefSize>
  final _i3.BoundedBytes value0;

  @override
  Map<String, List<int>> toJson() => {'CID': value0};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.BoundedBytesCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
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
      other is Cid &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class Url extends OffChainDidDocRef {
  const Url(this.value0);

  factory Url._decode(_i1.Input input) {
    return Url(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// BoundedBytes<T::MaxDidDocRefSize>
  final _i3.BoundedBytes value0;

  @override
  Map<String, List<int>> toJson() => {'URL': value0};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.BoundedBytesCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
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
      other is Url &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class Custom extends OffChainDidDocRef {
  const Custom(this.value0);

  factory Custom._decode(_i1.Input input) {
    return Custom(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// BoundedBytes<T::MaxDidDocRefSize>
  final _i3.BoundedBytes value0;

  @override
  Map<String, List<int>> toJson() => {'Custom': value0};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.BoundedBytesCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
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
      other is Custom &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
