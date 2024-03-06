import 'package:DeCarbon/api/APIProvider.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

class MerchantsCouponRepository {
  static Future<dynamic> createCoupon({
    @required Map<String, dynamic> data,
  }) async {
    try {
      final response = await APIProvider.dio.post('/merchant/createCoupon',
          data: data, options: Options(headers: {"requiresToken": true}));
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getCouponList({
    @required String merchantsId,
    @required String storeId,
    @required String loginId,
    @required String loginType,
    String limit,
    String offset,
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/merchant/getCouponList',
        data: {
          "merchant_id": merchantsId,
          "store_id": storeId,
          "login_id": loginId,
          "login_type": loginType,
          "limit": limit,
          "offset": offset
        },
        options: buildCacheOptions(
          Duration(days: 7),
          options: Options(headers: {"requiresToken": true}),
        ),
      );
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getSpecificCoupon({
    @required String merchantsId,
    @required String storeId,
    @required String loginId,
    @required String loginType,
    @required String couponId,
  }) async {
    try {
      final response = await APIProvider.dio.post('/merchant/getSpecificCoupon',
          data: {
            "merchant_id": merchantsId,
            "store_id": storeId,
            "login_id": loginId,
            "login_type": loginType,
            "coupon_id": couponId,
          },
          options: Options(headers: {"requiresToken": true}));
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> redeemCoupon({
    @required String merchantsId,
    @required String storeId,
    @required String loginId,
    @required String loginType,
    @required String hash, //MD5(record_id|coupon_id|user_id)
  }) async {
    try {
      final response = await APIProvider.dio.post('/merchant/redeemUserCoupon',
          data: {
            "merchant_id": merchantsId,
            "store_id": storeId,
            "login_id": loginId,
            "login_type": loginType,
            "hash": hash,
          },
          options: Options(headers: {"requiresToken": true}));
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> updateSpecificCoupon({
    @required Map<String, dynamic> data,
  }) async {
    try {
      final response = await APIProvider.dio.post(
          '/merchant/updateSpecificCoupon',
          data: data,
          options: Options(headers: {"requiresToken": true}));
      // print(response);
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> deleteSpecificCoupon({
    @required String merchantsId,
    @required String storeId,
    @required String loginId,
    @required String loginType,
    @required String couponId,
  }) async {
    try {
      final response =
          await APIProvider.dio.post('/merchant/deleteSpecificCoupon',
              data: {
                "merchant_id": merchantsId,
                "store_id": storeId,
                "login_id": loginId,
                "login_type": loginType,
                "coupon_id": couponId,
              },
              options: Options(headers: {"requiresToken": true}));
      return response;
    } catch (e) {
      return e;
    }
  }
}
