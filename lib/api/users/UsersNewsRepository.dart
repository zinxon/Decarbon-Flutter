import 'package:dio/dio.dart';

import '../APIProvider.dart';

class UsersNewsRepository{
  static Future<dynamic> getNewsList ({
    dynamic limit = '',
    dynamic offset = '',
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/user/getNewsList',
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
}