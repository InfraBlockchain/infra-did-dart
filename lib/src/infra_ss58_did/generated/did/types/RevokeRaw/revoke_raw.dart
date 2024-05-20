// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../b_tree_set_4.dart' as _i3;
import '../RegistryId/registry_id.dart' as _i2;
import '../RevokeId/revoke_id.dart' as _i6;

class RevokeRaw {
  const RevokeRaw({
    required this.registryId,
    required this.revokeIds,
  });

  factory RevokeRaw.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// RegistryId
  final _i2.RegistryId registryId;

  /// BTreeSet<RevokeId>
  final _i3.BTreeSet revokeIds;

  static const $RevokeRawCodec codec = $RevokeRawCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, List<dynamic>> toJson() => {
        'registryId': registryId.toList(),
        'revokeIds': revokeIds.map((value) => value.toList()).toList(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RevokeRaw &&
          _i5.listsEqual(
            other.registryId,
            registryId,
          ) &&
          _i5.listsEqual(
            other.revokeIds,
            revokeIds,
          );

  @override
  int get hashCode => Object.hash(
        registryId,
        revokeIds,
      );
}

class $RevokeRawCodec with _i1.Codec<RevokeRaw> {
  const $RevokeRawCodec();

  @override
  void encodeTo(
    RevokeRaw obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.registryId,
      output,
    );
    const _i1.SequenceCodec<_i6.RevokeId>(_i6.RevokeIdCodec()).encodeTo(
      obj.revokeIds,
      output,
    );
  }

  @override
  RevokeRaw decode(_i1.Input input) {
    return RevokeRaw(
      registryId: const _i1.U8ArrayCodec(32).decode(input),
      revokeIds: const _i1.SequenceCodec<_i6.RevokeId>(_i6.RevokeIdCodec())
          .decode(input),
    );
  }

  @override
  int sizeHint(RevokeRaw obj) {
    int size = 0;
    size = size + const _i2.RegistryIdCodec().sizeHint(obj.registryId);
    size = size + const _i3.BTreeSetCodec().sizeHint(obj.revokeIds);
    return size;
  }
}
