import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:food_client/enums.dart';
import 'package:food_client/failure.dart';

abstract class IApiClient {
  TaskEither<Failure, Response> request({
    required String path,
    RequestType requestType = RequestType.post,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Object? body,
  });
}

class ApiService extends IApiClient {
  ApiService(String baseUrl, {required this.unauthenticatedCallback}) : _baseApiUrl = baseUrl {
    _dio = Dio(
      BaseOptions(
          baseUrl: _baseApiUrl,
          contentType: 'application/json',
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          followRedirects: false,
          maxRedirects: 0,
          headers: {
            'X-Requested-With': 'XMLHttpRequest',
          }),
    )
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      )
      ..interceptors.add(UnauthenticatedInterceptor(unauthenticatedCallback: unauthenticatedCallback));
  }

  final String _baseApiUrl;
  final VoidCallback unauthenticatedCallback;
  static late Dio _dio;

  Unit setAccessToken(String token) {
    _dio.options.headers.clear();
    _dio.options.headers.putIfAbsent(
      'X-Requested-With',
      () => 'XMLHttpRequest',
    );
    _dio.options.headers.putIfAbsent(
      'Authorization',
      () => 'Bearer $token',
    );
    return unit;
  }

  @override
  TaskEither<Failure, Response> request({
    required String path,
    RequestType requestType = RequestType.post,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Object? body,
  }) =>
      TaskEither.tryCatch(
        () async {
          switch (requestType) {
            case RequestType.get:
              return _dio.get(
                path,
                queryParameters: queryParameters,
                options: options,
                data: body,
              );
            case RequestType.post:
              return _dio.post(
                path,
                queryParameters: queryParameters,
                options: options,
                data: body,
              );
            case RequestType.put:
              return _dio.put(
                path,
                queryParameters: queryParameters,
                options: options,
                data: body,
              );
            case RequestType.delete:
              return _dio.delete(
                path,
                queryParameters: queryParameters,
                options: options,
                data: body,
              );
          }
        },
        (error, stackTrace) => APIFailure(
          error: error,
          stackTrace: stackTrace,
        ),
      );
}

class UnauthenticatedInterceptor extends Interceptor {
  final VoidCallback unauthenticatedCallback;
  UnauthenticatedInterceptor({required this.unauthenticatedCallback});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      unauthenticatedCallback.call();
    }
    super.onError(err, handler);
  }
}
