// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../../../DidSignature/did_signature_4.dart' as _i4;
import '../../../../SetAttestationClaim/set_attestation_claim.dart' as _i3;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, Map<String, dynamic>>> toJson();
}

class $Call {
  const $Call();

  SetClaim setClaim({
    required _i3.SetAttestationClaim attests,
    required _i4.DidSignature signature,
  }) {
    return SetClaim(
      attests: attests,
      signature: signature,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return SetClaim._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case SetClaim:
        (value as SetClaim).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case SetClaim:
        return (value as SetClaim)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::set_claim`].
class SetClaim extends Call {
  const SetClaim({
    required this.attests,
    required this.signature,
  });

  factory SetClaim._decode(_i1.Input input) {
    return SetClaim(
      attests: _i3.SetAttestationClaim.codec.decode(input),
      signature: _i4.DidSignature.codec.decode(input),
    );
  }

  /// SetAttestationClaim<T>
  final _i3.SetAttestationClaim attests;

  /// DidSignature<Attester>
  final _i4.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'set_claim': {
          'attests': attests.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.SetAttestationClaim.codec.sizeHint(attests);
    size = size + _i4.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.SetAttestationClaim.codec.encodeTo(
      attests,
      output,
    );
    _i4.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetClaim &&
          other.attests == attests &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        attests,
        signature,
      );
}
