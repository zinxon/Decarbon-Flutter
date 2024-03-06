// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'Merchant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Merchant _$MerchantFromJson(Map<String, dynamic> json) {
  return _Merchant.fromJson(json);
}

class _$MerchantTearOff {
  const _$MerchantTearOff();

// ignore: unused_element
  _Merchant call(
      @JsonKey(name: 'merchant_id')
          String merchantId,
      String email,
      String name,
      String address,
      String phone,
      @JsonKey(name: 'opening_period')
          String openingPeriod,
      String description,
      String website,
      String openrice,
      String instagram,
      String facebook,
      @JsonKey(name: 'login_id')
          String loginId,
      @JsonKey(name: 'photo_url')
          String photoUrl,
      @JsonKey(name: 'business_registration_number')
          String businessRegistrationNumbe,
      String tags) {
    return _Merchant(
      merchantId,
      email,
      name,
      address,
      phone,
      openingPeriod,
      description,
      website,
      openrice,
      instagram,
      facebook,
      loginId,
      photoUrl,
      businessRegistrationNumbe,
      tags,
    );
  }
}

// ignore: unused_element
const $Merchant = _$MerchantTearOff();

mixin _$Merchant {
  @JsonKey(name: 'merchant_id')
  String get merchantId;
  String get email;
  String get name;
  String get address;
  String get phone;
  @JsonKey(name: 'opening_period')
  String get openingPeriod;
  String get description;
  String get website;
  String get openrice;
  String get instagram;
  String get facebook;
  @JsonKey(name: 'login_id')
  String get loginId;
  @JsonKey(name: 'photo_url')
  String get photoUrl;
  @JsonKey(name: 'business_registration_number')
  String get businessRegistrationNumbe;
  String get tags;

  Map<String, dynamic> toJson();
  $MerchantCopyWith<Merchant> get copyWith;
}

abstract class $MerchantCopyWith<$Res> {
  factory $MerchantCopyWith(Merchant value, $Res Function(Merchant) then) =
      _$MerchantCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'merchant_id')
          String merchantId,
      String email,
      String name,
      String address,
      String phone,
      @JsonKey(name: 'opening_period')
          String openingPeriod,
      String description,
      String website,
      String openrice,
      String instagram,
      String facebook,
      @JsonKey(name: 'login_id')
          String loginId,
      @JsonKey(name: 'photo_url')
          String photoUrl,
      @JsonKey(name: 'business_registration_number')
          String businessRegistrationNumbe,
      String tags});
}

class _$MerchantCopyWithImpl<$Res> implements $MerchantCopyWith<$Res> {
  _$MerchantCopyWithImpl(this._value, this._then);

  final Merchant _value;
  // ignore: unused_field
  final $Res Function(Merchant) _then;

  @override
  $Res call({
    Object merchantId = freezed,
    Object email = freezed,
    Object name = freezed,
    Object address = freezed,
    Object phone = freezed,
    Object openingPeriod = freezed,
    Object description = freezed,
    Object website = freezed,
    Object openrice = freezed,
    Object instagram = freezed,
    Object facebook = freezed,
    Object loginId = freezed,
    Object photoUrl = freezed,
    Object businessRegistrationNumbe = freezed,
    Object tags = freezed,
  }) {
    return _then(_value.copyWith(
      merchantId:
          merchantId == freezed ? _value.merchantId : merchantId as String,
      email: email == freezed ? _value.email : email as String,
      name: name == freezed ? _value.name : name as String,
      address: address == freezed ? _value.address : address as String,
      phone: phone == freezed ? _value.phone : phone as String,
      openingPeriod: openingPeriod == freezed
          ? _value.openingPeriod
          : openingPeriod as String,
      description:
          description == freezed ? _value.description : description as String,
      website: website == freezed ? _value.website : website as String,
      openrice: openrice == freezed ? _value.openrice : openrice as String,
      instagram: instagram == freezed ? _value.instagram : instagram as String,
      facebook: facebook == freezed ? _value.facebook : facebook as String,
      loginId: loginId == freezed ? _value.loginId : loginId as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      businessRegistrationNumbe: businessRegistrationNumbe == freezed
          ? _value.businessRegistrationNumbe
          : businessRegistrationNumbe as String,
      tags: tags == freezed ? _value.tags : tags as String,
    ));
  }
}

abstract class _$MerchantCopyWith<$Res> implements $MerchantCopyWith<$Res> {
  factory _$MerchantCopyWith(_Merchant value, $Res Function(_Merchant) then) =
      __$MerchantCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'merchant_id')
          String merchantId,
      String email,
      String name,
      String address,
      String phone,
      @JsonKey(name: 'opening_period')
          String openingPeriod,
      String description,
      String website,
      String openrice,
      String instagram,
      String facebook,
      @JsonKey(name: 'login_id')
          String loginId,
      @JsonKey(name: 'photo_url')
          String photoUrl,
      @JsonKey(name: 'business_registration_number')
          String businessRegistrationNumbe,
      String tags});
}

class __$MerchantCopyWithImpl<$Res> extends _$MerchantCopyWithImpl<$Res>
    implements _$MerchantCopyWith<$Res> {
  __$MerchantCopyWithImpl(_Merchant _value, $Res Function(_Merchant) _then)
      : super(_value, (v) => _then(v as _Merchant));

  @override
  _Merchant get _value => super._value as _Merchant;

  @override
  $Res call({
    Object merchantId = freezed,
    Object email = freezed,
    Object name = freezed,
    Object address = freezed,
    Object phone = freezed,
    Object openingPeriod = freezed,
    Object description = freezed,
    Object website = freezed,
    Object openrice = freezed,
    Object instagram = freezed,
    Object facebook = freezed,
    Object loginId = freezed,
    Object photoUrl = freezed,
    Object businessRegistrationNumbe = freezed,
    Object tags = freezed,
  }) {
    return _then(_Merchant(
      merchantId == freezed ? _value.merchantId : merchantId as String,
      email == freezed ? _value.email : email as String,
      name == freezed ? _value.name : name as String,
      address == freezed ? _value.address : address as String,
      phone == freezed ? _value.phone : phone as String,
      openingPeriod == freezed ? _value.openingPeriod : openingPeriod as String,
      description == freezed ? _value.description : description as String,
      website == freezed ? _value.website : website as String,
      openrice == freezed ? _value.openrice : openrice as String,
      instagram == freezed ? _value.instagram : instagram as String,
      facebook == freezed ? _value.facebook : facebook as String,
      loginId == freezed ? _value.loginId : loginId as String,
      photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      businessRegistrationNumbe == freezed
          ? _value.businessRegistrationNumbe
          : businessRegistrationNumbe as String,
      tags == freezed ? _value.tags : tags as String,
    ));
  }
}

@JsonSerializable()
class _$_Merchant with DiagnosticableTreeMixin implements _Merchant {
  const _$_Merchant(
      @JsonKey(name: 'merchant_id')
          this.merchantId,
      this.email,
      this.name,
      this.address,
      this.phone,
      @JsonKey(name: 'opening_period')
          this.openingPeriod,
      this.description,
      this.website,
      this.openrice,
      this.instagram,
      this.facebook,
      @JsonKey(name: 'login_id')
          this.loginId,
      @JsonKey(name: 'photo_url')
          this.photoUrl,
      @JsonKey(name: 'business_registration_number')
          this.businessRegistrationNumbe,
      this.tags)
      : assert(merchantId != null),
        assert(email != null),
        assert(name != null),
        assert(address != null),
        assert(phone != null),
        assert(openingPeriod != null),
        assert(description != null),
        assert(website != null),
        assert(openrice != null),
        assert(instagram != null),
        assert(facebook != null),
        assert(loginId != null),
        assert(photoUrl != null),
        assert(businessRegistrationNumbe != null),
        assert(tags != null);

  factory _$_Merchant.fromJson(Map<String, dynamic> json) =>
      _$_$_MerchantFromJson(json);

  @override
  @JsonKey(name: 'merchant_id')
  final String merchantId;
  @override
  final String email;
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
  final String description;
  @override
  final String website;
  @override
  final String openrice;
  @override
  final String instagram;
  @override
  final String facebook;
  @override
  @JsonKey(name: 'login_id')
  final String loginId;
  @override
  @JsonKey(name: 'photo_url')
  final String photoUrl;
  @override
  @JsonKey(name: 'business_registration_number')
  final String businessRegistrationNumbe;
  @override
  final String tags;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Merchant(merchantId: $merchantId, email: $email, name: $name, address: $address, phone: $phone, openingPeriod: $openingPeriod, description: $description, website: $website, openrice: $openrice, instagram: $instagram, facebook: $facebook, loginId: $loginId, photoUrl: $photoUrl, businessRegistrationNumbe: $businessRegistrationNumbe, tags: $tags)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Merchant'))
      ..add(DiagnosticsProperty('merchantId', merchantId))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('openingPeriod', openingPeriod))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('website', website))
      ..add(DiagnosticsProperty('openrice', openrice))
      ..add(DiagnosticsProperty('instagram', instagram))
      ..add(DiagnosticsProperty('facebook', facebook))
      ..add(DiagnosticsProperty('loginId', loginId))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty(
          'businessRegistrationNumbe', businessRegistrationNumbe))
      ..add(DiagnosticsProperty('tags', tags));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Merchant &&
            (identical(other.merchantId, merchantId) ||
                const DeepCollectionEquality()
                    .equals(other.merchantId, merchantId)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
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
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality()
                    .equals(other.website, website)) &&
            (identical(other.openrice, openrice) ||
                const DeepCollectionEquality()
                    .equals(other.openrice, openrice)) &&
            (identical(other.instagram, instagram) ||
                const DeepCollectionEquality()
                    .equals(other.instagram, instagram)) &&
            (identical(other.facebook, facebook) ||
                const DeepCollectionEquality()
                    .equals(other.facebook, facebook)) &&
            (identical(other.loginId, loginId) ||
                const DeepCollectionEquality()
                    .equals(other.loginId, loginId)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.businessRegistrationNumbe,
                    businessRegistrationNumbe) ||
                const DeepCollectionEquality().equals(
                    other.businessRegistrationNumbe,
                    businessRegistrationNumbe)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(merchantId) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(openingPeriod) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(website) ^
      const DeepCollectionEquality().hash(openrice) ^
      const DeepCollectionEquality().hash(instagram) ^
      const DeepCollectionEquality().hash(facebook) ^
      const DeepCollectionEquality().hash(loginId) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(businessRegistrationNumbe) ^
      const DeepCollectionEquality().hash(tags);

  @override
  _$MerchantCopyWith<_Merchant> get copyWith =>
      __$MerchantCopyWithImpl<_Merchant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MerchantToJson(this);
  }
}

abstract class _Merchant implements Merchant {
  const factory _Merchant(
      @JsonKey(name: 'merchant_id')
          String merchantId,
      String email,
      String name,
      String address,
      String phone,
      @JsonKey(name: 'opening_period')
          String openingPeriod,
      String description,
      String website,
      String openrice,
      String instagram,
      String facebook,
      @JsonKey(name: 'login_id')
          String loginId,
      @JsonKey(name: 'photo_url')
          String photoUrl,
      @JsonKey(name: 'business_registration_number')
          String businessRegistrationNumbe,
      String tags) = _$_Merchant;

  factory _Merchant.fromJson(Map<String, dynamic> json) = _$_Merchant.fromJson;

  @override
  @JsonKey(name: 'merchant_id')
  String get merchantId;
  @override
  String get email;
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
  String get description;
  @override
  String get website;
  @override
  String get openrice;
  @override
  String get instagram;
  @override
  String get facebook;
  @override
  @JsonKey(name: 'login_id')
  String get loginId;
  @override
  @JsonKey(name: 'photo_url')
  String get photoUrl;
  @override
  @JsonKey(name: 'business_registration_number')
  String get businessRegistrationNumbe;
  @override
  String get tags;
  @override
  _$MerchantCopyWith<_Merchant> get copyWith;
}
