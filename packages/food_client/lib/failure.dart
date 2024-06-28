import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:food_localization/food_localization.dart';

abstract class Failure {
  const Failure();

  Map<String, String> get message;
}

class APIFailure extends Failure {
  APIFailure({this.error, this.stackTrace});

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Map<String, String> get message {
    Map<String, String>? errorMessage;

    if (error != null) {
      if (error! is DioException) {
        DioException? exception = error! as DioException?;
        if (exception?.error is SocketException ||
            exception?.type == DioExceptionType.connectionTimeout) {
          if (exception?.type == DioExceptionType.connectionTimeout) {
            return {'connection_timeout': LocaleKeys.connection_time_out_msg.tr()};
          } else {
            return {'no_connection': LocaleKeys.no_connection.tr()};
          }
        } else {
          final error = (exception?.response?.data is Map<String, dynamic>)
              ? (exception?.response?.data['errors'] is Map<String, dynamic>)
                  ? exception?.response?.data['errors'] as Map<String, dynamic>
                  : null
              : null;
          if (error != null) {
            errorMessage = (error.keys.first.isNotEmpty && error.values.first is Iterable)
                ? {error.keys.first: error.values.first[0]}
                : (error['message'] != null)
                    ? {'message': (error['message'] ?? LocaleKeys.error.tr())}
                    : null;
          } else {
            if (exception?.response?.data is Map<String, dynamic>) {
              if (exception?.response?.data['message'] != null &&
                  exception?.response?.statusCode != 500 &&
                  exception?.response?.statusCode != 400) {
                errorMessage = {'message': (exception?.response?.data['message'] ?? '') as String};
              }
            }
          }
        }
      } else if (error! is FirebaseException) {
        FirebaseException? exception = error! as FirebaseException?;
        errorMessage = {'message': (exception?.message ?? '')};
      } else if (error! is SocketException) {
        return {'no_connection': LocaleKeys.no_connection.tr()};
      }
    }
    return errorMessage ?? {'unknown': LocaleKeys.error.tr()};
  }
}
