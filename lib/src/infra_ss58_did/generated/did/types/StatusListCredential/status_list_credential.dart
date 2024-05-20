// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../BoundedBytes/bounded_bytes_13.dart' as _i3;

abstract class StatusListCredential {
  const StatusListCredential();

  factory StatusListCredential.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $StatusListCredentialCodec codec = $StatusListCredentialCodec();

  static const $StatusListCredential values = $StatusListCredential();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, List<int>> toJson();
}

class $StatusListCredential {
  const $StatusListCredential();

  RevocationList2020Credential revocationList2020Credential(
      _i3.BoundedBytes value0) {
    return RevocationList2020Credential(value0);
  }

  StatusList2021Credential statusList2021Credential(_i3.BoundedBytes value0) {
    return StatusList2021Credential(value0);
  }
}

class $StatusListCredentialCodec with _i1.Codec<StatusListCredential> {
  const $StatusListCredentialCodec();

  @override
  StatusListCredential decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return RevocationList2020Credential._decode(input);
      case 1:
        return StatusList2021Credential._decode(input);
      default:
        throw Exception(
            'StatusListCredential: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    StatusListCredential value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case RevocationList2020Credential:
        (value as RevocationList2020Credential).encodeTo(output);
        break;
      case StatusList2021Credential:
        (value as StatusList2021Credential).encodeTo(output);
        break;
      default:
        throw Exception(
            'StatusListCredential: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(StatusListCredential value) {
    switch (value.runtimeType) {
      case RevocationList2020Credential:
        return (value as RevocationList2020Credential)._sizeHint();
      case StatusList2021Credential:
        return (value as StatusList2021Credential)._sizeHint();
      default:
        throw Exception(
            'StatusListCredential: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class RevocationList2020Credential extends StatusListCredential {
  const RevocationList2020Credential(this.value0);

  factory RevocationList2020Credential._decode(_i1.Input input) {
    return RevocationList2020Credential(
        _i1.U8SequenceCodec.codec.decode(input));
  }

  /// BoundedBytes<T::MaxStatusListCredentialSize>
  final _i3.BoundedBytes value0;

  @override
  Map<String, List<int>> toJson() => {'RevocationList2020Credential': value0};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.BoundedBytesCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RevocationList2020Credential &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class StatusList2021Credential extends StatusListCredential {
  const StatusList2021Credential(this.value0);

  factory StatusList2021Credential._decode(_i1.Input input) {
    return StatusList2021Credential(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// BoundedBytes<T::MaxStatusListCredentialSize>
  final _i3.BoundedBytes value0;

  @override
  Map<String, List<int>> toJson() => {'StatusList2021Credential': value0};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.BoundedBytesCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is StatusList2021Credential &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
