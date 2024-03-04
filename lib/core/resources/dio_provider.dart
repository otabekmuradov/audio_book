import 'package:audio_book/core/resources/app_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class DioProvider implements IDioProvider {
  var client = Dio(BaseOptions(
    baseUrl: AppKeys.audioBookInfoEndpoint,
  ));
  static DioProvider? _instance;

  static DioProvider get getInstance => _instance = _instance ?? DioProvider();
  DioProvider() {
    client.options.baseUrl = AppKeys.audioBookInfoEndpoint;
    client.interceptors.addAll(
      [
        if (kDebugMode)
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        InterceptorsWrapper(
          onRequest: (options, handler) {
            var customHeaders = {
              'Content-type': 'application/json',
              'Accept': 'application/json',
            };
            options.headers.addAll(customHeaders);
            return handler.next(options);
          },
          onError: (error, handler) async {
            if (error.response?.statusCode == 500) {
              return handler.resolve(error.response!);
            }
            return handler.next(error);
          },
        ),
      ],
    );
  }

  @override
  Dio getHttpClient() {
    return client;
  }
}

abstract class IDioProvider {
  Dio? getHttpClient();
}
