// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../b_tree_set_2.dart' as _i3;
import '../Controller/controller.dart' as _i6;
import '../Did/did.dart' as _i2;

class RemoveControllers {
  const RemoveControllers({
    required this.did,
    required this.controllers,
    required this.nonce,
  });

  factory RemoveControllers.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Did
  final _i2.Did did;

  /// BTreeSet<Controller>
  final _i3.BTreeSet controllers;

  /// T::BlockNumber
  final int nonce;

  static const $RemoveControllersCodec codec = $RemoveControllersCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'did': did.toList(),
        'controllers': controllers.map((value) => value.toList()).toList(),
        'nonce': nonce,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveControllers &&
          _i5.listsEqual(
            other.did,
            did,
          ) &&
          _i5.listsEqual(
            other.controllers,
            controllers,
          ) &&
          other.nonce == nonce;

  @override
  int get hashCode => Object.hash(
        did,
        controllers,
        nonce,
      );
}

class $RemoveControllersCodec with _i1.Codec<RemoveControllers> {
  const $RemoveControllersCodec();

  @override
  void encodeTo(
    RemoveControllers obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.did,
      output,
    );
    const _i1.SequenceCodec<_i6.Controller>(_i6.ControllerCodec()).encodeTo(
      obj.controllers,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
  }

  @override
  RemoveControllers decode(_i1.Input input) {
    return RemoveControllers(
      did: const _i1.U8ArrayCodec(32).decode(input),
      controllers:
          const _i1.SequenceCodec<_i6.Controller>(_i6.ControllerCodec())
              .decode(input),
      nonce: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(RemoveControllers obj) {
    int size = 0;
    size = size + const _i2.DidCodec().sizeHint(obj.did);
    size = size + const _i3.BTreeSetCodec().sizeHint(obj.controllers);
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    return size;
  }
}
