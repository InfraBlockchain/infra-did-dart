// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i17;

import '../../../../AddControllers/add_controllers.dart' as _i10;
import '../../../../AddKeys/add_keys.dart' as _i7;
import '../../../../AddServiceEndpoint/add_service_endpoint.dart' as _i12;
import '../../../../AggregatedDidDetailsResponse/aggregated_did_details_response.dart'
    as _i16;
import '../../../../b_tree_set_2.dart' as _i6;
import '../../../../Controller/controller.dart' as _i18;
import '../../../../Did/did.dart' as _i3;
import '../../../../DidRemoval/did_removal.dart' as _i14;
import '../../../../DidSignature/did_signature_1.dart' as _i8;
import '../../../../OffChainDidDocRef/off_chain_did_doc_ref.dart' as _i4;
import '../../../../RemoveControllers/remove_controllers.dart' as _i11;
import '../../../../RemoveKeys/remove_keys.dart' as _i9;
import '../../../../RemoveServiceEndpoint/remove_service_endpoint.dart' as _i13;
import '../../../../StateChange/state_change.dart' as _i15;
import '../../../../UncheckedDidKey/unchecked_did_key.dart' as _i5;

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

  Map<String, Map<String, dynamic>> toJson();
}

class $Call {
  const $Call();

  NewOffchain newOffchain({
    required _i3.Did did,
    required _i4.OffChainDidDocRef didDocRef,
  }) {
    return NewOffchain(
      did: did,
      didDocRef: didDocRef,
    );
  }

  SetOffchainDidDocRef setOffchainDidDocRef({
    required _i3.Did did,
    required _i4.OffChainDidDocRef didDocRef,
  }) {
    return SetOffchainDidDocRef(
      did: did,
      didDocRef: didDocRef,
    );
  }

  RemoveOffchainDid removeOffchainDid({required _i3.Did did}) {
    return RemoveOffchainDid(did: did);
  }

  NewOnchain newOnchain({
    required _i3.Did did,
    required List<_i5.UncheckedDidKey> keys,
    required _i6.BTreeSet controllers,
  }) {
    return NewOnchain(
      did: did,
      keys: keys,
      controllers: controllers,
    );
  }

  AddKeys addKeys({
    required _i7.AddKeys keys,
    required _i8.DidSignature sig,
  }) {
    return AddKeys(
      keys: keys,
      sig: sig,
    );
  }

  RemoveKeys removeKeys({
    required _i9.RemoveKeys keys,
    required _i8.DidSignature sig,
  }) {
    return RemoveKeys(
      keys: keys,
      sig: sig,
    );
  }

  AddControllers addControllers({
    required _i10.AddControllers controllers,
    required _i8.DidSignature sig,
  }) {
    return AddControllers(
      controllers: controllers,
      sig: sig,
    );
  }

  RemoveControllers removeControllers({
    required _i11.RemoveControllers controllers,
    required _i8.DidSignature sig,
  }) {
    return RemoveControllers(
      controllers: controllers,
      sig: sig,
    );
  }

  AddServiceEndpoint addServiceEndpoint({
    required _i12.AddServiceEndpoint serviceEndpoint,
    required _i8.DidSignature sig,
  }) {
    return AddServiceEndpoint(
      serviceEndpoint: serviceEndpoint,
      sig: sig,
    );
  }

  RemoveServiceEndpoint removeServiceEndpoint({
    required _i13.RemoveServiceEndpoint serviceEndpoint,
    required _i8.DidSignature sig,
  }) {
    return RemoveServiceEndpoint(
      serviceEndpoint: serviceEndpoint,
      sig: sig,
    );
  }

  RemoveOnchainDid removeOnchainDid({
    required _i14.DidRemoval removal,
    required _i8.DidSignature sig,
  }) {
    return RemoveOnchainDid(
      removal: removal,
      sig: sig,
    );
  }

  Noop noop({
    required _i15.StateChange s,
    required _i16.AggregatedDidDetailsResponse d,
  }) {
    return Noop(
      s: s,
      d: d,
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
        return NewOffchain._decode(input);
      case 1:
        return SetOffchainDidDocRef._decode(input);
      case 2:
        return RemoveOffchainDid._decode(input);
      case 3:
        return NewOnchain._decode(input);
      case 4:
        return AddKeys._decode(input);
      case 5:
        return RemoveKeys._decode(input);
      case 6:
        return AddControllers._decode(input);
      case 7:
        return RemoveControllers._decode(input);
      case 8:
        return AddServiceEndpoint._decode(input);
      case 9:
        return RemoveServiceEndpoint._decode(input);
      case 10:
        return RemoveOnchainDid._decode(input);
      case 11:
        return Noop._decode(input);
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
      case NewOffchain:
        (value as NewOffchain).encodeTo(output);
        break;
      case SetOffchainDidDocRef:
        (value as SetOffchainDidDocRef).encodeTo(output);
        break;
      case RemoveOffchainDid:
        (value as RemoveOffchainDid).encodeTo(output);
        break;
      case NewOnchain:
        (value as NewOnchain).encodeTo(output);
        break;
      case AddKeys:
        (value as AddKeys).encodeTo(output);
        break;
      case RemoveKeys:
        (value as RemoveKeys).encodeTo(output);
        break;
      case AddControllers:
        (value as AddControllers).encodeTo(output);
        break;
      case RemoveControllers:
        (value as RemoveControllers).encodeTo(output);
        break;
      case AddServiceEndpoint:
        (value as AddServiceEndpoint).encodeTo(output);
        break;
      case RemoveServiceEndpoint:
        (value as RemoveServiceEndpoint).encodeTo(output);
        break;
      case RemoveOnchainDid:
        (value as RemoveOnchainDid).encodeTo(output);
        break;
      case Noop:
        (value as Noop).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case NewOffchain:
        return (value as NewOffchain)._sizeHint();
      case SetOffchainDidDocRef:
        return (value as SetOffchainDidDocRef)._sizeHint();
      case RemoveOffchainDid:
        return (value as RemoveOffchainDid)._sizeHint();
      case NewOnchain:
        return (value as NewOnchain)._sizeHint();
      case AddKeys:
        return (value as AddKeys)._sizeHint();
      case RemoveKeys:
        return (value as RemoveKeys)._sizeHint();
      case AddControllers:
        return (value as AddControllers)._sizeHint();
      case RemoveControllers:
        return (value as RemoveControllers)._sizeHint();
      case AddServiceEndpoint:
        return (value as AddServiceEndpoint)._sizeHint();
      case RemoveServiceEndpoint:
        return (value as RemoveServiceEndpoint)._sizeHint();
      case RemoveOnchainDid:
        return (value as RemoveOnchainDid)._sizeHint();
      case Noop:
        return (value as Noop)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::new_offchain`].
class NewOffchain extends Call {
  const NewOffchain({
    required this.did,
    required this.didDocRef,
  });

  factory NewOffchain._decode(_i1.Input input) {
    return NewOffchain(
      did: const _i1.U8ArrayCodec(32).decode(input),
      didDocRef: _i4.OffChainDidDocRef.codec.decode(input),
    );
  }

  /// Did
  final _i3.Did did;

  /// OffChainDidDocRef<T>
  final _i4.OffChainDidDocRef didDocRef;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'new_offchain': {
          'did': did.toList(),
          'didDocRef': didDocRef.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(did);
    size = size + _i4.OffChainDidDocRef.codec.sizeHint(didDocRef);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      did,
      output,
    );
    _i4.OffChainDidDocRef.codec.encodeTo(
      didDocRef,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is NewOffchain &&
          _i17.listsEqual(
            other.did,
            did,
          ) &&
          other.didDocRef == didDocRef;

  @override
  int get hashCode => Object.hash(
        did,
        didDocRef,
      );
}

/// See [`Pallet::set_offchain_did_doc_ref`].
class SetOffchainDidDocRef extends Call {
  const SetOffchainDidDocRef({
    required this.did,
    required this.didDocRef,
  });

  factory SetOffchainDidDocRef._decode(_i1.Input input) {
    return SetOffchainDidDocRef(
      did: const _i1.U8ArrayCodec(32).decode(input),
      didDocRef: _i4.OffChainDidDocRef.codec.decode(input),
    );
  }

  /// Did
  final _i3.Did did;

  /// OffChainDidDocRef<T>
  final _i4.OffChainDidDocRef didDocRef;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'set_offchain_did_doc_ref': {
          'did': did.toList(),
          'didDocRef': didDocRef.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(did);
    size = size + _i4.OffChainDidDocRef.codec.sizeHint(didDocRef);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      did,
      output,
    );
    _i4.OffChainDidDocRef.codec.encodeTo(
      didDocRef,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetOffchainDidDocRef &&
          _i17.listsEqual(
            other.did,
            did,
          ) &&
          other.didDocRef == didDocRef;

  @override
  int get hashCode => Object.hash(
        did,
        didDocRef,
      );
}

/// See [`Pallet::remove_offchain_did`].
class RemoveOffchainDid extends Call {
  const RemoveOffchainDid({required this.did});

  factory RemoveOffchainDid._decode(_i1.Input input) {
    return RemoveOffchainDid(did: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// Did
  final _i3.Did did;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'remove_offchain_did': {'did': did.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(did);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      did,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveOffchainDid &&
          _i17.listsEqual(
            other.did,
            did,
          );

  @override
  int get hashCode => did.hashCode;
}

/// See [`Pallet::new_onchain`].
class NewOnchain extends Call {
  const NewOnchain({
    required this.did,
    required this.keys,
    required this.controllers,
  });

  factory NewOnchain._decode(_i1.Input input) {
    return NewOnchain(
      did: const _i1.U8ArrayCodec(32).decode(input),
      keys: const _i1.SequenceCodec<_i5.UncheckedDidKey>(
              _i5.UncheckedDidKey.codec)
          .decode(input),
      controllers:
          const _i1.SequenceCodec<_i18.Controller>(_i18.ControllerCodec())
              .decode(input),
    );
  }

  /// Did
  final _i3.Did did;

  /// Vec<UncheckedDidKey>
  final List<_i5.UncheckedDidKey> keys;

  /// BTreeSet<Controller>
  final _i6.BTreeSet controllers;

  @override
  Map<String, Map<String, List<dynamic>>> toJson() => {
        'new_onchain': {
          'did': did.toList(),
          'keys': keys.map((value) => value.toJson()).toList(),
          'controllers': controllers.map((value) => value.toList()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.DidCodec().sizeHint(did);
    size = size +
        const _i1.SequenceCodec<_i5.UncheckedDidKey>(_i5.UncheckedDidKey.codec)
            .sizeHint(keys);
    size = size + const _i6.BTreeSetCodec().sizeHint(controllers);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      did,
      output,
    );
    const _i1.SequenceCodec<_i5.UncheckedDidKey>(_i5.UncheckedDidKey.codec)
        .encodeTo(
      keys,
      output,
    );
    const _i1.SequenceCodec<_i18.Controller>(_i18.ControllerCodec()).encodeTo(
      controllers,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is NewOnchain &&
          _i17.listsEqual(
            other.did,
            did,
          ) &&
          _i17.listsEqual(
            other.keys,
            keys,
          ) &&
          _i17.listsEqual(
            other.controllers,
            controllers,
          );

  @override
  int get hashCode => Object.hash(
        did,
        keys,
        controllers,
      );
}

/// See [`Pallet::add_keys`].
class AddKeys extends Call {
  const AddKeys({
    required this.keys,
    required this.sig,
  });

  factory AddKeys._decode(_i1.Input input) {
    return AddKeys(
      keys: _i7.AddKeys.codec.decode(input),
      sig: _i8.DidSignature.codec.decode(input),
    );
  }

  /// AddKeys<T>
  final _i7.AddKeys keys;

  /// DidSignature<Controller>
  final _i8.DidSignature sig;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'add_keys': {
          'keys': keys.toJson(),
          'sig': sig.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i7.AddKeys.codec.sizeHint(keys);
    size = size + _i8.DidSignature.codec.sizeHint(sig);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i7.AddKeys.codec.encodeTo(
      keys,
      output,
    );
    _i8.DidSignature.codec.encodeTo(
      sig,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddKeys && other.keys == keys && other.sig == sig;

  @override
  int get hashCode => Object.hash(
        keys,
        sig,
      );
}

/// See [`Pallet::remove_keys`].
class RemoveKeys extends Call {
  const RemoveKeys({
    required this.keys,
    required this.sig,
  });

  factory RemoveKeys._decode(_i1.Input input) {
    return RemoveKeys(
      keys: _i9.RemoveKeys.codec.decode(input),
      sig: _i8.DidSignature.codec.decode(input),
    );
  }

  /// RemoveKeys<T>
  final _i9.RemoveKeys keys;

  /// DidSignature<Controller>
  final _i8.DidSignature sig;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'remove_keys': {
          'keys': keys.toJson(),
          'sig': sig.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i9.RemoveKeys.codec.sizeHint(keys);
    size = size + _i8.DidSignature.codec.sizeHint(sig);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i9.RemoveKeys.codec.encodeTo(
      keys,
      output,
    );
    _i8.DidSignature.codec.encodeTo(
      sig,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveKeys && other.keys == keys && other.sig == sig;

  @override
  int get hashCode => Object.hash(
        keys,
        sig,
      );
}

/// See [`Pallet::add_controllers`].
class AddControllers extends Call {
  const AddControllers({
    required this.controllers,
    required this.sig,
  });

  factory AddControllers._decode(_i1.Input input) {
    return AddControllers(
      controllers: _i10.AddControllers.codec.decode(input),
      sig: _i8.DidSignature.codec.decode(input),
    );
  }

  /// AddControllers<T>
  final _i10.AddControllers controllers;

  /// DidSignature<Controller>
  final _i8.DidSignature sig;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'add_controllers': {
          'controllers': controllers.toJson(),
          'sig': sig.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i10.AddControllers.codec.sizeHint(controllers);
    size = size + _i8.DidSignature.codec.sizeHint(sig);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i10.AddControllers.codec.encodeTo(
      controllers,
      output,
    );
    _i8.DidSignature.codec.encodeTo(
      sig,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddControllers &&
          other.controllers == controllers &&
          other.sig == sig;

  @override
  int get hashCode => Object.hash(
        controllers,
        sig,
      );
}

/// See [`Pallet::remove_controllers`].
class RemoveControllers extends Call {
  const RemoveControllers({
    required this.controllers,
    required this.sig,
  });

  factory RemoveControllers._decode(_i1.Input input) {
    return RemoveControllers(
      controllers: _i11.RemoveControllers.codec.decode(input),
      sig: _i8.DidSignature.codec.decode(input),
    );
  }

  /// RemoveControllers<T>
  final _i11.RemoveControllers controllers;

  /// DidSignature<Controller>
  final _i8.DidSignature sig;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'remove_controllers': {
          'controllers': controllers.toJson(),
          'sig': sig.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i11.RemoveControllers.codec.sizeHint(controllers);
    size = size + _i8.DidSignature.codec.sizeHint(sig);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i11.RemoveControllers.codec.encodeTo(
      controllers,
      output,
    );
    _i8.DidSignature.codec.encodeTo(
      sig,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveControllers &&
          other.controllers == controllers &&
          other.sig == sig;

  @override
  int get hashCode => Object.hash(
        controllers,
        sig,
      );
}

/// See [`Pallet::add_service_endpoint`].
class AddServiceEndpoint extends Call {
  const AddServiceEndpoint({
    required this.serviceEndpoint,
    required this.sig,
  });

  factory AddServiceEndpoint._decode(_i1.Input input) {
    return AddServiceEndpoint(
      serviceEndpoint: _i12.AddServiceEndpoint.codec.decode(input),
      sig: _i8.DidSignature.codec.decode(input),
    );
  }

  /// AddServiceEndpoint<T>
  final _i12.AddServiceEndpoint serviceEndpoint;

  /// DidSignature<Controller>
  final _i8.DidSignature sig;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'add_service_endpoint': {
          'serviceEndpoint': serviceEndpoint.toJson(),
          'sig': sig.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i12.AddServiceEndpoint.codec.sizeHint(serviceEndpoint);
    size = size + _i8.DidSignature.codec.sizeHint(sig);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i12.AddServiceEndpoint.codec.encodeTo(
      serviceEndpoint,
      output,
    );
    _i8.DidSignature.codec.encodeTo(
      sig,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddServiceEndpoint &&
          other.serviceEndpoint == serviceEndpoint &&
          other.sig == sig;

  @override
  int get hashCode => Object.hash(
        serviceEndpoint,
        sig,
      );
}

/// See [`Pallet::remove_service_endpoint`].
class RemoveServiceEndpoint extends Call {
  const RemoveServiceEndpoint({
    required this.serviceEndpoint,
    required this.sig,
  });

  factory RemoveServiceEndpoint._decode(_i1.Input input) {
    return RemoveServiceEndpoint(
      serviceEndpoint: _i13.RemoveServiceEndpoint.codec.decode(input),
      sig: _i8.DidSignature.codec.decode(input),
    );
  }

  /// RemoveServiceEndpoint<T>
  final _i13.RemoveServiceEndpoint serviceEndpoint;

  /// DidSignature<Controller>
  final _i8.DidSignature sig;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'remove_service_endpoint': {
          'serviceEndpoint': serviceEndpoint.toJson(),
          'sig': sig.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i13.RemoveServiceEndpoint.codec.sizeHint(serviceEndpoint);
    size = size + _i8.DidSignature.codec.sizeHint(sig);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i13.RemoveServiceEndpoint.codec.encodeTo(
      serviceEndpoint,
      output,
    );
    _i8.DidSignature.codec.encodeTo(
      sig,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveServiceEndpoint &&
          other.serviceEndpoint == serviceEndpoint &&
          other.sig == sig;

  @override
  int get hashCode => Object.hash(
        serviceEndpoint,
        sig,
      );
}

/// See [`Pallet::remove_onchain_did`].
class RemoveOnchainDid extends Call {
  const RemoveOnchainDid({
    required this.removal,
    required this.sig,
  });

  factory RemoveOnchainDid._decode(_i1.Input input) {
    return RemoveOnchainDid(
      removal: _i14.DidRemoval.codec.decode(input),
      sig: _i8.DidSignature.codec.decode(input),
    );
  }

  /// DidRemoval<T>
  final _i14.DidRemoval removal;

  /// DidSignature<Controller>
  final _i8.DidSignature sig;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'remove_onchain_did': {
          'removal': removal.toJson(),
          'sig': sig.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i14.DidRemoval.codec.sizeHint(removal);
    size = size + _i8.DidSignature.codec.sizeHint(sig);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i14.DidRemoval.codec.encodeTo(
      removal,
      output,
    );
    _i8.DidSignature.codec.encodeTo(
      sig,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveOnchainDid && other.removal == removal && other.sig == sig;

  @override
  int get hashCode => Object.hash(
        removal,
        sig,
      );
}

/// See [`Pallet::noop`].
class Noop extends Call {
  const Noop({
    required this.s,
    required this.d,
  });

  factory Noop._decode(_i1.Input input) {
    return Noop(
      s: _i15.StateChange.codec.decode(input),
      d: _i16.AggregatedDidDetailsResponse.codec.decode(input),
    );
  }

  /// common::StateChange<'static, T>
  final _i15.StateChange s;

  /// AggregatedDidDetailsResponse<T>
  final _i16.AggregatedDidDetailsResponse d;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'noop': {
          's': s.toJson(),
          'd': d.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i15.StateChange.codec.sizeHint(s);
    size = size + _i16.AggregatedDidDetailsResponse.codec.sizeHint(d);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    _i15.StateChange.codec.encodeTo(
      s,
      output,
    );
    _i16.AggregatedDidDetailsResponse.codec.encodeTo(
      d,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Noop && other.s == s && other.d == d;

  @override
  int get hashCode => Object.hash(
        s,
        d,
      );
}
