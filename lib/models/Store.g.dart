// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$_$_StoreFromJson(Map<String, dynamic> json) {
  return _$_Store(
    json['store_id'] as String,
    json['merchant_id'] as String,
    json['name'] as String,
    json['address'] as String,
    json['phone'] as String,
    json['opening_period'] as String,
    json['login_id'] as String,
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'store_id': instance.storeId,
      'merchant_id': instance.merchantId,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'opening_period': instance.openingPeriod,
      'login_id': instance.loginId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
