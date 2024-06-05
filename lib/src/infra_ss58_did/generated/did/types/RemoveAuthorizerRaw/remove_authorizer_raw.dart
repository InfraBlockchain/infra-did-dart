// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../AuthorizerId/authorizer_id.dart' as _i2;

class RemoveAuthorizerRaw {
  const RemoveAuthorizerRaw({required this.authorizerId});

  factory RemoveAuthorizerRaw.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AuthorizerId
  final _i2.AuthorizerId authorizerId;

  static const $RemoveAuthorizerRawCodec codec = $RemoveAuthorizerRawCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, List<int>> toJson() => {'authorizerId': authorizerId.toList()};

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveAuthorizerRaw &&
          _i4.listsEqual(
            other.authorizerId,
            authorizerId,
          );

  @override
  int get hashCode => authorizerId.hashCode;
}

class $RemoveAuthorizerRawCodec with _i1.Codec<RemoveAuthorizerRaw> {
  const $RemoveAuthorizerRawCodec();

  @override
  void encodeTo(
    RemoveAuthorizerRaw obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.authorizerId,
      output,
    );
  }

  @override
  RemoveAuthorizerRaw decode(_i1.Input input) {
    return RemoveAuthorizerRaw(
        authorizerId: const _i1.U8ArrayCodec(32).decode(input));
  }

  @override
  int sizeHint(RemoveAuthorizerRaw obj) {
    int size = 0;
    size = size + const _i2.AuthorizerIdCodec().sizeHint(obj.authorizerId);
    return size;
  }
}
