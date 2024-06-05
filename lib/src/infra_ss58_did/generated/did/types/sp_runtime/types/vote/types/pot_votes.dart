// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i6;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../../../../softfloat/soft_f64/f64.dart' as _i5;
import '../../../../sp_core/crypto/account_id32.dart' as _i4;
import '../../../../tuples.dart' as _i2;
import '../../token/system_token_id.dart' as _i3;

class PotVotes {
  const PotVotes({
    required this.votes,
    required this.voteCount,
    required this.maxVoteCount,
  });

  factory PotVotes.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// BTreeMap<(SystemTokenId, VoteAccountId), VoteWeight>
  final Map<_i2.Tuple2<_i3.SystemTokenId, _i4.AccountId32>, _i5.F64> votes;

  /// u32
  final BigInt voteCount;

  /// u32
  final BigInt maxVoteCount;

  static const $PotVotesCodec codec = $PotVotesCodec();

  _i6.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'votes': votes.map((
          key,
          value,
        ) =>
            MapEntry(
              [
                key.value0.toJson(),
                key.value1.toList(),
              ],
              value,
            )),
        'voteCount': voteCount,
        'maxVoteCount': maxVoteCount,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is PotVotes &&
          _i7.mapsEqual(
            other.votes,
            votes,
          ) &&
          other.voteCount == voteCount &&
          other.maxVoteCount == maxVoteCount;

  @override
  int get hashCode => Object.hash(
        votes,
        voteCount,
        maxVoteCount,
      );
}

class $PotVotesCodec with _i1.Codec<PotVotes> {
  const $PotVotesCodec();

  @override
  void encodeTo(
    PotVotes obj,
    _i1.Output output,
  ) {
    const _i1
        .BTreeMapCodec<_i2.Tuple2<_i3.SystemTokenId, _i4.AccountId32>, _i5.F64>(
      keyCodec: _i2.Tuple2Codec<_i3.SystemTokenId, _i4.AccountId32>(
        _i3.SystemTokenId.codec,
        _i4.AccountId32Codec(),
      ),
      valueCodec: _i5.F64Codec(),
    ).encodeTo(
      obj.votes,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.voteCount,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.maxVoteCount,
      output,
    );
  }

  @override
  PotVotes decode(_i1.Input input) {
    return PotVotes(
      votes: const _i1.BTreeMapCodec<
          _i2.Tuple2<_i3.SystemTokenId, _i4.AccountId32>, _i5.F64>(
        keyCodec: _i2.Tuple2Codec<_i3.SystemTokenId, _i4.AccountId32>(
          _i3.SystemTokenId.codec,
          _i4.AccountId32Codec(),
        ),
        valueCodec: _i5.F64Codec(),
      ).decode(input),
      voteCount: _i1.CompactBigIntCodec.codec.decode(input),
      maxVoteCount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(PotVotes obj) {
    int size = 0;
    size = size +
        const _i1.BTreeMapCodec<_i2.Tuple2<_i3.SystemTokenId, _i4.AccountId32>,
            _i5.F64>(
          keyCodec: _i2.Tuple2Codec<_i3.SystemTokenId, _i4.AccountId32>(
            _i3.SystemTokenId.codec,
            _i4.AccountId32Codec(),
          ),
          valueCodec: _i5.F64Codec(),
        ).sizeHint(obj.votes);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.voteCount);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.maxVoteCount);
    return size;
  }
}
