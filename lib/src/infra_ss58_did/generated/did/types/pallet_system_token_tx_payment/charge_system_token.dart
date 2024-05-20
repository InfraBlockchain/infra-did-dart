// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../sp_core/crypto/account_id32.dart' as _i3;
import '../sp_runtime/types/token/system_token_id.dart' as _i2;

class ChargeSystemToken {
  const ChargeSystemToken({
    required this.tip,
    this.systemTokenId,
    this.voteCandidate,
  });

  factory ChargeSystemToken.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// BalanceOf<T>
  final BigInt tip;

  /// Option<SystemTokenId>
  final _i2.SystemTokenId? systemTokenId;

  /// Option<VoteAccountId>
  final _i3.AccountId32? voteCandidate;

  static const $ChargeSystemTokenCodec codec = $ChargeSystemTokenCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'tip': tip,
        'systemTokenId': systemTokenId?.toJson(),
        'voteCandidate': voteCandidate?.toList(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ChargeSystemToken &&
          other.tip == tip &&
          other.systemTokenId == systemTokenId &&
          other.voteCandidate == voteCandidate;

  @override
  int get hashCode => Object.hash(
        tip,
        systemTokenId,
        voteCandidate,
      );
}

class $ChargeSystemTokenCodec with _i1.Codec<ChargeSystemToken> {
  const $ChargeSystemTokenCodec();

  @override
  void encodeTo(
    ChargeSystemToken obj,
    _i1.Output output,
  ) {
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.tip,
      output,
    );
    const _i1.OptionCodec<_i2.SystemTokenId>(_i2.SystemTokenId.codec).encodeTo(
      obj.systemTokenId,
      output,
    );
    const _i1.OptionCodec<_i3.AccountId32>(_i3.AccountId32Codec()).encodeTo(
      obj.voteCandidate,
      output,
    );
  }

  @override
  ChargeSystemToken decode(_i1.Input input) {
    return ChargeSystemToken(
      tip: _i1.CompactBigIntCodec.codec.decode(input),
      systemTokenId:
          const _i1.OptionCodec<_i2.SystemTokenId>(_i2.SystemTokenId.codec)
              .decode(input),
      voteCandidate:
          const _i1.OptionCodec<_i3.AccountId32>(_i3.AccountId32Codec())
              .decode(input),
    );
  }

  @override
  int sizeHint(ChargeSystemToken obj) {
    int size = 0;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.tip);
    size = size +
        const _i1.OptionCodec<_i2.SystemTokenId>(_i2.SystemTokenId.codec)
            .sizeHint(obj.systemTokenId);
    size = size +
        const _i1.OptionCodec<_i3.AccountId32>(_i3.AccountId32Codec())
            .sizeHint(obj.voteCandidate);
    return size;
  }
}
