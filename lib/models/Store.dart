import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'Store.freezed.dart';
part 'Store.g.dart';

@freezed
abstract class Store with _$Store {
  const factory Store(
    @JsonKey(name: 'store_id') String storeId,
    @JsonKey(name: 'merchant_id') String merchantId,
    String name,
    String address,
    String phone,
    @JsonKey(name: 'opening_period') String openingPeriod,
    @JsonKey(name: 'login_id') String loginId,
    double latitude,
    double longitude,
  ) = _Store;
  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
