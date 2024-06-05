// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../RegistryId/registry_id.dart' as _i2;

class RemoveRegistryRaw {
  const RemoveRegistryRaw({required this.registryId});

  factory RemoveRegistryRaw.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// RegistryId
  final _i2.RegistryId registryId;

  static const $RemoveRegistryRawCodec codec = $RemoveRegistryRawCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, List<int>> toJson() => {'registryId': registryId.toList()};

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveRegistryRaw &&
          _i4.listsEqual(
            other.registryId,
            registryId,
          );

  @override
  int get hashCode => registryId.hashCode;
}

class $RemoveRegistryRawCodec with _i1.Codec<RemoveRegistryRaw> {
  const $RemoveRegistryRawCodec();

  @override
  void encodeTo(
    RemoveRegistryRaw obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.registryId,
      output,
    );
  }

  @override
  RemoveRegistryRaw decode(_i1.Input input) {
    return RemoveRegistryRaw(
        registryId: const _i1.U8ArrayCodec(32).decode(input));
  }

  @override
  int sizeHint(RemoveRegistryRaw obj) {
    int size = 0;
    size = size + const _i2.RegistryIdCodec().sizeHint(obj.registryId);
    return size;
  }
}
