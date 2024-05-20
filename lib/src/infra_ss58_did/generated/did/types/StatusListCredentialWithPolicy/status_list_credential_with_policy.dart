// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../Policy/policy.dart' as _i3;
import '../StatusListCredential/status_list_credential.dart' as _i2;

class StatusListCredentialWithPolicy {
  const StatusListCredentialWithPolicy({
    required this.statusListCredential,
    required this.policy,
  });

  factory StatusListCredentialWithPolicy.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// StatusListCredential<T>
  final _i2.StatusListCredential statusListCredential;

  /// Policy<T>
  final _i3.Policy policy;

  static const $StatusListCredentialWithPolicyCodec codec =
      $StatusListCredentialWithPolicyCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, Map<String, List<dynamic>>> toJson() => {
        'statusListCredential': statusListCredential.toJson(),
        'policy': policy.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is StatusListCredentialWithPolicy &&
          other.statusListCredential == statusListCredential &&
          other.policy == policy;

  @override
  int get hashCode => Object.hash(
        statusListCredential,
        policy,
      );
}

class $StatusListCredentialWithPolicyCodec
    with _i1.Codec<StatusListCredentialWithPolicy> {
  const $StatusListCredentialWithPolicyCodec();

  @override
  void encodeTo(
    StatusListCredentialWithPolicy obj,
    _i1.Output output,
  ) {
    _i2.StatusListCredential.codec.encodeTo(
      obj.statusListCredential,
      output,
    );
    _i3.Policy.codec.encodeTo(
      obj.policy,
      output,
    );
  }

  @override
  StatusListCredentialWithPolicy decode(_i1.Input input) {
    return StatusListCredentialWithPolicy(
      statusListCredential: _i2.StatusListCredential.codec.decode(input),
      policy: _i3.Policy.codec.decode(input),
    );
  }

  @override
  int sizeHint(StatusListCredentialWithPolicy obj) {
    int size = 0;
    size = size +
        _i2.StatusListCredential.codec.sizeHint(obj.statusListCredential);
    size = size + _i3.Policy.codec.sizeHint(obj.policy);
    return size;
  }
}
