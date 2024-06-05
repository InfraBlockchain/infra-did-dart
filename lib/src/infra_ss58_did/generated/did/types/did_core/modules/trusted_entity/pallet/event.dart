// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../../../AuthorizerId/authorizer_id.dart' as _i3;

/// The `Event` enum of this pallet
abstract class Event {
  const Event();

  factory Event.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EventCodec codec = $EventCodec();

  static const $Event values = $Event();

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

class $Event {
  const $Event();

  AuthorizerAdded authorizerAdded(_i3.AuthorizerId value0) {
    return AuthorizerAdded(value0);
  }

  IssuerAdded issuerAdded(_i3.AuthorizerId value0) {
    return IssuerAdded(value0);
  }

  IssuerRemoved issuerRemoved(_i3.AuthorizerId value0) {
    return IssuerRemoved(value0);
  }

  VerifierAdded verifierAdded(_i3.AuthorizerId value0) {
    return VerifierAdded(value0);
  }

  VerifierRemoved verifierRemoved(_i3.AuthorizerId value0) {
    return VerifierRemoved(value0);
  }

  AuthorizerRemoved authorizerRemoved(_i3.AuthorizerId value0) {
    return AuthorizerRemoved(value0);
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return AuthorizerAdded._decode(input);
      case 1:
        return IssuerAdded._decode(input);
      case 2:
        return IssuerRemoved._decode(input);
      case 3:
        return VerifierAdded._decode(input);
      case 4:
        return VerifierRemoved._decode(input);
      case 5:
        return AuthorizerRemoved._decode(input);
      default:
        throw Exception('Event: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Event value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case AuthorizerAdded:
        (value as AuthorizerAdded).encodeTo(output);
        break;
      case IssuerAdded:
        (value as IssuerAdded).encodeTo(output);
        break;
      case IssuerRemoved:
        (value as IssuerRemoved).encodeTo(output);
        break;
      case VerifierAdded:
        (value as VerifierAdded).encodeTo(output);
        break;
      case VerifierRemoved:
        (value as VerifierRemoved).encodeTo(output);
        break;
      case AuthorizerRemoved:
        (value as AuthorizerRemoved).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case AuthorizerAdded:
        return (value as AuthorizerAdded)._sizeHint();
      case IssuerAdded:
        return (value as IssuerAdded)._sizeHint();
      case IssuerRemoved:
        return (value as IssuerRemoved)._sizeHint();
      case VerifierAdded:
        return (value as VerifierAdded)._sizeHint();
      case VerifierRemoved:
        return (value as VerifierRemoved)._sizeHint();
      case AuthorizerRemoved:
        return (value as AuthorizerRemoved)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Authorizer with given id created
class AuthorizerAdded extends Event {
  const AuthorizerAdded(this.value0);

  factory AuthorizerAdded._decode(_i1.Input input) {
    return AuthorizerAdded(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// AuthorizerId
  final _i3.AuthorizerId value0;

  @override
  Map<String, List<int>> toJson() => {'AuthorizerAdded': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AuthorizerIdCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
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
      other is AuthorizerAdded &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

/// Issuer were added from given authorizer id
class IssuerAdded extends Event {
  const IssuerAdded(this.value0);

  factory IssuerAdded._decode(_i1.Input input) {
    return IssuerAdded(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// AuthorizerId
  final _i3.AuthorizerId value0;

  @override
  Map<String, List<int>> toJson() => {'IssuerAdded': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AuthorizerIdCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
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
      other is IssuerAdded &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

/// Issuer were removed from given authorizer id
class IssuerRemoved extends Event {
  const IssuerRemoved(this.value0);

  factory IssuerRemoved._decode(_i1.Input input) {
    return IssuerRemoved(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// AuthorizerId
  final _i3.AuthorizerId value0;

  @override
  Map<String, List<int>> toJson() => {'IssuerRemoved': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AuthorizerIdCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
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
      other is IssuerRemoved &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

/// Verifier were added from given authorizer id
class VerifierAdded extends Event {
  const VerifierAdded(this.value0);

  factory VerifierAdded._decode(_i1.Input input) {
    return VerifierAdded(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// AuthorizerId
  final _i3.AuthorizerId value0;

  @override
  Map<String, List<int>> toJson() => {'VerifierAdded': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AuthorizerIdCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
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
      other is VerifierAdded &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

/// Verifier were removed from given authorizer id
class VerifierRemoved extends Event {
  const VerifierRemoved(this.value0);

  factory VerifierRemoved._decode(_i1.Input input) {
    return VerifierRemoved(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// AuthorizerId
  final _i3.AuthorizerId value0;

  @override
  Map<String, List<int>> toJson() => {'VerifierRemoved': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AuthorizerIdCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
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
      other is VerifierRemoved &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

/// Authorizer with given id removed
class AuthorizerRemoved extends Event {
  const AuthorizerRemoved(this.value0);

  factory AuthorizerRemoved._decode(_i1.Input input) {
    return AuthorizerRemoved(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// AuthorizerId
  final _i3.AuthorizerId value0;

  @override
  Map<String, List<int>> toJson() => {'AuthorizerRemoved': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AuthorizerIdCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
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
      other is AuthorizerRemoved &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
