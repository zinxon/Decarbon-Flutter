import 'package:DeCarbon/api/APIProvider.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

class MerchantsRecordRepository {
  static Future<dynamic> getMerchantRecords({
    @required String merchantsId,
    @required String storeId,
    @required String loginId,
    @required String loginType,
    String date = "",
    String limit = "",
    String offset = "",
  }) async {
    try {
      final response = await APIProvider.dio.post(
        '/merchant/getMerchantRecords',
        data: {
          "merchant_id": merchantsId,
          "store_id": storeId,
          "login_id": loginId,
          "login_type": loginType,
          "date": date,
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
}
