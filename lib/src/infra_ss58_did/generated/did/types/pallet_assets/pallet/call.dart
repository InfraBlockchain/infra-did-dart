// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_runtime/multiaddress/multi_address.dart' as _i3;
import '../../sp_runtime/types/token/fiat.dart' as _i4;

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

  Create create({
    required BigInt id,
    required _i3.MultiAddress admin,
    required BigInt minBalance,
  }) {
    return Create(
      id: id,
      admin: admin,
      minBalance: minBalance,
    );
  }

  ForceCreate forceCreate({
    required BigInt id,
    required _i3.MultiAddress owner,
    required bool isSufficient,
    required BigInt minBalance,
  }) {
    return ForceCreate(
      id: id,
      owner: owner,
      isSufficient: isSufficient,
      minBalance: minBalance,
    );
  }

  StartDestroy startDestroy({required BigInt id}) {
    return StartDestroy(id: id);
  }

  DestroyAccounts destroyAccounts({required BigInt id}) {
    return DestroyAccounts(id: id);
  }

  DestroyApprovals destroyApprovals({required BigInt id}) {
    return DestroyApprovals(id: id);
  }

  FinishDestroy finishDestroy({required BigInt id}) {
    return FinishDestroy(id: id);
  }

  Mint mint({
    required BigInt id,
    required _i3.MultiAddress beneficiary,
    required BigInt amount,
  }) {
    return Mint(
      id: id,
      beneficiary: beneficiary,
      amount: amount,
    );
  }

  Burn burn({
    required BigInt id,
    required _i3.MultiAddress who,
    required BigInt amount,
  }) {
    return Burn(
      id: id,
      who: who,
      amount: amount,
    );
  }

  Transfer transfer({
    required BigInt id,
    required _i3.MultiAddress target,
    required BigInt amount,
  }) {
    return Transfer(
      id: id,
      target: target,
      amount: amount,
    );
  }

  TransferKeepAlive transferKeepAlive({
    required BigInt id,
    required _i3.MultiAddress target,
    required BigInt amount,
  }) {
    return TransferKeepAlive(
      id: id,
      target: target,
      amount: amount,
    );
  }

  ForceTransfer forceTransfer({
    required BigInt id,
    required _i3.MultiAddress source,
    required _i3.MultiAddress dest,
    required BigInt amount,
  }) {
    return ForceTransfer(
      id: id,
      source: source,
      dest: dest,
      amount: amount,
    );
  }

  Freeze freeze({
    required BigInt id,
    required _i3.MultiAddress who,
  }) {
    return Freeze(
      id: id,
      who: who,
    );
  }

  Thaw thaw({
    required BigInt id,
    required _i3.MultiAddress who,
  }) {
    return Thaw(
      id: id,
      who: who,
    );
  }

  FreezeAsset freezeAsset({required BigInt id}) {
    return FreezeAsset(id: id);
  }

  ThawAsset thawAsset({required BigInt id}) {
    return ThawAsset(id: id);
  }

  TransferOwnership transferOwnership({
    required BigInt id,
    required _i3.MultiAddress owner,
  }) {
    return TransferOwnership(
      id: id,
      owner: owner,
    );
  }

  SetTeam setTeam({
    required BigInt id,
    required _i3.MultiAddress issuer,
    required _i3.MultiAddress admin,
    required _i3.MultiAddress freezer,
  }) {
    return SetTeam(
      id: id,
      issuer: issuer,
      admin: admin,
      freezer: freezer,
    );
  }

  SetMetadata setMetadata({
    required BigInt id,
    _i4.Fiat? currencyType,
    required List<int> name,
    required List<int> symbol,
    required int decimals,
  }) {
    return SetMetadata(
      id: id,
      currencyType: currencyType,
      name: name,
      symbol: symbol,
      decimals: decimals,
    );
  }

  ClearMetadata clearMetadata({required BigInt id}) {
    return ClearMetadata(id: id);
  }

  ForceSetMetadata forceSetMetadata({
    required BigInt id,
    required _i4.Fiat currencyType,
    required List<int> name,
    required List<int> symbol,
    required int decimals,
    required bool isFrozen,
  }) {
    return ForceSetMetadata(
      id: id,
      currencyType: currencyType,
      name: name,
      symbol: symbol,
      decimals: decimals,
      isFrozen: isFrozen,
    );
  }

  ForceClearMetadata forceClearMetadata({required BigInt id}) {
    return ForceClearMetadata(id: id);
  }

  ForceAssetStatus forceAssetStatus({
    required BigInt id,
    required _i3.MultiAddress owner,
    required _i3.MultiAddress issuer,
    required _i3.MultiAddress admin,
    required _i3.MultiAddress freezer,
    required BigInt minBalance,
    required bool isSufficient,
    required bool isFrozen,
  }) {
    return ForceAssetStatus(
      id: id,
      owner: owner,
      issuer: issuer,
      admin: admin,
      freezer: freezer,
      minBalance: minBalance,
      isSufficient: isSufficient,
      isFrozen: isFrozen,
    );
  }

  ApproveTransfer approveTransfer({
    required BigInt id,
    required _i3.MultiAddress delegate,
    required BigInt amount,
  }) {
    return ApproveTransfer(
      id: id,
      delegate: delegate,
      amount: amount,
    );
  }

  CancelApproval cancelApproval({
    required BigInt id,
    required _i3.MultiAddress delegate,
  }) {
    return CancelApproval(
      id: id,
      delegate: delegate,
    );
  }

  ForceCancelApproval forceCancelApproval({
    required BigInt id,
    required _i3.MultiAddress owner,
    required _i3.MultiAddress delegate,
  }) {
    return ForceCancelApproval(
      id: id,
      owner: owner,
      delegate: delegate,
    );
  }

  TransferApproved transferApproved({
    required BigInt id,
    required _i3.MultiAddress owner,
    required _i3.MultiAddress destination,
    required BigInt amount,
  }) {
    return TransferApproved(
      id: id,
      owner: owner,
      destination: destination,
      amount: amount,
    );
  }

  Touch touch({required BigInt id}) {
    return Touch(id: id);
  }

  Refund refund({
    required BigInt id,
    required bool allowBurn,
  }) {
    return Refund(
      id: id,
      allowBurn: allowBurn,
    );
  }

  SetMinBalance setMinBalance({
    required BigInt id,
    required BigInt minBalance,
  }) {
    return SetMinBalance(
      id: id,
      minBalance: minBalance,
    );
  }

  TouchOther touchOther({
    required BigInt id,
    required _i3.MultiAddress who,
  }) {
    return TouchOther(
      id: id,
      who: who,
    );
  }

  RefundOther refundOther({
    required BigInt id,
    required _i3.MultiAddress who,
  }) {
    return RefundOther(
      id: id,
      who: who,
    );
  }

  Block block({
    required BigInt id,
    required _i3.MultiAddress who,
  }) {
    return Block(
      id: id,
      who: who,
    );
  }

  ForceTransfer2 forceTransfer2({
    required BigInt id,
    required _i3.MultiAddress source,
    required _i3.MultiAddress dest,
    required BigInt amount,
  }) {
    return ForceTransfer2(
      id: id,
      source: source,
      dest: dest,
      amount: amount,
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
        return Create._decode(input);
      case 1:
        return ForceCreate._decode(input);
      case 2:
        return StartDestroy._decode(input);
      case 3:
        return DestroyAccounts._decode(input);
      case 4:
        return DestroyApprovals._decode(input);
      case 5:
        return FinishDestroy._decode(input);
      case 6:
        return Mint._decode(input);
      case 7:
        return Burn._decode(input);
      case 8:
        return Transfer._decode(input);
      case 9:
        return TransferKeepAlive._decode(input);
      case 10:
        return ForceTransfer._decode(input);
      case 11:
        return Freeze._decode(input);
      case 12:
        return Thaw._decode(input);
      case 13:
        return FreezeAsset._decode(input);
      case 14:
        return ThawAsset._decode(input);
      case 15:
        return TransferOwnership._decode(input);
      case 16:
        return SetTeam._decode(input);
      case 17:
        return SetMetadata._decode(input);
      case 18:
        return ClearMetadata._decode(input);
      case 19:
        return ForceSetMetadata._decode(input);
      case 20:
        return ForceClearMetadata._decode(input);
      case 21:
        return ForceAssetStatus._decode(input);
      case 22:
        return ApproveTransfer._decode(input);
      case 23:
        return CancelApproval._decode(input);
      case 24:
        return ForceCancelApproval._decode(input);
      case 25:
        return TransferApproved._decode(input);
      case 26:
        return Touch._decode(input);
      case 27:
        return Refund._decode(input);
      case 28:
        return SetMinBalance._decode(input);
      case 29:
        return TouchOther._decode(input);
      case 30:
        return RefundOther._decode(input);
      case 31:
        return Block._decode(input);
      case 32:
        return ForceTransfer2._decode(input);
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
      case Create:
        (value as Create).encodeTo(output);
        break;
      case ForceCreate:
        (value as ForceCreate).encodeTo(output);
        break;
      case StartDestroy:
        (value as StartDestroy).encodeTo(output);
        break;
      case DestroyAccounts:
        (value as DestroyAccounts).encodeTo(output);
        break;
      case DestroyApprovals:
        (value as DestroyApprovals).encodeTo(output);
        break;
      case FinishDestroy:
        (value as FinishDestroy).encodeTo(output);
        break;
      case Mint:
        (value as Mint).encodeTo(output);
        break;
      case Burn:
        (value as Burn).encodeTo(output);
        break;
      case Transfer:
        (value as Transfer).encodeTo(output);
        break;
      case TransferKeepAlive:
        (value as TransferKeepAlive).encodeTo(output);
        break;
      case ForceTransfer:
        (value as ForceTransfer).encodeTo(output);
        break;
      case Freeze:
        (value as Freeze).encodeTo(output);
        break;
      case Thaw:
        (value as Thaw).encodeTo(output);
        break;
      case FreezeAsset:
        (value as FreezeAsset).encodeTo(output);
        break;
      case ThawAsset:
        (value as ThawAsset).encodeTo(output);
        break;
      case TransferOwnership:
        (value as TransferOwnership).encodeTo(output);
        break;
      case SetTeam:
        (value as SetTeam).encodeTo(output);
        break;
      case SetMetadata:
        (value as SetMetadata).encodeTo(output);
        break;
      case ClearMetadata:
        (value as ClearMetadata).encodeTo(output);
        break;
      case ForceSetMetadata:
        (value as ForceSetMetadata).encodeTo(output);
        break;
      case ForceClearMetadata:
        (value as ForceClearMetadata).encodeTo(output);
        break;
      case ForceAssetStatus:
        (value as ForceAssetStatus).encodeTo(output);
        break;
      case ApproveTransfer:
        (value as ApproveTransfer).encodeTo(output);
        break;
      case CancelApproval:
        (value as CancelApproval).encodeTo(output);
        break;
      case ForceCancelApproval:
        (value as ForceCancelApproval).encodeTo(output);
        break;
      case TransferApproved:
        (value as TransferApproved).encodeTo(output);
        break;
      case Touch:
        (value as Touch).encodeTo(output);
        break;
      case Refund:
        (value as Refund).encodeTo(output);
        break;
      case SetMinBalance:
        (value as SetMinBalance).encodeTo(output);
        break;
      case TouchOther:
        (value as TouchOther).encodeTo(output);
        break;
      case RefundOther:
        (value as RefundOther).encodeTo(output);
        break;
      case Block:
        (value as Block).encodeTo(output);
        break;
      case ForceTransfer2:
        (value as ForceTransfer2).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case Create:
        return (value as Create)._sizeHint();
      case ForceCreate:
        return (value as ForceCreate)._sizeHint();
      case StartDestroy:
        return (value as StartDestroy)._sizeHint();
      case DestroyAccounts:
        return (value as DestroyAccounts)._sizeHint();
      case DestroyApprovals:
        return (value as DestroyApprovals)._sizeHint();
      case FinishDestroy:
        return (value as FinishDestroy)._sizeHint();
      case Mint:
        return (value as Mint)._sizeHint();
      case Burn:
        return (value as Burn)._sizeHint();
      case Transfer:
        return (value as Transfer)._sizeHint();
      case TransferKeepAlive:
        return (value as TransferKeepAlive)._sizeHint();
      case ForceTransfer:
        return (value as ForceTransfer)._sizeHint();
      case Freeze:
        return (value as Freeze)._sizeHint();
      case Thaw:
        return (value as Thaw)._sizeHint();
      case FreezeAsset:
        return (value as FreezeAsset)._sizeHint();
      case ThawAsset:
        return (value as ThawAsset)._sizeHint();
      case TransferOwnership:
        return (value as TransferOwnership)._sizeHint();
      case SetTeam:
        return (value as SetTeam)._sizeHint();
      case SetMetadata:
        return (value as SetMetadata)._sizeHint();
      case ClearMetadata:
        return (value as ClearMetadata)._sizeHint();
      case ForceSetMetadata:
        return (value as ForceSetMetadata)._sizeHint();
      case ForceClearMetadata:
        return (value as ForceClearMetadata)._sizeHint();
      case ForceAssetStatus:
        return (value as ForceAssetStatus)._sizeHint();
      case ApproveTransfer:
        return (value as ApproveTransfer)._sizeHint();
      case CancelApproval:
        return (value as CancelApproval)._sizeHint();
      case ForceCancelApproval:
        return (value as ForceCancelApproval)._sizeHint();
      case TransferApproved:
        return (value as TransferApproved)._sizeHint();
      case Touch:
        return (value as Touch)._sizeHint();
      case Refund:
        return (value as Refund)._sizeHint();
      case SetMinBalance:
        return (value as SetMinBalance)._sizeHint();
      case TouchOther:
        return (value as TouchOther)._sizeHint();
      case RefundOther:
        return (value as RefundOther)._sizeHint();
      case Block:
        return (value as Block)._sizeHint();
      case ForceTransfer2:
        return (value as ForceTransfer2)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::create`].
class Create extends Call {
  const Create({
    required this.id,
    required this.admin,
    required this.minBalance,
  });

  factory Create._decode(_i1.Input input) {
    return Create(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      admin: _i3.MultiAddress.codec.decode(input),
      minBalance: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress admin;

  /// T::Balance
  final BigInt minBalance;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'create': {
          'id': id,
          'admin': admin.toJson(),
          'minBalance': minBalance,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(admin);
    size = size + _i1.U128Codec.codec.sizeHint(minBalance);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      admin,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      minBalance,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Create &&
          other.id == id &&
          other.admin == admin &&
          other.minBalance == minBalance;

  @override
  int get hashCode => Object.hash(
        id,
        admin,
        minBalance,
      );
}

/// See [`Pallet::force_create`].
class ForceCreate extends Call {
  const ForceCreate({
    required this.id,
    required this.owner,
    required this.isSufficient,
    required this.minBalance,
  });

  factory ForceCreate._decode(_i1.Input input) {
    return ForceCreate(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      owner: _i3.MultiAddress.codec.decode(input),
      isSufficient: _i1.BoolCodec.codec.decode(input),
      minBalance: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress owner;

  /// bool
  final bool isSufficient;

  /// T::Balance
  final BigInt minBalance;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'force_create': {
          'id': id,
          'owner': owner.toJson(),
          'isSufficient': isSufficient,
          'minBalance': minBalance,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(owner);
    size = size + _i1.BoolCodec.codec.sizeHint(isSufficient);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(minBalance);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      owner,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      isSufficient,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      minBalance,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ForceCreate &&
          other.id == id &&
          other.owner == owner &&
          other.isSufficient == isSufficient &&
          other.minBalance == minBalance;

  @override
  int get hashCode => Object.hash(
        id,
        owner,
        isSufficient,
        minBalance,
      );
}

/// See [`Pallet::start_destroy`].
class StartDestroy extends Call {
  const StartDestroy({required this.id});

  factory StartDestroy._decode(_i1.Input input) {
    return StartDestroy(id: _i1.CompactBigIntCodec.codec.decode(input));
  }

  /// T::AssetIdParameter
  final BigInt id;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'start_destroy': {'id': id}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is StartDestroy && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// See [`Pallet::destroy_accounts`].
class DestroyAccounts extends Call {
  const DestroyAccounts({required this.id});

  factory DestroyAccounts._decode(_i1.Input input) {
    return DestroyAccounts(id: _i1.CompactBigIntCodec.codec.decode(input));
  }

  /// T::AssetIdParameter
  final BigInt id;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'destroy_accounts': {'id': id}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DestroyAccounts && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// See [`Pallet::destroy_approvals`].
class DestroyApprovals extends Call {
  const DestroyApprovals({required this.id});

  factory DestroyApprovals._decode(_i1.Input input) {
    return DestroyApprovals(id: _i1.CompactBigIntCodec.codec.decode(input));
  }

  /// T::AssetIdParameter
  final BigInt id;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'destroy_approvals': {'id': id}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DestroyApprovals && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// See [`Pallet::finish_destroy`].
class FinishDestroy extends Call {
  const FinishDestroy({required this.id});

  factory FinishDestroy._decode(_i1.Input input) {
    return FinishDestroy(id: _i1.CompactBigIntCodec.codec.decode(input));
  }

  /// T::AssetIdParameter
  final BigInt id;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'finish_destroy': {'id': id}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is FinishDestroy && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// See [`Pallet::mint`].
class Mint extends Call {
  const Mint({
    required this.id,
    required this.beneficiary,
    required this.amount,
  });

  factory Mint._decode(_i1.Input input) {
    return Mint(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      beneficiary: _i3.MultiAddress.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress beneficiary;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'mint': {
          'id': id,
          'beneficiary': beneficiary.toJson(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(beneficiary);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      beneficiary,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mint &&
          other.id == id &&
          other.beneficiary == beneficiary &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        id,
        beneficiary,
        amount,
      );
}

/// See [`Pallet::burn`].
class Burn extends Call {
  const Burn({
    required this.id,
    required this.who,
    required this.amount,
  });

  factory Burn._decode(_i1.Input input) {
    return Burn(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      who: _i3.MultiAddress.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress who;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'burn': {
          'id': id,
          'who': who.toJson(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(who);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      who,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Burn &&
          other.id == id &&
          other.who == who &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        id,
        who,
        amount,
      );
}

/// See [`Pallet::transfer`].
class Transfer extends Call {
  const Transfer({
    required this.id,
    required this.target,
    required this.amount,
  });

  factory Transfer._decode(_i1.Input input) {
    return Transfer(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      target: _i3.MultiAddress.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress target;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'transfer': {
          'id': id,
          'target': target.toJson(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(target);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      target,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Transfer &&
          other.id == id &&
          other.target == target &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        id,
        target,
        amount,
      );
}

/// See [`Pallet::transfer_keep_alive`].
class TransferKeepAlive extends Call {
  const TransferKeepAlive({
    required this.id,
    required this.target,
    required this.amount,
  });

  factory TransferKeepAlive._decode(_i1.Input input) {
    return TransferKeepAlive(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      target: _i3.MultiAddress.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress target;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'transfer_keep_alive': {
          'id': id,
          'target': target.toJson(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(target);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      target,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TransferKeepAlive &&
          other.id == id &&
          other.target == target &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        id,
        target,
        amount,
      );
}

/// See [`Pallet::force_transfer`].
class ForceTransfer extends Call {
  const ForceTransfer({
    required this.id,
    required this.source,
    required this.dest,
    required this.amount,
  });

  factory ForceTransfer._decode(_i1.Input input) {
    return ForceTransfer(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      source: _i3.MultiAddress.codec.decode(input),
      dest: _i3.MultiAddress.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress source;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress dest;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'force_transfer': {
          'id': id,
          'source': source.toJson(),
          'dest': dest.toJson(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(source);
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      source,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      dest,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ForceTransfer &&
          other.id == id &&
          other.source == source &&
          other.dest == dest &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        id,
        source,
        dest,
        amount,
      );
}

/// See [`Pallet::freeze`].
class Freeze extends Call {
  const Freeze({
    required this.id,
    required this.who,
  });

  factory Freeze._decode(_i1.Input input) {
    return Freeze(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      who: _i3.MultiAddress.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress who;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'freeze': {
          'id': id,
          'who': who.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
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
      other is Freeze && other.id == id && other.who == who;

  @override
  int get hashCode => Object.hash(
        id,
        who,
      );
}

/// See [`Pallet::thaw`].
class Thaw extends Call {
  const Thaw({
    required this.id,
    required this.who,
  });

  factory Thaw._decode(_i1.Input input) {
    return Thaw(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      who: _i3.MultiAddress.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress who;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'thaw': {
          'id': id,
          'who': who.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      12,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
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
      other is Thaw && other.id == id && other.who == who;

  @override
  int get hashCode => Object.hash(
        id,
        who,
      );
}

/// See [`Pallet::freeze_asset`].
class FreezeAsset extends Call {
  const FreezeAsset({required this.id});

  factory FreezeAsset._decode(_i1.Input input) {
    return FreezeAsset(id: _i1.CompactBigIntCodec.codec.decode(input));
  }

  /// T::AssetIdParameter
  final BigInt id;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'freeze_asset': {'id': id}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      13,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is FreezeAsset && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// See [`Pallet::thaw_asset`].
class ThawAsset extends Call {
  const ThawAsset({required this.id});

  factory ThawAsset._decode(_i1.Input input) {
    return ThawAsset(id: _i1.CompactBigIntCodec.codec.decode(input));
  }

  /// T::AssetIdParameter
  final BigInt id;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'thaw_asset': {'id': id}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      14,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ThawAsset && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// See [`Pallet::transfer_ownership`].
class TransferOwnership extends Call {
  const TransferOwnership({
    required this.id,
    required this.owner,
  });

  factory TransferOwnership._decode(_i1.Input input) {
    return TransferOwnership(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      owner: _i3.MultiAddress.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress owner;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'transfer_ownership': {
          'id': id,
          'owner': owner.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(owner);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      15,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      owner,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TransferOwnership && other.id == id && other.owner == owner;

  @override
  int get hashCode => Object.hash(
        id,
        owner,
      );
}

/// See [`Pallet::set_team`].
class SetTeam extends Call {
  const SetTeam({
    required this.id,
    required this.issuer,
    required this.admin,
    required this.freezer,
  });

  factory SetTeam._decode(_i1.Input input) {
    return SetTeam(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      issuer: _i3.MultiAddress.codec.decode(input),
      admin: _i3.MultiAddress.codec.decode(input),
      freezer: _i3.MultiAddress.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress issuer;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress admin;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress freezer;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'set_team': {
          'id': id,
          'issuer': issuer.toJson(),
          'admin': admin.toJson(),
          'freezer': freezer.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(issuer);
    size = size + _i3.MultiAddress.codec.sizeHint(admin);
    size = size + _i3.MultiAddress.codec.sizeHint(freezer);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      16,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      issuer,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      admin,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      freezer,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetTeam &&
          other.id == id &&
          other.issuer == issuer &&
          other.admin == admin &&
          other.freezer == freezer;

  @override
  int get hashCode => Object.hash(
        id,
        issuer,
        admin,
        freezer,
      );
}

/// See [`Pallet::set_metadata`].
class SetMetadata extends Call {
  const SetMetadata({
    required this.id,
    this.currencyType,
    required this.name,
    required this.symbol,
    required this.decimals,
  });

  factory SetMetadata._decode(_i1.Input input) {
    return SetMetadata(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      currencyType:
          const _i1.OptionCodec<_i4.Fiat>(_i4.Fiat.codec).decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      symbol: _i1.U8SequenceCodec.codec.decode(input),
      decimals: _i1.U8Codec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// Option<Fiat>
  final _i4.Fiat? currencyType;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> symbol;

  /// u8
  final int decimals;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'set_metadata': {
          'id': id,
          'currencyType': currencyType?.toJson(),
          'name': name,
          'symbol': symbol,
          'decimals': decimals,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size +
        const _i1.OptionCodec<_i4.Fiat>(_i4.Fiat.codec).sizeHint(currencyType);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(symbol);
    size = size + _i1.U8Codec.codec.sizeHint(decimals);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      17,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    const _i1.OptionCodec<_i4.Fiat>(_i4.Fiat.codec).encodeTo(
      currencyType,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      symbol,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      decimals,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetMetadata &&
          other.id == id &&
          other.currencyType == currencyType &&
          _i5.listsEqual(
            other.name,
            name,
          ) &&
          _i5.listsEqual(
            other.symbol,
            symbol,
          ) &&
          other.decimals == decimals;

  @override
  int get hashCode => Object.hash(
        id,
        currencyType,
        name,
        symbol,
        decimals,
      );
}

/// See [`Pallet::clear_metadata`].
class ClearMetadata extends Call {
  const ClearMetadata({required this.id});

  factory ClearMetadata._decode(_i1.Input input) {
    return ClearMetadata(id: _i1.CompactBigIntCodec.codec.decode(input));
  }

  /// T::AssetIdParameter
  final BigInt id;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'clear_metadata': {'id': id}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      18,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClearMetadata && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// See [`Pallet::force_set_metadata`].
class ForceSetMetadata extends Call {
  const ForceSetMetadata({
    required this.id,
    required this.currencyType,
    required this.name,
    required this.symbol,
    required this.decimals,
    required this.isFrozen,
  });

  factory ForceSetMetadata._decode(_i1.Input input) {
    return ForceSetMetadata(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      currencyType: _i4.Fiat.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      symbol: _i1.U8SequenceCodec.codec.decode(input),
      decimals: _i1.U8Codec.codec.decode(input),
      isFrozen: _i1.BoolCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// Fiat
  final _i4.Fiat currencyType;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> symbol;

  /// u8
  final int decimals;

  /// bool
  final bool isFrozen;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'force_set_metadata': {
          'id': id,
          'currencyType': currencyType.toJson(),
          'name': name,
          'symbol': symbol,
          'decimals': decimals,
          'isFrozen': isFrozen,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i4.Fiat.codec.sizeHint(currencyType);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(symbol);
    size = size + _i1.U8Codec.codec.sizeHint(decimals);
    size = size + _i1.BoolCodec.codec.sizeHint(isFrozen);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      19,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i4.Fiat.codec.encodeTo(
      currencyType,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      symbol,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      decimals,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      isFrozen,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ForceSetMetadata &&
          other.id == id &&
          other.currencyType == currencyType &&
          _i5.listsEqual(
            other.name,
            name,
          ) &&
          _i5.listsEqual(
            other.symbol,
            symbol,
          ) &&
          other.decimals == decimals &&
          other.isFrozen == isFrozen;

  @override
  int get hashCode => Object.hash(
        id,
        currencyType,
        name,
        symbol,
        decimals,
        isFrozen,
      );
}

/// See [`Pallet::force_clear_metadata`].
class ForceClearMetadata extends Call {
  const ForceClearMetadata({required this.id});

  factory ForceClearMetadata._decode(_i1.Input input) {
    return ForceClearMetadata(id: _i1.CompactBigIntCodec.codec.decode(input));
  }

  /// T::AssetIdParameter
  final BigInt id;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'force_clear_metadata': {'id': id}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      20,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ForceClearMetadata && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// See [`Pallet::force_asset_status`].
class ForceAssetStatus extends Call {
  const ForceAssetStatus({
    required this.id,
    required this.owner,
    required this.issuer,
    required this.admin,
    required this.freezer,
    required this.minBalance,
    required this.isSufficient,
    required this.isFrozen,
  });

  factory ForceAssetStatus._decode(_i1.Input input) {
    return ForceAssetStatus(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      owner: _i3.MultiAddress.codec.decode(input),
      issuer: _i3.MultiAddress.codec.decode(input),
      admin: _i3.MultiAddress.codec.decode(input),
      freezer: _i3.MultiAddress.codec.decode(input),
      minBalance: _i1.CompactBigIntCodec.codec.decode(input),
      isSufficient: _i1.BoolCodec.codec.decode(input),
      isFrozen: _i1.BoolCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress owner;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress issuer;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress admin;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress freezer;

  /// T::Balance
  final BigInt minBalance;

  /// bool
  final bool isSufficient;

  /// bool
  final bool isFrozen;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'force_asset_status': {
          'id': id,
          'owner': owner.toJson(),
          'issuer': issuer.toJson(),
          'admin': admin.toJson(),
          'freezer': freezer.toJson(),
          'minBalance': minBalance,
          'isSufficient': isSufficient,
          'isFrozen': isFrozen,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(owner);
    size = size + _i3.MultiAddress.codec.sizeHint(issuer);
    size = size + _i3.MultiAddress.codec.sizeHint(admin);
    size = size + _i3.MultiAddress.codec.sizeHint(freezer);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(minBalance);
    size = size + _i1.BoolCodec.codec.sizeHint(isSufficient);
    size = size + _i1.BoolCodec.codec.sizeHint(isFrozen);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      21,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      owner,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      issuer,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      admin,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      freezer,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      minBalance,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      isSufficient,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      isFrozen,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ForceAssetStatus &&
          other.id == id &&
          other.owner == owner &&
          other.issuer == issuer &&
          other.admin == admin &&
          other.freezer == freezer &&
          other.minBalance == minBalance &&
          other.isSufficient == isSufficient &&
          other.isFrozen == isFrozen;

  @override
  int get hashCode => Object.hash(
        id,
        owner,
        issuer,
        admin,
        freezer,
        minBalance,
        isSufficient,
        isFrozen,
      );
}

/// See [`Pallet::approve_transfer`].
class ApproveTransfer extends Call {
  const ApproveTransfer({
    required this.id,
    required this.delegate,
    required this.amount,
  });

  factory ApproveTransfer._decode(_i1.Input input) {
    return ApproveTransfer(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      delegate: _i3.MultiAddress.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress delegate;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'approve_transfer': {
          'id': id,
          'delegate': delegate.toJson(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(delegate);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      22,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      delegate,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ApproveTransfer &&
          other.id == id &&
          other.delegate == delegate &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        id,
        delegate,
        amount,
      );
}

/// See [`Pallet::cancel_approval`].
class CancelApproval extends Call {
  const CancelApproval({
    required this.id,
    required this.delegate,
  });

  factory CancelApproval._decode(_i1.Input input) {
    return CancelApproval(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      delegate: _i3.MultiAddress.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress delegate;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'cancel_approval': {
          'id': id,
          'delegate': delegate.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(delegate);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      23,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      delegate,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CancelApproval && other.id == id && other.delegate == delegate;

  @override
  int get hashCode => Object.hash(
        id,
        delegate,
      );
}

/// See [`Pallet::force_cancel_approval`].
class ForceCancelApproval extends Call {
  const ForceCancelApproval({
    required this.id,
    required this.owner,
    required this.delegate,
  });

  factory ForceCancelApproval._decode(_i1.Input input) {
    return ForceCancelApproval(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      owner: _i3.MultiAddress.codec.decode(input),
      delegate: _i3.MultiAddress.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress owner;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress delegate;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'force_cancel_approval': {
          'id': id,
          'owner': owner.toJson(),
          'delegate': delegate.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(owner);
    size = size + _i3.MultiAddress.codec.sizeHint(delegate);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      24,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      owner,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      delegate,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ForceCancelApproval &&
          other.id == id &&
          other.owner == owner &&
          other.delegate == delegate;

  @override
  int get hashCode => Object.hash(
        id,
        owner,
        delegate,
      );
}

/// See [`Pallet::transfer_approved`].
class TransferApproved extends Call {
  const TransferApproved({
    required this.id,
    required this.owner,
    required this.destination,
    required this.amount,
  });

  factory TransferApproved._decode(_i1.Input input) {
    return TransferApproved(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      owner: _i3.MultiAddress.codec.decode(input),
      destination: _i3.MultiAddress.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress owner;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress destination;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'transfer_approved': {
          'id': id,
          'owner': owner.toJson(),
          'destination': destination.toJson(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(owner);
    size = size + _i3.MultiAddress.codec.sizeHint(destination);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      25,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      owner,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      destination,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TransferApproved &&
          other.id == id &&
          other.owner == owner &&
          other.destination == destination &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        id,
        owner,
        destination,
        amount,
      );
}

/// See [`Pallet::touch`].
class Touch extends Call {
  const Touch({required this.id});

  factory Touch._decode(_i1.Input input) {
    return Touch(id: _i1.CompactBigIntCodec.codec.decode(input));
  }

  /// T::AssetIdParameter
  final BigInt id;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'touch': {'id': id}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      26,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Touch && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// See [`Pallet::refund`].
class Refund extends Call {
  const Refund({
    required this.id,
    required this.allowBurn,
  });

  factory Refund._decode(_i1.Input input) {
    return Refund(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      allowBurn: _i1.BoolCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// bool
  final bool allowBurn;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'refund': {
          'id': id,
          'allowBurn': allowBurn,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i1.BoolCodec.codec.sizeHint(allowBurn);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      27,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      allowBurn,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Refund && other.id == id && other.allowBurn == allowBurn;

  @override
  int get hashCode => Object.hash(
        id,
        allowBurn,
      );
}

/// See [`Pallet::set_min_balance`].
class SetMinBalance extends Call {
  const SetMinBalance({
    required this.id,
    required this.minBalance,
  });

  factory SetMinBalance._decode(_i1.Input input) {
    return SetMinBalance(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      minBalance: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// T::Balance
  final BigInt minBalance;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'set_min_balance': {
          'id': id,
          'minBalance': minBalance,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i1.U128Codec.codec.sizeHint(minBalance);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      28,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      minBalance,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetMinBalance &&
          other.id == id &&
          other.minBalance == minBalance;

  @override
  int get hashCode => Object.hash(
        id,
        minBalance,
      );
}

/// See [`Pallet::touch_other`].
class TouchOther extends Call {
  const TouchOther({
    required this.id,
    required this.who,
  });

  factory TouchOther._decode(_i1.Input input) {
    return TouchOther(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      who: _i3.MultiAddress.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress who;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'touch_other': {
          'id': id,
          'who': who.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      29,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
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
      other is TouchOther && other.id == id && other.who == who;

  @override
  int get hashCode => Object.hash(
        id,
        who,
      );
}

/// See [`Pallet::refund_other`].
class RefundOther extends Call {
  const RefundOther({
    required this.id,
    required this.who,
  });

  factory RefundOther._decode(_i1.Input input) {
    return RefundOther(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      who: _i3.MultiAddress.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress who;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'refund_other': {
          'id': id,
          'who': who.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      30,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
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
      other is RefundOther && other.id == id && other.who == who;

  @override
  int get hashCode => Object.hash(
        id,
        who,
      );
}

/// See [`Pallet::block`].
class Block extends Call {
  const Block({
    required this.id,
    required this.who,
  });

  factory Block._decode(_i1.Input input) {
    return Block(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      who: _i3.MultiAddress.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress who;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'block': {
          'id': id,
          'who': who.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      31,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
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
      other is Block && other.id == id && other.who == who;

  @override
  int get hashCode => Object.hash(
        id,
        who,
      );
}

/// See [`Pallet::force_transfer2`].
class ForceTransfer2 extends Call {
  const ForceTransfer2({
    required this.id,
    required this.source,
    required this.dest,
    required this.amount,
  });

  factory ForceTransfer2._decode(_i1.Input input) {
    return ForceTransfer2(
      id: _i1.CompactBigIntCodec.codec.decode(input),
      source: _i3.MultiAddress.codec.decode(input),
      dest: _i3.MultiAddress.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// T::AssetIdParameter
  final BigInt id;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress source;

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress dest;

  /// T::Balance
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'force_transfer2': {
          'id': id,
          'source': source.toJson(),
          'dest': dest.toJson(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(id);
    size = size + _i3.MultiAddress.codec.sizeHint(source);
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      32,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      id,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      source,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      dest,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ForceTransfer2 &&
          other.id == id &&
          other.source == source &&
          other.dest == dest &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        id,
        source,
        dest,
        amount,
      );
}
