// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Merchant _$_$_MerchantFromJson(Map<String, dynamic> json) {
  return _$_Merchant(
    json['merchant_id'] as String,
    json['email'] as String,
    json['name'] as String,
    json['address'] as String,
    json['phone'] as String,
    json['opening_period'] as String,
    json['description'] as String,
    json['website'] as String,
    json['openrice'] as String,
    json['instagram'] as String,
    json['facebook'] as String,
    json['login_id'] as String,
    json['photo_url'] as String,
    json['business_registration_number'] as String,
    json['tags'] as String,
  );
}

Map<String, dynamic> _$_$_MerchantToJson(_$_Merchant instance) =>
    <String, dynamic>{
      'merchant_id': instance.merchantId,
      'email': instance.email,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'opening_period': instance.openingPeriod,
      'description': instance.description,
      'website': instance.website,
      'openrice': instance.openrice,
      'instagram': instance.instagram,
      'facebook': instance.facebook,
      'login_id': instance.loginId,
      'photo_url': instance.photoUrl,
      'business_registration_number': instance.businessRegistrationNumbe,
      'tags': instance.tags,
    };
