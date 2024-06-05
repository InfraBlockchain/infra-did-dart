// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../Policy/policy.dart' as _i2;

class Registry {
  const Registry({
    required this.policy,
    required this.addOnly,
  });

  factory Registry.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Policy<T>
  final _i2.Policy policy;

  /// bool
  final bool addOnly;

  static const $RegistryCodec codec = $RegistryCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'policy': policy.toJson(),
        'addOnly': addOnly,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Registry && other.policy == policy && other.addOnly == addOnly;

  @override
  int get hashCode => Object.hash(
        policy,
        addOnly,
      );
}

class $RegistryCodec with _i1.Codec<Registry> {
  const $RegistryCodec();

  @override
  void encodeTo(
    Registry obj,
    _i1.Output output,
  ) {
    _i2.Policy.codec.encodeTo(
      obj.policy,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      obj.addOnly,
      output,
    );
  }

  @override
  Registry decode(_i1.Input input) {
    return Registry(
      policy: _i2.Policy.codec.decode(input),
      addOnly: _i1.BoolCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Registry obj) {
    int size = 0;
    size = size + _i2.Policy.codec.sizeHint(obj.policy);
    size = size + _i1.BoolCodec.codec.sizeHint(obj.addOnly);
    return size;
  }
}
