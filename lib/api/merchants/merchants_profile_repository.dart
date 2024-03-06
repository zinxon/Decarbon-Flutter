import 'package:DeCarbon/api/APIProvider.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

class MerchantsProfileRepository {
  final APIProvider _apiProvider;

  MerchantsProfileRepository(this._apiProvider) : assert(_apiProvider != null);

  static Future<dynamic> updateMerchant(
      {@required Map<String, dynamic> data}) async {
    try {
      final response = await APIProvider.dio.post('/merchant/updateMerchant',
          data: data, options: Options(headers: {"requiresToken": true}));
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getMerchantProfile({@required String loginId}) async {
    try {
      final response = await APIProvider.dio.post(
        '/merchant/getMerchantProfile',
        data: {'login_id': loginId},
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

  static Future<dynamic> addCoins({
    @required String merchantsId,
    @required String storeId,
    @required String loginId,
    @required String loginType,
    @required String userId,
    @required int coins,
    String remarks = '',
  }) async {
    try {
      final response = await APIProvider.dio.post('/merchant/addCoins',
          data: {
            "merchant_id": merchantsId,
            "store_id": storeId,
            "login_id": loginId,
            "login_type": loginType,
            "user_id": userId,
            "coins": coins,
            "remarks": remarks
          },
          options: Options(headers: {"requiresToken": true}));
      return response;
    } catch (e) {
      return e;
    }
  }
}
