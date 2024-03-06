// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MerchantProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MerchantProfile _$_$_MerchantProfileFromJson(Map<String, dynamic> json) {
  return _$_MerchantProfile(
    json['merchant'] == null
        ? null
        : Merchant.fromJson(json['merchant'] as Map<String, dynamic>),
    json['store'] == null
        ? null
        : Store.fromJson(json['store'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MerchantProfileToJson(_$_MerchantProfile instance) =>
    <String, dynamic>{
      'merchant': instance.merchant?.toJson(),
      'store': instance.store?.toJson(),
    };
