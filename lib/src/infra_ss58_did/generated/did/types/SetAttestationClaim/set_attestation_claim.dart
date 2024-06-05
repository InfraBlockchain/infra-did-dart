// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../Attestation/attestation.dart' as _i2;

class SetAttestationClaim {
  const SetAttestationClaim({
    required this.attest,
    required this.nonce,
  });

  factory SetAttestationClaim.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Attestation<T>
  final _i2.Attestation attest;

  /// T::BlockNumber
  final int nonce;

  static const $SetAttestationClaimCodec codec = $SetAttestationClaimCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'attest': attest.toJson(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetAttestationClaim &&
          other.attest == attest &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        attest,
        nonce,
      );
}

class $SetAttestationClaimCodec with _i1.Codec<SetAttestationClaim> {
  const $SetAttestationClaimCodec();

  @override
  void encodeTo(
    SetAttestationClaim obj,
    _i1.Output output,
  ) {
    _i2.Attestation.codec.encodeTo(
      obj.attest,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  SetAttestationClaim decode(_i1.Input input) {
    return SetAttestationClaim(
      attest: _i2.Attestation.codec.decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(SetAttestationClaim obj) {
    int size = 0;
    size = size + _i2.Attestation.codec.sizeHint(obj.attest);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
