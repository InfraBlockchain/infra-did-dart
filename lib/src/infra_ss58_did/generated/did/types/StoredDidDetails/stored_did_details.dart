// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../OffChainDidDetails/off_chain_did_details.dart' as _i3;
import '../WithNonce/with_nonce_11.dart' as _i4;

abstract class StoredDidDetails {
  const StoredDidDetails();

  factory StoredDidDetails.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $StoredDidDetailsCodec codec = $StoredDidDetailsCodec();

  static const $StoredDidDetails values = $StoredDidDetails();

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

class $StoredDidDetails {
  const $StoredDidDetails();

  OffChain offChain(_i3.OffChainDidDetails value0) {
    return OffChain(value0);
  }

  OnChain onChain(_i4.WithNonce value0) {
    return OnChain(value0);
  }
}

class $StoredDidDetailsCodec with _i1.Codec<StoredDidDetails> {
  const $StoredDidDetailsCodec();

  @override
  StoredDidDetails decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return OffChain._decode(input);
      case 1:
        return OnChain._decode(input);
      default:
        throw Exception('StoredDidDetails: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    StoredDidDetails value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case OffChain:
        (value as OffChain).encodeTo(output);
        break;
      case OnChain:
        (value as OnChain).encodeTo(output);
        break;
      default:
        throw Exception(
            'StoredDidDetails: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(StoredDidDetails value) {
    switch (value.runtimeType) {
      case OffChain:
        return (value as OffChain)._sizeHint();
      case OnChain:
        return (value as OnChain)._sizeHint();
      default:
        throw Exception(
            'StoredDidDetails: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class OffChain extends StoredDidDetails {
  const OffChain(this.value0);

  factory OffChain._decode(_i1.Input input) {
    return OffChain(_i3.OffChainDidDetails.codec.decode(input));
  }

  /// OffChainDidDetails<T>
  final _i3.OffChainDidDetails value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'OffChain': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i3.OffChainDidDetails.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.OffChainDidDetails.codec.encodeTo(
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
      other is OffChain && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class OnChain extends StoredDidDetails {
  const OnChain(this.value0);

  factory OnChain._decode(_i1.Input input) {
    return OnChain(_i4.WithNonce.codec.decode(input));
  }

  /// StoredOnChainDidDetails<T>
  final _i4.WithNonce value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'OnChain': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i4.WithNonce.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i4.WithNonce.codec.encodeTo(
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
      other is OnChain && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}
