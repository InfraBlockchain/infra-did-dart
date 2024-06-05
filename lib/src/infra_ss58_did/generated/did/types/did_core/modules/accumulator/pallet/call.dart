// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../../../AddAccumulator/add_accumulator.dart' as _i8;
import '../../../../AddAccumulatorParams/add_accumulator_params.dart' as _i3;
import '../../../../AddAccumulatorPublicKey/add_accumulator_public_key.dart'
    as _i5;
import '../../../../DidSignature/did_signature_5.dart' as _i4;
import '../../../../RemoveAccumulator/remove_accumulator.dart' as _i10;
import '../../../../RemoveAccumulatorParams/remove_accumulator_params.dart'
    as _i6;
import '../../../../RemoveAccumulatorPublicKey/remove_accumulator_public_key.dart'
    as _i7;
import '../../../../UpdateAccumulator/update_accumulator.dart' as _i9;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, Map<String, dynamic>>> toJson();
}

class $Call {
  const $Call();

  AddParams addParams({
    required _i3.AddAccumulatorParams params,
    required _i4.DidSignature signature,
  }) {
    return AddParams(
      params: params,
      signature: signature,
    );
  }

  AddPublicKey addPublicKey({
    required _i5.AddAccumulatorPublicKey publicKey,
    required _i4.DidSignature signature,
  }) {
    return AddPublicKey(
      publicKey: publicKey,
      signature: signature,
    );
  }

  RemoveParams removeParams({
    required _i6.RemoveAccumulatorParams remove,
    required _i4.DidSignature signature,
  }) {
    return RemoveParams(
      remove: remove,
      signature: signature,
    );
  }

  RemovePublicKey removePublicKey({
    required _i7.RemoveAccumulatorPublicKey remove,
    required _i4.DidSignature signature,
  }) {
    return RemovePublicKey(
      remove: remove,
      signature: signature,
    );
  }

  AddAccumulator addAccumulator({
    required _i8.AddAccumulator addAccumulator,
    required _i4.DidSignature signature,
  }) {
    return AddAccumulator(
      addAccumulator: addAccumulator,
      signature: signature,
    );
  }

  UpdateAccumulator updateAccumulator({
    required _i9.UpdateAccumulator update,
    required _i4.DidSignature signature,
  }) {
    return UpdateAccumulator(
      update: update,
      signature: signature,
    );
  }

  RemoveAccumulator removeAccumulator({
    required _i10.RemoveAccumulator remove,
    required _i4.DidSignature signature,
  }) {
    return RemoveAccumulator(
      remove: remove,
      signature: signature,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return AddParams._decode(input);
      case 1:
        return AddPublicKey._decode(input);
      case 2:
        return RemoveParams._decode(input);
      case 3:
        return RemovePublicKey._decode(input);
      case 4:
        return AddAccumulator._decode(input);
      case 5:
        return UpdateAccumulator._decode(input);
      case 6:
        return RemoveAccumulator._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case AddParams:
        (value as AddParams).encodeTo(output);
        break;
      case AddPublicKey:
        (value as AddPublicKey).encodeTo(output);
        break;
      case RemoveParams:
        (value as RemoveParams).encodeTo(output);
        break;
      case RemovePublicKey:
        (value as RemovePublicKey).encodeTo(output);
        break;
      case AddAccumulator:
        (value as AddAccumulator).encodeTo(output);
        break;
      case UpdateAccumulator:
        (value as UpdateAccumulator).encodeTo(output);
        break;
      case RemoveAccumulator:
        (value as RemoveAccumulator).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case AddParams:
        return (value as AddParams)._sizeHint();
      case AddPublicKey:
        return (value as AddPublicKey)._sizeHint();
      case RemoveParams:
        return (value as RemoveParams)._sizeHint();
      case RemovePublicKey:
        return (value as RemovePublicKey)._sizeHint();
      case AddAccumulator:
        return (value as AddAccumulator)._sizeHint();
      case UpdateAccumulator:
        return (value as UpdateAccumulator)._sizeHint();
      case RemoveAccumulator:
        return (value as RemoveAccumulator)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::add_params`].
class AddParams extends Call {
  const AddParams({
    required this.params,
    required this.signature,
  });

  factory AddParams._decode(_i1.Input input) {
    return AddParams(
      params: _i3.AddAccumulatorParams.codec.decode(input),
      signature: _i4.DidSignature.codec.decode(input),
    );
  }

  /// AddAccumulatorParams<T>
  final _i3.AddAccumulatorParams params;

  /// DidSignature<AccumulatorOwner>
  final _i4.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'add_params': {
          'params': params.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.AddAccumulatorParams.codec.sizeHint(params);
    size = size + _i4.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.AddAccumulatorParams.codec.encodeTo(
      params,
      output,
    );
    _i4.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddParams &&
          other.params == params &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        params,
        signature,
      );
}

/// See [`Pallet::add_public_key`].
class AddPublicKey extends Call {
  const AddPublicKey({
    required this.publicKey,
    required this.signature,
  });

  factory AddPublicKey._decode(_i1.Input input) {
    return AddPublicKey(
      publicKey: _i5.AddAccumulatorPublicKey.codec.decode(input),
      signature: _i4.DidSignature.codec.decode(input),
    );
  }

  /// AddAccumulatorPublicKey<T>
  final _i5.AddAccumulatorPublicKey publicKey;

  /// DidSignature<AccumulatorOwner>
  final _i4.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'add_public_key': {
          'publicKey': publicKey.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i5.AddAccumulatorPublicKey.codec.sizeHint(publicKey);
    size = size + _i4.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i5.AddAccumulatorPublicKey.codec.encodeTo(
      publicKey,
      output,
    );
    _i4.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddPublicKey &&
          other.publicKey == publicKey &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        publicKey,
        signature,
      );
}

/// See [`Pallet::remove_params`].
class RemoveParams extends Call {
  const RemoveParams({
    required this.remove,
    required this.signature,
  });

  factory RemoveParams._decode(_i1.Input input) {
    return RemoveParams(
      remove: _i6.RemoveAccumulatorParams.codec.decode(input),
      signature: _i4.DidSignature.codec.decode(input),
    );
  }

  /// RemoveAccumulatorParams<T>
  final _i6.RemoveAccumulatorParams remove;

  /// DidSignature<AccumulatorOwner>
  final _i4.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'remove_params': {
          'remove': remove.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i6.RemoveAccumulatorParams.codec.sizeHint(remove);
    size = size + _i4.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i6.RemoveAccumulatorParams.codec.encodeTo(
      remove,
      output,
    );
    _i4.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveParams &&
          other.remove == remove &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        remove,
        signature,
      );
}

/// See [`Pallet::remove_public_key`].
class RemovePublicKey extends Call {
  const RemovePublicKey({
    required this.remove,
    required this.signature,
  });

  factory RemovePublicKey._decode(_i1.Input input) {
    return RemovePublicKey(
      remove: _i7.RemoveAccumulatorPublicKey.codec.decode(input),
      signature: _i4.DidSignature.codec.decode(input),
    );
  }

  /// RemoveAccumulatorPublicKey<T>
  final _i7.RemoveAccumulatorPublicKey remove;

  /// DidSignature<AccumulatorOwner>
  final _i4.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'remove_public_key': {
          'remove': remove.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i7.RemoveAccumulatorPublicKey.codec.sizeHint(remove);
    size = size + _i4.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i7.RemoveAccumulatorPublicKey.codec.encodeTo(
      remove,
      output,
    );
    _i4.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemovePublicKey &&
          other.remove == remove &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        remove,
        signature,
      );
}

/// See [`Pallet::add_accumulator`].
class AddAccumulator extends Call {
  const AddAccumulator({
    required this.addAccumulator,
    required this.signature,
  });

  factory AddAccumulator._decode(_i1.Input input) {
    return AddAccumulator(
      addAccumulator: _i8.AddAccumulator.codec.decode(input),
      signature: _i4.DidSignature.codec.decode(input),
    );
  }

  /// AddAccumulator<T>
  final _i8.AddAccumulator addAccumulator;

  /// DidSignature<AccumulatorOwner>
  final _i4.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'add_accumulator': {
          'addAccumulator': addAccumulator.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i8.AddAccumulator.codec.sizeHint(addAccumulator);
    size = size + _i4.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i8.AddAccumulator.codec.encodeTo(
      addAccumulator,
      output,
    );
    _i4.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddAccumulator &&
          other.addAccumulator == addAccumulator &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        addAccumulator,
        signature,
      );
}

/// See [`Pallet::update_accumulator`].
class UpdateAccumulator extends Call {
  const UpdateAccumulator({
    required this.update,
    required this.signature,
  });

  factory UpdateAccumulator._decode(_i1.Input input) {
    return UpdateAccumulator(
      update: _i9.UpdateAccumulator.codec.decode(input),
      signature: _i4.DidSignature.codec.decode(input),
    );
  }

  /// UpdateAccumulator<T>
  final _i9.UpdateAccumulator update;

  /// DidSignature<AccumulatorOwner>
  final _i4.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'update_accumulator': {
          'update': update.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i9.UpdateAccumulator.codec.sizeHint(update);
    size = size + _i4.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i9.UpdateAccumulator.codec.encodeTo(
      update,
      output,
    );
    _i4.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UpdateAccumulator &&
          other.update == update &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        update,
        signature,
      );
}

/// See [`Pallet::remove_accumulator`].
class RemoveAccumulator extends Call {
  const RemoveAccumulator({
    required this.remove,
    required this.signature,
  });

  factory RemoveAccumulator._decode(_i1.Input input) {
    return RemoveAccumulator(
      remove: _i10.RemoveAccumulator.codec.decode(input),
      signature: _i4.DidSignature.codec.decode(input),
    );
  }

  /// RemoveAccumulator<T>
  final _i10.RemoveAccumulator remove;

  /// DidSignature<AccumulatorOwner>
  final _i4.DidSignature signature;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'remove_accumulator': {
          'remove': remove.toJson(),
          'signature': signature.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i10.RemoveAccumulator.codec.sizeHint(remove);
    size = size + _i4.DidSignature.codec.sizeHint(signature);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i10.RemoveAccumulator.codec.encodeTo(
      remove,
      output,
    );
    _i4.DidSignature.codec.encodeTo(
      signature,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveAccumulator &&
          other.remove == remove &&
          other.signature == signature;

  @override
  int get hashCode => Object.hash(
        remove,
        signature,
      );
}
