// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../AuthorizerId/authorizer_id.dart' as _i2;
import '../b_tree_set_5.dart' as _i3;
import '../TrustedEntityId/trusted_entity_id.dart' as _i6;

class RemoveIssuerRaw {
  const RemoveIssuerRaw({
    required this.authorizerId,
    required this.entityIds,
  });

  factory RemoveIssuerRaw.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AuthorizerId
  final _i2.AuthorizerId authorizerId;

  /// BTreeSet<TrustedEntityId>
  final _i3.BTreeSet entityIds;

  static const $RemoveIssuerRawCodec codec = $RemoveIssuerRawCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, List<dynamic>> toJson() => {
        'authorizerId': authorizerId.toList(),
        'entityIds': entityIds.map((value) => value.toList()).toList(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveIssuerRaw &&
          _i5.listsEqual(
            other.authorizerId,
            authorizerId,
          ) &&
          _i5.listsEqual(
            other.entityIds,
            entityIds,
          );

  @override
  int get hashCode => Object.hash(
        authorizerId,
        entityIds,
      );
}

class $RemoveIssuerRawCodec with _i1.Codec<RemoveIssuerRaw> {
  const $RemoveIssuerRawCodec();

  @override
  void encodeTo(
    RemoveIssuerRaw obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.authorizerId,
      output,
    );
    const _i1.SequenceCodec<_i6.TrustedEntityId>(_i6.TrustedEntityIdCodec())
        .encodeTo(
      obj.entityIds,
      output,
    );
  }

  @override
  RemoveIssuerRaw decode(_i1.Input input) {
    return RemoveIssuerRaw(
      authorizerId: const _i1.U8ArrayCodec(32).decode(input),
      entityIds: const _i1.SequenceCodec<_i6.TrustedEntityId>(
              _i6.TrustedEntityIdCodec())
          .decode(input),
    );
  }

  @override
  int sizeHint(RemoveIssuerRaw obj) {
    int size = 0;
    size = size + const _i2.AuthorizerIdCodec().sizeHint(obj.authorizerId);
    size = size + const _i3.BTreeSetCodec().sizeHint(obj.entityIds);
    return size;
  }
}
