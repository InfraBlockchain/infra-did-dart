// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../DidKey/did_key.dart' as _i3;
import '../IncId/inc_id.dart' as _i2;

class DidKeyWithId {
  const DidKeyWithId({
    required this.id,
    required this.key,
  });

  factory DidKeyWithId.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// IncId
  final _i2.IncId id;

  /// DidKey
  final _i3.DidKey key;

  static const $DidKeyWithIdCodec codec = $DidKeyWithIdCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DidKeyWithId && other.id == id && other.key == key;

  @override
  int get hashCode => Object.hash(
        id,
        key,
      );
}

class $DidKeyWithIdCodec with _i1.Codec<DidKeyWithId> {
  const $DidKeyWithIdCodec();

  @override
  void encodeTo(
    DidKeyWithId obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.id,
      output,
    );
    _i3.DidKey.codec.encodeTo(
      obj.key,
      output,
    );
  }

  @override
  DidKeyWithId decode(_i1.Input input) {
    return DidKeyWithId(
      id: _i1.U32Codec.codec.decode(input),
      key: _i3.DidKey.codec.decode(input),
    );
  }

  @override
  int sizeHint(DidKeyWithId obj) {
    int size = 0;
    size = size + const _i2.IncIdCodec().sizeHint(obj.id);
    size = size + _i3.DidKey.codec.sizeHint(obj.key);
    return size;
  }
}
