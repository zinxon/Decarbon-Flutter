import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

import '../APIProvider.dart';

class UsersFavouriteRepository {
  static Future<dynamic> getUserFavouriteList({
    @required String userId,
    @required String loginId,
    dynamic limit = "",
    dynamic offset = "",
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getUserFavouriteList',
        data: {
          "user_id": userId,
          "login_id": loginId,
          "limit": limit,
          "offset": offset,
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

  static Future<dynamic> updateUserFavouriteList({
    @required String userId,
    @required String loginId,
    @required String merchantId,
    @required String storeId,
    @required int status,
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/updateFavouriteList',
        data: {
          "user_id": userId,
          "login_id": loginId,
          "merchant_id": merchantId,
          "store_id": storeId,
          "status": status,
        },
        options: Options(headers: {"requiresToken": true}),
      );
      return response;
    } catch (e) {
      return e;
    }
  }
}
