// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i8;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i9;

import '../Attestation/attestation.dart' as _i7;
import '../Controller/controller.dart' as _i5;
import '../Did/did.dart' as _i2;
import '../DidKeyWithId/did_key_with_id.dart' as _i4;
import '../ServiceEndpointWithId/service_endpoint_with_id.dart' as _i6;
import '../StoredDidDetails/stored_did_details.dart' as _i3;

class AggregatedDidDetailsResponse {
  const AggregatedDidDetailsResponse({
    required this.did,
    required this.details,
    this.keys,
    this.controllers,
    this.serviceEndpoints,
    this.attestation,
  });

  factory AggregatedDidDetailsResponse.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Did
  final _i2.Did did;

  /// StoredDidDetails<T>
  final _i3.StoredDidDetails details;

  /// Option<Vec<DidKeyWithId>>
  final List<_i4.DidKeyWithId>? keys;

  /// Option<Vec<Controller>>
  final List<_i5.Controller>? controllers;

  /// Option<Vec<ServiceEndpointWithId<T>>>
  final List<_i6.ServiceEndpointWithId>? serviceEndpoints;

  /// Option<Attestation<T>>
  final _i7.Attestation? attestation;

  static const $AggregatedDidDetailsResponseCodec codec =
      $AggregatedDidDetailsResponseCodec();

  _i8.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'did': did.toList(),
        'details': details.toJson(),
        'keys': keys?.map((value) => value.toJson()).toList(),
        'controllers': controllers?.map((value) => value.toList()).toList(),
        'serviceEndpoints':
            serviceEndpoints?.map((value) => value.toJson()).toList(),
        'attestation': attestation?.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AggregatedDidDetailsResponse &&
          _i9.listsEqual(
            other.did,
            did,
          ) &&
          other.details == details &&
          other.keys == keys &&
          other.controllers == controllers &&
          other.serviceEndpoints == serviceEndpoints &&
          other.attestation == attestation;

  @override
  int get hashCode => Object.hash(
        did,
        details,
        keys,
        controllers,
        serviceEndpoints,
        attestation,
      );
}

class $AggregatedDidDetailsResponseCodec
    with _i1.Codec<AggregatedDidDetailsResponse> {
  const $AggregatedDidDetailsResponseCodec();

  @override
  void encodeTo(
    AggregatedDidDetailsResponse obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.did,
      output,
    );
    _i3.StoredDidDetails.codec.encodeTo(
      obj.details,
      output,
    );
    const _i1.OptionCodec<List<_i4.DidKeyWithId>>(
            _i1.SequenceCodec<_i4.DidKeyWithId>(_i4.DidKeyWithId.codec))
        .encodeTo(
      obj.keys,
      output,
    );
    const _i1.OptionCodec<List<_i5.Controller>>(
            _i1.SequenceCodec<_i5.Controller>(_i5.ControllerCodec()))
        .encodeTo(
      obj.controllers,
      output,
    );
    const _i1.OptionCodec<List<_i6.ServiceEndpointWithId>>(
            _i1.SequenceCodec<_i6.ServiceEndpointWithId>(
                _i6.ServiceEndpointWithId.codec))
        .encodeTo(
      obj.serviceEndpoints,
      output,
    );
    const _i1.OptionCodec<_i7.Attestation>(_i7.Attestation.codec).encodeTo(
      obj.attestation,
      output,
    );
  }

  @override
  AggregatedDidDetailsResponse decode(_i1.Input input) {
    return AggregatedDidDetailsResponse(
      did: const _i1.U8ArrayCodec(32).decode(input),
      details: _i3.StoredDidDetails.codec.decode(input),
      keys: const _i1.OptionCodec<List<_i4.DidKeyWithId>>(
              _i1.SequenceCodec<_i4.DidKeyWithId>(_i4.DidKeyWithId.codec))
          .decode(input),
      controllers: const _i1.OptionCodec<List<_i5.Controller>>(
              _i1.SequenceCodec<_i5.Controller>(_i5.ControllerCodec()))
          .decode(input),
      serviceEndpoints: const _i1.OptionCodec<List<_i6.ServiceEndpointWithId>>(
              _i1.SequenceCodec<_i6.ServiceEndpointWithId>(
                  _i6.ServiceEndpointWithId.codec))
          .decode(input),
      attestation: const _i1.OptionCodec<_i7.Attestation>(_i7.Attestation.codec)
          .decode(input),
    );
  }

  @override
  int sizeHint(AggregatedDidDetailsResponse obj) {
    int size = 0;
    size = size + const _i2.DidCodec().sizeHint(obj.did);
    size = size + _i3.StoredDidDetails.codec.sizeHint(obj.details);
    size = size +
        const _i1.OptionCodec<List<_i4.DidKeyWithId>>(
                _i1.SequenceCodec<_i4.DidKeyWithId>(_i4.DidKeyWithId.codec))
            .sizeHint(obj.keys);
    size = size +
        const _i1.OptionCodec<List<_i5.Controller>>(
                _i1.SequenceCodec<_i5.Controller>(_i5.ControllerCodec()))
            .sizeHint(obj.controllers);
    size = size +
        const _i1.OptionCodec<List<_i6.ServiceEndpointWithId>>(
                _i1.SequenceCodec<_i6.ServiceEndpointWithId>(
                    _i6.ServiceEndpointWithId.codec))
            .sizeHint(obj.serviceEndpoints);
    size = size +
        const _i1.OptionCodec<_i7.Attestation>(_i7.Attestation.codec)
            .sizeHint(obj.attestation);
    return size;
  }
}
