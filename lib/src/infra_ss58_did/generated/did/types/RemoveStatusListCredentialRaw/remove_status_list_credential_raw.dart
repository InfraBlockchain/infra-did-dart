// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../StatusListCredentialId/status_list_credential_id.dart' as _i2;

class RemoveStatusListCredentialRaw {
  const RemoveStatusListCredentialRaw({required this.id});

  factory RemoveStatusListCredentialRaw.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// StatusListCredentialId
  final _i2.StatusListCredentialId id;

  static const $RemoveStatusListCredentialRawCodec codec =
      $RemoveStatusListCredentialRawCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, List<int>> toJson() => {'id': id.toList()};

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveStatusListCredentialRaw &&
          _i4.listsEqual(
            other.id,
            id,
          );

  @override
  int get hashCode => id.hashCode;
}

class $RemoveStatusListCredentialRawCodec
    with _i1.Codec<RemoveStatusListCredentialRaw> {
  const $RemoveStatusListCredentialRawCodec();

  @override
  void encodeTo(
    RemoveStatusListCredentialRaw obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.id,
      output,
    );
  }

  @override
  RemoveStatusListCredentialRaw decode(_i1.Input input) {
    return RemoveStatusListCredentialRaw(
        id: const _i1.U8ArrayCodec(32).decode(input));
  }

  @override
  int sizeHint(RemoveStatusListCredentialRaw obj) {
    int size = 0;
    size = size + const _i2.StatusListCredentialIdCodec().sizeHint(obj.id);
    return size;
  }
}
