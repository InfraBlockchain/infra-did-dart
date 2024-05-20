// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../bounded_collections/bounded_btree_set/bounded_b_tree_set.dart'
    as _i3;
import '../Did/did.dart' as _i4;

abstract class Policy {
  const Policy();

  factory Policy.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $PolicyCodec codec = $PolicyCodec();

  static const $Policy values = $Policy();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, List<List<int>>> toJson();
}

class $Policy {
  const $Policy();

  OneOf oneOf(_i3.BoundedBTreeSet value0) {
    return OneOf(value0);
  }
}

class $PolicyCodec with _i1.Codec<Policy> {
  const $PolicyCodec();

  @override
  Policy decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return OneOf._decode(input);
      default:
        throw Exception('Policy: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Policy value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case OneOf:
        (value as OneOf).encodeTo(output);
        break;
      default:
        throw Exception(
            'Policy: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Policy value) {
    switch (value.runtimeType) {
      case OneOf:
        return (value as OneOf)._sizeHint();
      default:
        throw Exception(
            'Policy: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class OneOf extends Policy {
  const OneOf(this.value0);

  factory OneOf._decode(_i1.Input input) {
    return OneOf(
        const _i1.SequenceCodec<_i4.Did>(_i4.DidCodec()).decode(input));
  }

  /// BoundedBTreeSet<Did, T::MaxPolicyControllers>
  final _i3.BoundedBTreeSet value0;

  @override
  Map<String, List<List<int>>> toJson() =>
      {'OneOf': value0.map((value) => value.toList()).toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.BoundedBTreeSetCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.SequenceCodec<_i4.Did>(_i4.DidCodec()).encodeTo(
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
      other is OneOf && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}
