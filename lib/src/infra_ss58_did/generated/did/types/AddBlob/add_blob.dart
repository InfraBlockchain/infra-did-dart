// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../Blob/blob.dart' as _i2;

class AddBlob {
  const AddBlob({
    required this.blob,
    required this.nonce,
  });

  factory AddBlob.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Blob<T>
  final _i2.Blob blob;

  /// T::BlockNumber
  final int nonce;

  static const $AddBlobCodec codec = $AddBlobCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'blob': blob.toJson(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddBlob && other.blob == blob && other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        blob,
        nonce,
      );
}

class $AddBlobCodec with _i1.Codec<AddBlob> {
  const $AddBlobCodec();

  @override
  void encodeTo(
    AddBlob obj,
    _i1.Output output,
  ) {
    _i2.Blob.codec.encodeTo(
      obj.blob,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  AddBlob decode(_i1.Input input) {
    return AddBlob(
      blob: _i2.Blob.codec.decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AddBlob obj) {
    int size = 0;
    size = size + _i2.Blob.codec.sizeHint(obj.blob);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
