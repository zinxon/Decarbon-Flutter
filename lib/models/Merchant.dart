import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'Merchant.g.dart';
part 'Merchant.freezed.dart';

@freezed
abstract class Merchant with _$Merchant {
  const factory Merchant(
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
      String tags) = _Merchant;
  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
}
