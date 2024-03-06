import 'package:DeCarbon/models/Merchant.dart';
import 'package:DeCarbon/models/Store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'MerchantProfile.freezed.dart';
part 'MerchantProfile.g.dart';

@freezed
abstract class MerchantProfile with _$MerchantProfile {
  @JsonSerializable(explicitToJson: true)
  const factory MerchantProfile(Merchant merchant, Store store) =
      _MerchantProfile;
  factory MerchantProfile.fromJson(Map<String, dynamic> json) =>
      _$MerchantProfileFromJson(json);
}
