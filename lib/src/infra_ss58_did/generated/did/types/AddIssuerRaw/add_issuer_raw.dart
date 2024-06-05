// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../AuthorizerId/authorizer_id.dart' as _i2;
import '../b_tree_set_5.dart' as _i3;
import '../TrustedEntityId/trusted_entity_id.dart' as _i6;

class AddIssuerRaw {
  const AddIssuerRaw({
    required this.authorizerId,
    required this.entityIds,
  });

  factory AddIssuerRaw.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AuthorizerId
  final _i2.AuthorizerId authorizerId;

  /// BTreeSet<TrustedEntityId>
  final _i3.BTreeSet entityIds;

  static const $AddIssuerRawCodec codec = $AddIssuerRawCodec();

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
      other is AddIssuerRaw &&
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

class $AddIssuerRawCodec with _i1.Codec<AddIssuerRaw> {
  const $AddIssuerRawCodec();

  @override
  void encodeTo(
    AddIssuerRaw obj,
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
  AddIssuerRaw decode(_i1.Input input) {
    return AddIssuerRaw(
      authorizerId: const _i1.U8ArrayCodec(32).decode(input),
      entityIds: const _i1.SequenceCodec<_i6.TrustedEntityId>(
              _i6.TrustedEntityIdCodec())
          .decode(input),
    );
  }

  @override
  int sizeHint(AddIssuerRaw obj) {
    int size = 0;
    size = size + const _i2.AuthorizerIdCodec().sizeHint(obj.authorizerId);
    size = size + const _i3.BTreeSetCodec().sizeHint(obj.entityIds);
    return size;
  }
}
