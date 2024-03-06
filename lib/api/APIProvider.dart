import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:dio/dio.dart';
import 'package:DeCarbon/utility/http/HttpException.dart';
import 'package:DeCarbon/utility/log/DioLogger.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class APIProvider {
  static const String TAG = 'APIProvider';

  static const String _baseUrl =
      'https://f7p9waywv6.execute-api.us-east-2.amazonaws.com/v1';

  static Dio dio;
  final _storage = new FlutterSecureStorage();

  APIProvider() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = APIProvider._baseUrl;

    dio = Dio(dioOptions);

    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: _baseUrl)).interceptor);
    dio.interceptors.add(
      InterceptorsWrapper(
          onRequest: requestInterceptor,
          onResponse: (Response response) {
            DioLogger.onSuccess(TAG, response);
            return response;
          },
          onError: (DioError error) async {
            DioLogger.onError(TAG, error);
            // Do something with response error
            if (error.response?.statusCode == 401) {
              dio.interceptors.requestLock.lock();
              dio.interceptors.responseLock.lock();
              RequestOptions options = error.response.request;
              final session = await Amplify.Auth.fetchAuthSession(
                      options: CognitoSessionOptions(getAWSCredentials: true))
                  as dynamic;
              await _storage.write(
                  key: 'accessToken',
                  value: session.userPoolTokens.accessToken);
              String accessToken = await _storage.read(key: 'accessToken');
              options.headers[HttpHeaders.authorizationHeader] = accessToken;
              dio.interceptors.requestLock.unlock();
              dio.interceptors.responseLock.unlock();
              return dio.request(options.path,
                  data: options.data, options: options);
            } else {
              return error;
            }
          }),
    );
  }

  dynamic requestInterceptor(RequestOptions options) async {
    if (options.headers.containsKey("requiresToken")) {
      //remove the auxiliary header
      options.headers.remove("requiresToken");
      Map<String, String> user = await _storage.readAll();
      options.headers.addAll({
        HttpHeaders.authorizationHeader: "${user['accessToken']}",
      });
      DioLogger.onSend(TAG, options);
      return options;
    }
  }

  void throwIfNoSuccess(Response response) {
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw new HttpException(response);
    }
  }
}
