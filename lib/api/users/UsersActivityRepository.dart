import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

import '../APIProvider.dart';

class UsersActivityRepository {
  static Future<dynamic> getActivityList({
    dynamic latitude = "",
    dynamic longitude = "",
    dynamic limit = "",
    dynamic offset = "",
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getActivityList',
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

  static Future<dynamic> getUserActivityRecordList({
    @required String userId,
    @required String loginId,
    String limit = "",
    String offset = "",
    int status = 1,
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getUserActivity',
        data: {
          "user_id": userId,
          "login_id": loginId,
          "limit": limit,
          "offset": offset,
          "status": status,
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

  static Future<dynamic> getSpecificActivity({
    @required String activityId,
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getSpecificActivity',
        data: {
          "activity_id": activityId,
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
