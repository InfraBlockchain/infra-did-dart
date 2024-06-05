// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../BoundedBytes/bounded_bytes_5.dart' as _i2;

class Attestation {
  const Attestation({
    required this.priority,
    this.iri,
  });

  factory Attestation.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u64
  final BigInt priority;

  /// Option<Iri<T>>
  final _i2.BoundedBytes? iri;

  static const $AttestationCodec codec = $AttestationCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'priority': priority,
        'iri': iri,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Attestation && other.priority == priority && other.iri == iri;

  @override
  int get hashCode => Object.hash(
        priority,
        iri,
      );
}

class $AttestationCodec with _i1.Codec<Attestation> {
  const $AttestationCodec();

  @override
  void encodeTo(
    Attestation obj,
    _i1.Output output,
  ) {
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.priority,
      output,
    );
    const _i1.OptionCodec<_i2.BoundedBytes>(_i2.BoundedBytesCodec()).encodeTo(
      obj.iri,
      output,
    );
  }

  @override
  Attestation decode(_i1.Input input) {
    return Attestation(
      priority: _i1.CompactBigIntCodec.codec.decode(input),
      iri: const _i1.OptionCodec<_i2.BoundedBytes>(_i2.BoundedBytesCodec())
          .decode(input),
    );
  }

  @override
  int sizeHint(Attestation obj) {
    int size = 0;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.priority);
    size = size +
        const _i1.OptionCodec<_i2.BoundedBytes>(_i2.BoundedBytesCodec())
            .sizeHint(obj.iri);
    return size;
  }
}
