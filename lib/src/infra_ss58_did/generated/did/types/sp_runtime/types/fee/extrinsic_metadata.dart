// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

class ExtrinsicMetadata {
  const ExtrinsicMetadata({
    required this.palletName,
    required this.callName,
  });

  factory ExtrinsicMetadata.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Vec<u8>
  final List<int> palletName;

  /// Vec<u8>
  final List<int> callName;

  static const $ExtrinsicMetadataCodec codec = $ExtrinsicMetadataCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, List<int>> toJson() => {
        'palletName': palletName,
        'callName': callName,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ExtrinsicMetadata &&
          _i3.listsEqual(
            other.palletName,
            palletName,
          ) &&
          _i3.listsEqual(
            other.callName,
            callName,
          );

  @override
  int get hashCode => Object.hash(
        palletName,
        callName,
      );
}

class $ExtrinsicMetadataCodec with _i1.Codec<ExtrinsicMetadata> {
  const $ExtrinsicMetadataCodec();

  @override
  void encodeTo(
    ExtrinsicMetadata obj,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.palletName,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.callName,
      output,
    );
  }

  @override
  ExtrinsicMetadata decode(_i1.Input input) {
    return ExtrinsicMetadata(
      palletName: _i1.U8SequenceCodec.codec.decode(input),
      callName: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(ExtrinsicMetadata obj) {
    int size = 0;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.palletName);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.callName);
    return size;
  }
}
