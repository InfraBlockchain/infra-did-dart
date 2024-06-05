// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../sp_core/crypto/account_id32.dart' as _i3;

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

  Map<String, dynamic> toJson();
}

class $Call {
  const $Call();

  SetInvulnerables setInvulnerables({required List<_i3.AccountId32> new_}) {
    return SetInvulnerables(new_: new_);
  }

  SetDesiredCandidates setDesiredCandidates({required int max}) {
    return SetDesiredCandidates(max: max);
  }

  SetCandidacyBond setCandidacyBond({required BigInt bond}) {
    return SetCandidacyBond(bond: bond);
  }

  RegisterAsCandidate registerAsCandidate() {
    return RegisterAsCandidate();
  }

  LeaveIntent leaveIntent() {
    return LeaveIntent();
  }

  AddInvulnerable addInvulnerable({required _i3.AccountId32 who}) {
    return AddInvulnerable(who: who);
  }

  RemoveInvulnerable removeInvulnerable({required _i3.AccountId32 who}) {
    return RemoveInvulnerable(who: who);
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return SetInvulnerables._decode(input);
      case 1:
        return SetDesiredCandidates._decode(input);
      case 2:
        return SetCandidacyBond._decode(input);
      case 3:
        return const RegisterAsCandidate();
      case 4:
        return const LeaveIntent();
      case 5:
        return AddInvulnerable._decode(input);
      case 6:
        return RemoveInvulnerable._decode(input);
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
      case SetInvulnerables:
        (value as SetInvulnerables).encodeTo(output);
        break;
      case SetDesiredCandidates:
        (value as SetDesiredCandidates).encodeTo(output);
        break;
      case SetCandidacyBond:
        (value as SetCandidacyBond).encodeTo(output);
        break;
      case RegisterAsCandidate:
        (value as RegisterAsCandidate).encodeTo(output);
        break;
      case LeaveIntent:
        (value as LeaveIntent).encodeTo(output);
        break;
      case AddInvulnerable:
        (value as AddInvulnerable).encodeTo(output);
        break;
      case RemoveInvulnerable:
        (value as RemoveInvulnerable).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case SetInvulnerables:
        return (value as SetInvulnerables)._sizeHint();
      case SetDesiredCandidates:
        return (value as SetDesiredCandidates)._sizeHint();
      case SetCandidacyBond:
        return (value as SetCandidacyBond)._sizeHint();
      case RegisterAsCandidate:
        return 1;
      case LeaveIntent:
        return 1;
      case AddInvulnerable:
        return (value as AddInvulnerable)._sizeHint();
      case RemoveInvulnerable:
        return (value as RemoveInvulnerable)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::set_invulnerables`].
class SetInvulnerables extends Call {
  const SetInvulnerables({required this.new_});

  factory SetInvulnerables._decode(_i1.Input input) {
    return SetInvulnerables(
        new_: const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
            .decode(input));
  }

  /// Vec<T::AccountId>
  final List<_i3.AccountId32> new_;

  @override
  Map<String, Map<String, List<List<int>>>> toJson() => {
        'set_invulnerables': {
          'new': new_.map((value) => value.toList()).toList()
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
            .sizeHint(new_);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()).encodeTo(
      new_,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetInvulnerables &&
          _i4.listsEqual(
            other.new_,
            new_,
          );

  @override
  int get hashCode => new_.hashCode;
}

/// See [`Pallet::set_desired_candidates`].
class SetDesiredCandidates extends Call {
  const SetDesiredCandidates({required this.max});

  factory SetDesiredCandidates._decode(_i1.Input input) {
    return SetDesiredCandidates(max: _i1.U32Codec.codec.decode(input));
  }

  /// u32
  final int max;

  @override
  Map<String, Map<String, int>> toJson() => {
        'set_desired_candidates': {'max': max}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(max);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      max,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetDesiredCandidates && other.max == max;

  @override
  int get hashCode => max.hashCode;
}

/// See [`Pallet::set_candidacy_bond`].
class SetCandidacyBond extends Call {
  const SetCandidacyBond({required this.bond});

  factory SetCandidacyBond._decode(_i1.Input input) {
    return SetCandidacyBond(bond: _i1.U128Codec.codec.decode(input));
  }

  /// BalanceOf<T>
  final BigInt bond;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'set_candidacy_bond': {'bond': bond}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U128Codec.codec.sizeHint(bond);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      bond,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetCandidacyBond && other.bond == bond;

  @override
  int get hashCode => bond.hashCode;
}

/// See [`Pallet::register_as_candidate`].
class RegisterAsCandidate extends Call {
  const RegisterAsCandidate();

  @override
  Map<String, dynamic> toJson() => {'register_as_candidate': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is RegisterAsCandidate;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// See [`Pallet::leave_intent`].
class LeaveIntent extends Call {
  const LeaveIntent();

  @override
  Map<String, dynamic> toJson() => {'leave_intent': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is LeaveIntent;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// See [`Pallet::add_invulnerable`].
class AddInvulnerable extends Call {
  const AddInvulnerable({required this.who});

  factory AddInvulnerable._decode(_i1.Input input) {
    return AddInvulnerable(who: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'add_invulnerable': {'who': who.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AddInvulnerable &&
          _i4.listsEqual(
            other.who,
            who,
          );

  @override
  int get hashCode => who.hashCode;
}

/// See [`Pallet::remove_invulnerable`].
class RemoveInvulnerable extends Call {
  const RemoveInvulnerable({required this.who});

  factory RemoveInvulnerable._decode(_i1.Input input) {
    return RemoveInvulnerable(who: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'remove_invulnerable': {'who': who.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveInvulnerable &&
          _i4.listsEqual(
            other.who,
            who,
          );

  @override
  int get hashCode => who.hashCode;
}
