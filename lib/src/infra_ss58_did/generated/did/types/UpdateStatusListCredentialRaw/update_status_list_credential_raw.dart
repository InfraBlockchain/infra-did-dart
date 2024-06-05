// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../StatusListCredential/status_list_credential.dart' as _i3;
import '../StatusListCredentialId/status_list_credential_id.dart' as _i2;

class UpdateStatusListCredentialRaw {
  const UpdateStatusListCredentialRaw({
    required this.id,
    required this.credential,
  });

  factory UpdateStatusListCredentialRaw.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// StatusListCredentialId
  final _i2.StatusListCredentialId id;

  /// StatusListCredential<T>
  final _i3.StatusListCredential credential;

  static const $UpdateStatusListCredentialRawCodec codec =
      $UpdateStatusListCredentialRawCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id.toList(),
        'credential': credential.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UpdateStatusListCredentialRaw &&
          _i5.listsEqual(
            other.id,
            id,
          ) &&
          other.credential == credential;

  @override
  int get hashCode => Object.hash(
        id,
        credential,
      );
}

class $UpdateStatusListCredentialRawCodec
    with _i1.Codec<UpdateStatusListCredentialRaw> {
  const $UpdateStatusListCredentialRawCodec();

  @override
  void encodeTo(
    UpdateStatusListCredentialRaw obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.id,
      output,
    );
    _i3.StatusListCredential.codec.encodeTo(
      obj.credential,
      output,
    );
  }

  @override
  UpdateStatusListCredentialRaw decode(_i1.Input input) {
    return UpdateStatusListCredentialRaw(
      id: const _i1.U8ArrayCodec(32).decode(input),
      credential: _i3.StatusListCredential.codec.decode(input),
    );
  }

  @override
  int sizeHint(UpdateStatusListCredentialRaw obj) {
    int size = 0;
    size = size + const _i2.StatusListCredentialIdCodec().sizeHint(obj.id);
    size = size + _i3.StatusListCredential.codec.sizeHint(obj.credential);
    return size;
  }
}
