import 'package:DeCarbon/api/APIProvider.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

class MerchantsActivityRepository {
  static Future<dynamic> createActivity({
    @required Map<String, dynamic> data,
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/merchant/createActivity',
        data: data,
        options: Options(headers: {"requiresToken": true}),
      );
// options: buildCacheOptions(
//           Duration(days: 7),
//           options: Options(headers: {"requiresToken": true}),
//         ),
      return response;
      // final tokens = await Cognito.getTokens();
      // final response = await Dio(
      //   BaseOptions(
      //     baseUrl: baseUrl,
      //     headers: {
      //       HttpHeaders.authorizationHeader: tokens.accessToken,
      //       HttpHeaders.contentTypeHeader: ContentType.json,
      //     },
      //   )
      // ).post(
      //   '/merchant/createActivity',
      //   data: data,
      // );
      // return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getActivityList({
    @required String merchantsId,
    @required String storeId,
    @required String loginId,
    @required String loginType,
    String limit = "",
    String offset = "",
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/merchant/getActivityList',
        data: {
          "merchant_id": merchantsId,
          "store_id": storeId,
          "login_id": loginId,
          "login_type": loginType,
          "limit": limit,
          "offset": offset
        },
        // options: Options(headers: {"requiresToken": true}));
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

  static Future<dynamic> getSpecificActivity({
    @required String merchantsId,
    @required String storeId,
    @required String loginId,
    @required String loginType,
    @required String activityId,
  }) async {
    try {
      final response =
          await APIProvider.dio.post('/merchant/getSpecificActivity',
              data: {
                "merchant_id": merchantsId,
                "store_id": storeId,
                "login_id": loginId,
                "login_type": loginType,
                "activity_id": activityId,
              },
              options: Options(headers: {"requiresToken": true}));
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> addUserToActivity({
    @required String merchantsId,
    @required String storeId,
    @required String loginId,
    @required String loginType,
    @required String userId,
    @required String activityId,
    @required int coins,
    String remarks = '',
  }) async {
    try {
      final response = await APIProvider.dio.post('/merchant/addUserToActivity',
          data: {
            "merchant_id": merchantsId,
            "store_id": storeId,
            "login_id": loginId,
            "login_type": loginType,
            "user_id": userId,
            "activity_id": activityId,
            "coins": coins,
            "remarks": remarks
          },
          options: Options(headers: {"requiresToken": true}));
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> updateSpecificActivity({
    @required Map<String, dynamic> data,
  }) async {
    try {
      final response = await APIProvider.dio.post(
          '/merchant/updateSpecificActivity',
          data: data,
          options: Options(headers: {"requiresToken": true}));
      // print(data);
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> deleteSpecificMerchantsActivity({
    @required String activityId,
    @required String merchantsId,
    @required String storeId,
    @required String loginId,
    @required String loginType,
  }) async {
    try {
      final response =
          await APIProvider.dio.post('/merchant/deleteSpecificActivity',
              data: {
                "activity_id": activityId,
                "merchant_id": merchantsId,
                "store_id": storeId,
                "login_id": loginId,
                "login_type": loginType,
              },
              options: Options(headers: {"requiresToken": true}));
      // print(response);
      return response;
    } catch (e) {
      return e;
    }
  }
}
