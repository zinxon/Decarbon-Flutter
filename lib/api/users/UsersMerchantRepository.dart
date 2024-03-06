import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

import '../APIProvider.dart';

class UsersMerchantRepository {
  static Future<dynamic> getMerchantList({
    dynamic latitude = "",
    dynamic longitude = "",
    dynamic limit = "",
    dynamic offset = "",
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getMerchantList',
        data: {
          "latitude": latitude,
          "longitude": longitude,
          "limit": limit,
          "offset": offset,
        },
        options: Options(headers: {"requiresToken": true}),
      );
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getSpecificMerchant({
    @required String merchantId,
    @required String storeId,
    dynamic latitude = "",
    dynamic longitude = "",
    @required String userId,
    String loginId = "",
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getSpecificMerchant',
        data: {
          "merchant_id": merchantId,
          "store_id": storeId,
          "latitude": latitude,
          "longitude": longitude,
          "user_id": userId,
          "login_id": loginId,
        },
        options: buildCacheOptions(
          Duration(days: 0),
          options: Options(headers: {"requiresToken": true}),
        ),
      );
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getSpecificMerchantActivityList(
      {@required String merchantId,
      dynamic limit = "",
      dynamic offset = ""}) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getSpecificMerchantActivityList',
        data: {
          "merchant_id": merchantId,
          "limit": limit,
          "offset": offset,
        },
        options: Options(headers: {"requiresToken": true}),
      );
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getSpecificMerchantCouponList({
    @required String merchantId,
    dynamic limit = "",
    dynamic offset = "",
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getSpecificMerchantCouponList',
        data: {
          "merchant_id": merchantId,
          "limit": limit,
          "offset": offset,
        },
        options: Options(headers: {"requiresToken": true}),
      );
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getMapOfMerchantList({
    dynamic latitude = "",
    dynamic longitude = "",
    dynamic limit = "",
    dynamic offset = "",
    dynamic shop = "",
    dynamic price = "",
    dynamic region = "",
    dynamic search = "",
    dynamic distance = "",
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getMapOfMerchantList',
        data: {
          "latitude": latitude,
          "longitude": longitude,
          "limit": limit,
          "offset": offset,
          "shop": shop,
          "price": price,
          "region": region,
          "search": search,
          "distance": distance,
        },
        options: buildCacheOptions(
          Duration(days: 0),
          options: Options(headers: {"requiresToken": true}),
        ),
      );
      return response;
    } catch (e) {
      return e;
    }
  }
}
