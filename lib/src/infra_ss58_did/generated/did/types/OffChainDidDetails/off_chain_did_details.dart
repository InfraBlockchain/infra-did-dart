// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../OffChainDidDocRef/off_chain_did_doc_ref.dart' as _i3;
import '../sp_core/crypto/account_id32.dart' as _i2;

class OffChainDidDetails {
  const OffChainDidDetails({
    required this.accountId,
    required this.docRef,
  });

  factory OffChainDidDetails.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// T::AccountId
  final _i2.AccountId32 accountId;

  /// OffChainDidDocRef<T>
  final _i3.OffChainDidDocRef docRef;

  static const $OffChainDidDetailsCodec codec = $OffChainDidDetailsCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'accountId': accountId.toList(),
        'docRef': docRef.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is OffChainDidDetails &&
          _i5.listsEqual(
            other.accountId,
            accountId,
          ) &&
          other.docRef == docRef;

  @override
  int get hashCode => Object.hash(
        accountId,
        docRef,
      );
}

class $OffChainDidDetailsCodec with _i1.Codec<OffChainDidDetails> {
  const $OffChainDidDetailsCodec();

  @override
  void encodeTo(
    OffChainDidDetails obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.accountId,
      output,
    );
    _i3.OffChainDidDocRef.codec.encodeTo(
      obj.docRef,
      output,
    );
  }

  @override
  OffChainDidDetails decode(_i1.Input input) {
    return OffChainDidDetails(
      accountId: const _i1.U8ArrayCodec(32).decode(input),
      docRef: _i3.OffChainDidDocRef.codec.decode(input),
    );
  }

  @override
  int sizeHint(OffChainDidDetails obj) {
    int size = 0;
    size = size + const _i2.AccountId32Codec().sizeHint(obj.accountId);
    size = size + _i3.OffChainDidDocRef.codec.sizeHint(obj.docRef);
    return size;
  }
}
