// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:typed_data' as _i7;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i5;

import '../types/AddBlob/add_blob.dart' as _i9;
import '../types/BlobOwner/blob_owner.dart' as _i3;
import '../types/BoundedBytes/bounded_bytes_4.dart' as _i4;
import '../types/did_core/modules/blob/pallet/call.dart' as _i11;
import '../types/did_runtime/runtime_call.dart' as _i8;
import '../types/DidSignature/did_signature_3.dart' as _i10;
import '../types/tuples.dart' as _i2;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<List<int>, _i2.Tuple2<_i3.BlobOwner, _i4.BoundedBytes>>
      _blobs = const _i1
          .StorageMap<List<int>, _i2.Tuple2<_i3.BlobOwner, _i4.BoundedBytes>>(
    prefix: 'BlobStore',
    storage: 'Blobs',
    valueCodec: _i2.Tuple2Codec<_i3.BlobOwner, _i4.BoundedBytes>(
      _i3.BlobOwnerCodec(),
      _i4.BoundedBytesCodec(),
    ),
    hasher: _i1.StorageHasher.blake2b128Concat(_i5.U8ArrayCodec(32)),
  );

  _i6.Future<_i2.Tuple2<_i3.BlobOwner, _i4.BoundedBytes>?> blobs(
    List<int> key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _blobs.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _blobs.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `blobs`.
  _i7.Uint8List blobsKey(List<int> key1) {
    final hashedKey = _blobs.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `blobs`.
  _i7.Uint8List blobsMapPrefix() {
    final hashedKey = _blobs.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::new`].
  _i8.RuntimeCall new_({
    required _i9.AddBlob blob,
    required _i10.DidSignature signature,
  }) {
    final _call = _i11.Call.values.new_(
      blob: blob,
      signature: signature,
    );
    return _i8.RuntimeCall.values.blobStore(_call);
  }
}
