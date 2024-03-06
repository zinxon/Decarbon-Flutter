import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

import '../APIProvider.dart';

class UsersProfileRepository {
  static Future<dynamic> getUserProfile({@required String loginId}) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getUserProfile',
        data: {'login_id': loginId},
        options: buildCacheOptions(
          Duration(minutes: 0),
          options: Options(headers: {"requiresToken": true}),
        ),
      );
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> updateUser({@required Map data}) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/updateUser',
        data: data,
        options: Options(headers: {"requiresToken": true}),
      );
      return response;
    } catch (e) {
      return e;
    }
  }
}
