import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

import '../APIProvider.dart';

class UsersCouponRepository {
  static Future<dynamic> getCouponList({
    dynamic latitude = "",
    dynamic longitude = "",
    dynamic limit = '',
    dynamic offset = '',
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getCouponList',
        data: {
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

  static Future<dynamic> getCouponRecord({
    @required String userId,
    @required String loginId,
    dynamic limit = '',
    dynamic offset = '',
    @required status,
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getCouponRecord',
        data: {
          "user_id": userId,
          "login_id": loginId,
          "limit": limit,
          "offset": offset,
          "status": status,
        },
        options: Options(headers: {"requiresToken": true}),
      );
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getSpecificCoupon({
    @required String couponId,
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getSpecificCoupon',
        data: {
          "coupon_id": couponId,
        },
        options: buildCacheOptions(
          Duration(hours: 0),
          options: Options(headers: {"requiresToken": true}),
        ),
      );
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> redeemCoupon({
    @required String userId,
    @required String loginId,
    @required String couponId,
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/redeemCoupon',
        data: {
          "user_id": userId,
          "login_id": loginId,
          "coupon_id": couponId,
        },
        options: buildCacheOptions(
          Duration(hours: 0),
          options: Options(headers: {"requiresToken": true}),
        ),
      );
      return response;
    } catch (e) {
      return e;
    }
  }
}
