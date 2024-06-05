// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../Registry/registry.dart' as _i3;
import '../RegistryId/registry_id.dart' as _i2;

class AddRegistry {
  const AddRegistry({
    required this.id,
    required this.newRegistry,
  });

  factory AddRegistry.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// RegistryId
  final _i2.RegistryId id;

  /// Registry<T>
  final _i3.Registry newRegistry;

  static const $AddRegistryCodec codec = $AddRegistryCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id.toList(),
        'newRegistry': newRegistry.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddRegistry &&
          _i5.listsEqual(
            other.id,
            id,
          ) &&
          other.newRegistry == newRegistry;

  @override
  int get hashCode => Object.hash(
        id,
        newRegistry,
      );
}

class $AddRegistryCodec with _i1.Codec<AddRegistry> {
  const $AddRegistryCodec();

  @override
  void encodeTo(
    AddRegistry obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.id,
      output,
    );
    _i3.Registry.codec.encodeTo(
      obj.newRegistry,
      output,
    );
  }

  @override
  AddRegistry decode(_i1.Input input) {
    return AddRegistry(
      id: const _i1.U8ArrayCodec(32).decode(input),
      newRegistry: _i3.Registry.codec.decode(input),
    );
  }

  @override
  int sizeHint(AddRegistry obj) {
    int size = 0;
    size = size + const _i2.RegistryIdCodec().sizeHint(obj.id);
    size = size + _i3.Registry.codec.sizeHint(obj.newRegistry);
    return size;
  }
}
