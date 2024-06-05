// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i2;

import 'SetAttestationClaim/set_attestation_claim.dart' as _i1;

typedef Cow = _i1.SetAttestationClaim;

class CowCodec with _i2.Codec<Cow> {
  const CowCodec();

  @override
  Cow decode(_i2.Input input) {
    return _i1.SetAttestationClaim.codec.decode(input);
  }

  @override
  void encodeTo(
    Cow value,
    _i2.Output output,
  ) {
    _i1.SetAttestationClaim.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(Cow value) {
    return _i1.SetAttestationClaim.codec.sizeHint(value);
  }
}
