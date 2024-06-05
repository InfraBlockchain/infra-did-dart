// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef AuthorizerId = List<int>;

class AuthorizerIdCodec with _i1.Codec<AuthorizerId> {
  const AuthorizerIdCodec();

  @override
  AuthorizerId decode(_i1.Input input) {
    return const _i1.U8ArrayCodec(32).decode(input);
  }

  @override
  void encodeTo(
    AuthorizerId value,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(AuthorizerId value) {
    return const _i1.U8ArrayCodec(32).sizeHint(value);
  }
}
