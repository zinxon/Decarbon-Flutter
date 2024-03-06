// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'MerchantProfile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MerchantProfile _$MerchantProfileFromJson(Map<String, dynamic> json) {
  return _MerchantProfile.fromJson(json);
}

class _$MerchantProfileTearOff {
  const _$MerchantProfileTearOff();

// ignore: unused_element
  _MerchantProfile call(Merchant merchant, Store store) {
    return _MerchantProfile(
      merchant,
      store,
    );
  }
}

// ignore: unused_element
const $MerchantProfile = _$MerchantProfileTearOff();

mixin _$MerchantProfile {
  Merchant get merchant;
  Store get store;

  Map<String, dynamic> toJson();
  $MerchantProfileCopyWith<MerchantProfile> get copyWith;
}

abstract class $MerchantProfileCopyWith<$Res> {
  factory $MerchantProfileCopyWith(
          MerchantProfile value, $Res Function(MerchantProfile) then) =
      _$MerchantProfileCopyWithImpl<$Res>;
  $Res call({Merchant merchant, Store store});

  $MerchantCopyWith<$Res> get merchant;
  $StoreCopyWith<$Res> get store;
}

class _$MerchantProfileCopyWithImpl<$Res>
    implements $MerchantProfileCopyWith<$Res> {
  _$MerchantProfileCopyWithImpl(this._value, this._then);

  final MerchantProfile _value;
  // ignore: unused_field
  final $Res Function(MerchantProfile) _then;

  @override
  $Res call({
    Object merchant = freezed,
    Object store = freezed,
  }) {
    return _then(_value.copyWith(
      merchant: merchant == freezed ? _value.merchant : merchant as Merchant,
      store: store == freezed ? _value.store : store as Store,
    ));
  }

  @override
  $MerchantCopyWith<$Res> get merchant {
    if (_value.merchant == null) {
      return null;
    }
    return $MerchantCopyWith<$Res>(_value.merchant, (value) {
      return _then(_value.copyWith(merchant: value));
    });
  }

  @override
  $StoreCopyWith<$Res> get store {
    if (_value.store == null) {
      return null;
    }
    return $StoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value));
    });
  }
}

abstract class _$MerchantProfileCopyWith<$Res>
    implements $MerchantProfileCopyWith<$Res> {
  factory _$MerchantProfileCopyWith(
          _MerchantProfile value, $Res Function(_MerchantProfile) then) =
      __$MerchantProfileCopyWithImpl<$Res>;
  @override
  $Res call({Merchant merchant, Store store});

  @override
  $MerchantCopyWith<$Res> get merchant;
  @override
  $StoreCopyWith<$Res> get store;
}

class __$MerchantProfileCopyWithImpl<$Res>
    extends _$MerchantProfileCopyWithImpl<$Res>
    implements _$MerchantProfileCopyWith<$Res> {
  __$MerchantProfileCopyWithImpl(
      _MerchantProfile _value, $Res Function(_MerchantProfile) _then)
      : super(_value, (v) => _then(v as _MerchantProfile));

  @override
  _MerchantProfile get _value => super._value as _MerchantProfile;

  @override
  $Res call({
    Object merchant = freezed,
    Object store = freezed,
  }) {
    return _then(_MerchantProfile(
      merchant == freezed ? _value.merchant : merchant as Merchant,
      store == freezed ? _value.store : store as Store,
    ));
  }
}

@JsonSerializable(explicitToJson: true)
class _$_MerchantProfile
    with DiagnosticableTreeMixin
    implements _MerchantProfile {
  const _$_MerchantProfile(this.merchant, this.store)
      : assert(merchant != null),
        assert(store != null);

  factory _$_MerchantProfile.fromJson(Map<String, dynamic> json) =>
      _$_$_MerchantProfileFromJson(json);

  @override
  final Merchant merchant;
  @override
  final Store store;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MerchantProfile(merchant: $merchant, store: $store)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MerchantProfile'))
      ..add(DiagnosticsProperty('merchant', merchant))
      ..add(DiagnosticsProperty('store', store));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MerchantProfile &&
            (identical(other.merchant, merchant) ||
                const DeepCollectionEquality()
                    .equals(other.merchant, merchant)) &&
            (identical(other.store, store) ||
                const DeepCollectionEquality().equals(other.store, store)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(merchant) ^
      const DeepCollectionEquality().hash(store);

  @override
  _$MerchantProfileCopyWith<_MerchantProfile> get copyWith =>
      __$MerchantProfileCopyWithImpl<_MerchantProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MerchantProfileToJson(this);
  }
}

abstract class _MerchantProfile implements MerchantProfile {
  const factory _MerchantProfile(Merchant merchant, Store store) =
      _$_MerchantProfile;

  factory _MerchantProfile.fromJson(Map<String, dynamic> json) =
      _$_MerchantProfile.fromJson;

  @override
  Merchant get merchant;
  @override
  Store get store;
  @override
  _$MerchantProfileCopyWith<_MerchantProfile> get copyWith;
}
