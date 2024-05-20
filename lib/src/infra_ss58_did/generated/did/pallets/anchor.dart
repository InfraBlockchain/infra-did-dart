// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/did_core/modules/anchor/pallet/call.dart' as _i7;
import '../types/did_runtime/runtime_call.dart' as _i6;
import '../types/primitive_types/h256.dart' as _i2;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.H256, int> _anchors =
      const _i1.StorageMap<_i2.H256, int>(
    prefix: 'Anchor',
    storage: 'Anchors',
    valueCodec: _i3.U32Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.H256Codec()),
  );

  _i4.Future<int?> anchors(
    _i2.H256 key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _anchors.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _anchors.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `anchors`.
  _i5.Uint8List anchorsKey(_i2.H256 key1) {
    final hashedKey = _anchors.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `anchors`.
  _i5.Uint8List anchorsMapPrefix() {
    final hashedKey = _anchors.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::deploy`].
  _i6.RuntimeCall deploy({required List<int> data}) {
    final _call = _i7.Call.values.deploy(data: data);
    return _i6.RuntimeCall.values.anchor(_call);
  }
}
