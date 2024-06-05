// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../BoundedBytes/bounded_bytes_4.dart' as _i2;

class Blob {
  const Blob({
    required this.id,
    required this.blob,
  });

  factory Blob.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// BlobId
  final List<int> id;

  /// BoundedBytes<T::MaxBlobSize>
  final _i2.BoundedBytes blob;

  static const $BlobCodec codec = $BlobCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, List<int>> toJson() => {
        'id': id.toList(),
        'blob': blob,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Blob &&
          _i4.listsEqual(
            other.id,
            id,
          ) &&
          _i4.listsEqual(
            other.blob,
            blob,
          );

  @override
  int get hashCode => Object.hash(
        id,
        blob,
      );
}

class $BlobCodec with _i1.Codec<Blob> {
  const $BlobCodec();

  @override
  void encodeTo(
    Blob obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.id,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.blob,
      output,
    );
  }

  @override
  Blob decode(_i1.Input input) {
    return Blob(
      id: const _i1.U8ArrayCodec(32).decode(input),
      blob: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Blob obj) {
    int size = 0;
    size = size + const _i1.U8ArrayCodec(32).sizeHint(obj.id);
    size = size + const _i2.BoundedBytesCodec().sizeHint(obj.blob);
    return size;
  }
}
