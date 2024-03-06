// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'Store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

class _$StoreTearOff {
  const _$StoreTearOff();

// ignore: unused_element
  _Store call(
      @JsonKey(name: 'store_id') String storeId,
      @JsonKey(name: 'merchant_id') String merchantId,
      String name,
      String address,
      String phone,
      @JsonKey(name: 'opening_period') String openingPeriod,
      @JsonKey(name: 'login_id') String loginId,
      double latitude,
      double longitude) {
    return _Store(
      storeId,
      merchantId,
      name,
      address,
      phone,
      openingPeriod,
      loginId,
      latitude,
      longitude,
    );
  }
}

// ignore: unused_element
const $Store = _$StoreTearOff();

mixin _$Store {
  @JsonKey(name: 'store_id')
  String get storeId;
  @JsonKey(name: 'merchant_id')
  String get merchantId;
  String get name;
  String get address;
  String get phone;
  @JsonKey(name: 'opening_period')
  String get openingPeriod;
  @JsonKey(name: 'login_id')
  String get loginId;
  double get latitude;
  double get longitude;

  Map<String, dynamic> toJson();
  $StoreCopyWith<Store> get copyWith;
}

abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'store_id') String storeId,
      @JsonKey(name: 'merchant_id') String merchantId,
      String name,
      String address,
      String phone,
      @JsonKey(name: 'opening_period') String openingPeriod,
      @JsonKey(name: 'login_id') String loginId,
      double latitude,
      double longitude});
}

class _$StoreCopyWithImpl<$Res> implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  final Store _value;
  // ignore: unused_field
  final $Res Function(Store) _then;

  @override
  $Res call({
    Object storeId = freezed,
    Object merchantId = freezed,
    Object name = freezed,
    Object address = freezed,
    Object phone = freezed,
    Object openingPeriod = freezed,
    Object loginId = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
  }) {
    return _then(_value.copyWith(
      storeId: storeId == freezed ? _value.storeId : storeId as String,
      merchantId:
          merchantId == freezed ? _value.merchantId : merchantId as String,
      name: name == freezed ? _value.name : name as String,
      address: address == freezed ? _value.address : address as String,
      phone: phone == freezed ? _value.phone : phone as String,
      openingPeriod: openingPeriod == freezed
          ? _value.openingPeriod
          : openingPeriod as String,
      loginId: loginId == freezed ? _value.loginId : loginId as String,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
    ));
  }
}

abstract class _$StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$StoreCopyWith(_Store value, $Res Function(_Store) then) =
      __$StoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'store_id') String storeId,
      @JsonKey(name: 'merchant_id') String merchantId,
      String name,
      String address,
      String phone,
      @JsonKey(name: 'opening_period') String openingPeriod,
      @JsonKey(name: 'login_id') String loginId,
      double latitude,
      double longitude});
}

class __$StoreCopyWithImpl<$Res> extends _$StoreCopyWithImpl<$Res>
    implements _$StoreCopyWith<$Res> {
  __$StoreCopyWithImpl(_Store _value, $Res Function(_Store) _then)
      : super(_value, (v) => _then(v as _Store));

  @override
  _Store get _value => super._value as _Store;

  @override
  $Res call({
    Object storeId = freezed,
    Object merchantId = freezed,
    Object name = freezed,
    Object address = freezed,
    Object phone = freezed,
    Object openingPeriod = freezed,
    Object loginId = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
  }) {
    return _then(_Store(
      storeId == freezed ? _value.storeId : storeId as String,
      merchantId == freezed ? _value.merchantId : merchantId as String,
      name == freezed ? _value.name : name as String,
      address == freezed ? _value.address : address as String,
      phone == freezed ? _value.phone : phone as String,
      openingPeriod == freezed ? _value.openingPeriod : openingPeriod as String,
      loginId == freezed ? _value.loginId : loginId as String,
      latitude == freezed ? _value.latitude : latitude as double,
      longitude == freezed ? _value.longitude : longitude as double,
    ));
  }
}

@JsonSerializable()
class _$_Store with DiagnosticableTreeMixin implements _Store {
  const _$_Store(
      @JsonKey(name: 'store_id') this.storeId,
      @JsonKey(name: 'merchant_id') this.merchantId,
      this.name,
      this.address,
      this.phone,
      @JsonKey(name: 'opening_period') this.openingPeriod,
      @JsonKey(name: 'login_id') this.loginId,
      this.latitude,
      this.longitude)
      : assert(storeId != null),
        assert(merchantId != null),
        assert(name != null),
        assert(address != null),
        assert(phone != null),
        assert(openingPeriod != null),
        assert(loginId != null),
        assert(latitude != null),
        assert(longitude != null);

  factory _$_Store.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreFromJson(json);

  @override
  @JsonKey(name: 'store_id')
  final String storeId;
  @override
  @JsonKey(name: 'merchant_id')
  final String merchantId;
  @override
  final String name;
  @override
  final String address;
  @override
  final String phone;
  @override
  @JsonKey(name: 'opening_period')
  final String openingPeriod;
  @override
  @JsonKey(name: 'login_id')
  final String loginId;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Store(storeId: $storeId, merchantId: $merchantId, name: $name, address: $address, phone: $phone, openingPeriod: $openingPeriod, loginId: $loginId, latitude: $latitude, longitude: $longitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Store'))
      ..add(DiagnosticsProperty('storeId', storeId))
      ..add(DiagnosticsProperty('merchantId', merchantId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('openingPeriod', openingPeriod))
      ..add(DiagnosticsProperty('loginId', loginId))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Store &&
            (identical(other.storeId, storeId) ||
                const DeepCollectionEquality()
                    .equals(other.storeId, storeId)) &&
            (identical(other.merchantId, merchantId) ||
                const DeepCollectionEquality()
                    .equals(other.merchantId, merchantId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.openingPeriod, openingPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.openingPeriod, openingPeriod)) &&
            (identical(other.loginId, loginId) ||
                const DeepCollectionEquality()
                    .equals(other.loginId, loginId)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(storeId) ^
      const DeepCollectionEquality().hash(merchantId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(openingPeriod) ^
      const DeepCollectionEquality().hash(loginId) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude);

  @override
  _$StoreCopyWith<_Store> get copyWith =>
      __$StoreCopyWithImpl<_Store>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoreToJson(this);
  }
}

abstract class _Store implements Store {
  const factory _Store(
      @JsonKey(name: 'store_id') String storeId,
      @JsonKey(name: 'merchant_id') String merchantId,
      String name,
      String address,
      String phone,
      @JsonKey(name: 'opening_period') String openingPeriod,
      @JsonKey(name: 'login_id') String loginId,
      double latitude,
      double longitude) = _$_Store;

  factory _Store.fromJson(Map<String, dynamic> json) = _$_Store.fromJson;

  @override
  @JsonKey(name: 'store_id')
  String get storeId;
  @override
  @JsonKey(name: 'merchant_id')
  String get merchantId;
  @override
  String get name;
  @override
  String get address;
  @override
  String get phone;
  @override
  @JsonKey(name: 'opening_period')
  String get openingPeriod;
  @override
  @JsonKey(name: 'login_id')
  String get loginId;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  _$StoreCopyWith<_Store> get copyWith;
}
