import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

import '../APIProvider.dart';

class UsersRecordRepository {
  static Future<dynamic> getUserRecordList({
    @required String userId,
    @required String loginId,
    String date = "",
    String type = "",
    String limit = "",
    String offset = "",
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getUserRecords',
        data: {
          "user_id": userId,
          "login_id": loginId,
          "type": type,
          "date": date,
          "limit": limit,
          "offset": offset
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
