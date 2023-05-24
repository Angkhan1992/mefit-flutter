// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:mefit/services/services.dart';

var baseURL = kDebugMode ? 'http://192.168.1.201:5000/api/v1' : '';

class APIMETHOD {
  static const GET = 'GET';
  static const POST = 'POST';
  static const PUT = 'PUT';
  static const DELETE = 'DELETE';
}

class MFNetworkResp {
  bool isSuccessful;
  String? message;
  dynamic data;
  int? code;
  DateTime? time;

  MFNetworkResp({
    required this.isSuccessful,
    this.message,
    this.data,
    this.code,
    this.time,
  });

  factory MFNetworkResp.fromResp(dynamic resp) {
    try {
      return MFNetworkResp(
        isSuccessful: resp['is_successful'] ?? false,
        message: resp['message'],
        data: resp['data'],
        code: resp['code'],
        time: DateTime.tryParse(resp['time']),
      );
    } catch (e) {
      Logger().e(e);

      return MFNetworkResp(
        isSuccessful: false,
        message: e.toString(),
        code: resp['code'],
        time: DateTime.tryParse(resp['time']),
      );
    }
  }
}

class NetworkService {
  static Future<Response> wrap(
    String path, {
    String method = APIMETHOD.GET,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? postParams,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        queryParameters: kQueryJson(queryParams),
        validateStatus: (status) => (status ?? 1) > 0,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) async {
          options.headers['APP-AUTH'] = 'mefit-laodev';
          options.headers['Content-Type'] = 'application/json';

          String? token = await PrefService.instance.getToken();
          if (token != null) {
            Logger().d('[NETWORK] TOKEN: $token');
            options.headers['Authorization'] = token;
          }

          options.headers['Platform'] = kIsWeb
              ? 'WEB'
              : Platform.isIOS
                  ? 'IOS'
                  : 'ANDROID';
          Logger().d(
            '[NETWORK] Request with headers: ${options.headers}',
          );
          return handler.next(options);
        },
        onError: (DioError e, handler) {
          Logger().e(e.response?.realUri);
          return handler.next(e);
        },
        onResponse: (Response response, handler) {
          Logger().d('''
[NETWORK] Got from url: ${response.realUri}
[NETWORK] Response with code: ${response.statusCode}
[NETWORK] Response with message: ${response.statusMessage}
''');
          return handler.next(response);
        },
      ),
    );

    Logger().d('''
[NETWORK] Sending ${method.toUpperCase()} request to: $path ...
[NETWORK] Request with queryParams: $queryParams
[NETWORK] Request with postParams: $postParams
    ''');

    Response response = await dio.request(
      path,
      data: kQueryJson(postParams) != null
          ? FormData.fromMap(kQueryJson(postParams)!)
          : {},
      options: Options(method: method),
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return response;
  }
}
