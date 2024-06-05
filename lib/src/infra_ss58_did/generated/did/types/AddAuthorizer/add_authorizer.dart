// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../Authorizer/authorizer.dart' as _i3;
import '../AuthorizerId/authorizer_id.dart' as _i2;

class AddAuthorizer {
  const AddAuthorizer({
    required this.id,
    required this.newAuthorizer,
  });

  factory AddAuthorizer.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AuthorizerId
  final _i2.AuthorizerId id;

  /// Authorizer<T>
  final _i3.Authorizer newAuthorizer;

  static const $AddAuthorizerCodec codec = $AddAuthorizerCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id.toList(),
        'newAuthorizer': newAuthorizer.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddAuthorizer &&
          _i5.listsEqual(
            other.id,
            id,
          ) &&
          other.newAuthorizer == newAuthorizer;

  @override
  int get hashCode => Object.hash(
        id,
        newAuthorizer,
      );
}

class $AddAuthorizerCodec with _i1.Codec<AddAuthorizer> {
  const $AddAuthorizerCodec();

  @override
  void encodeTo(
    AddAuthorizer obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.id,
      output,
    );
    _i3.Authorizer.codec.encodeTo(
      obj.newAuthorizer,
      output,
    );
  }

  @override
  AddAuthorizer decode(_i1.Input input) {
    return AddAuthorizer(
      id: const _i1.U8ArrayCodec(32).decode(input),
      newAuthorizer: _i3.Authorizer.codec.decode(input),
    );
  }

  @override
  int sizeHint(AddAuthorizer obj) {
    int size = 0;
    size = size + const _i2.AuthorizerIdCodec().sizeHint(obj.id);
    size = size + _i3.Authorizer.codec.sizeHint(obj.newAuthorizer);
    return size;
  }
}
