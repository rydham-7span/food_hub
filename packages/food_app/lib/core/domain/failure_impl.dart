import 'dart:developer';

import 'package:food_app/app/config/app_constants.dart';
import 'package:food_client/food_client.dart';
import 'package:food_localization/food_localization.dart';

///In case of returning different messages Remove defaultMessage from inner class
Map<String, String> defaultMessage = {ErrorConstants.unknownErrorKey: LocaleKeys.error.tr()};

class ModelConversionFailure extends Failure {
  ModelConversionFailure({this.error, this.stackTrace}) {
    log(stackTrace.toString());
    log(error.toString());
  }

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Map<String, String> get message => defaultMessage;
}

class JsonParsingFailure extends Failure {
  JsonParsingFailure({this.error, this.stackTrace});

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Map<String, String> get message => defaultMessage;
}

class UserSaveFailure extends Failure {
  UserSaveFailure({
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Map<String, String> get message => defaultMessage;
}

class UserTokenSaveFailure extends Failure {
  UserTokenSaveFailure({
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Map<String, String> get message => defaultMessage;
}

class RoleNotFound extends Failure {
  RoleNotFound({
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Map<String, String> get message => defaultMessage;
}

class SyncFromServerFail extends Failure {
  SyncFromServerFail({
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Map<String, String> get message => defaultMessage;
}

class FetchDataFromDbFail extends Failure {
  FetchDataFromDbFail({
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Map<String, String> get message => defaultMessage;
}

class InsertDbFail extends Failure {
  InsertDbFail({
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Map<String, String> get message =>
      (error is String) ? {'insert_fail': LocaleKeys.sync_error.tr()} : defaultMessage;
}
