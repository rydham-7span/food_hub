import 'package:food_app/core/domain/failure_impl.dart';
import 'package:food_client/food_client.dart';

typedef ModelFn<T> = T Function();

class RepositoryUtils {
  static Either<Failure, Response> checkStatusCode(Response response) =>
      Either<Failure, Response>.fromPredicate(
        response,
        (response) =>
            response.statusCode == 200 || response.statusCode == 304 || response.statusCode == 201,
        (error) => APIFailure(error: error),
      );

  static Either<Failure, List<dynamic>> mapToList(Response response) => Either.tryCatch(
        () => ((response.data as Map<String, dynamic>)['data'] ?? <dynamic>[]) as List<dynamic>,
        (error, stacktrace) => ModelConversionFailure(error: error, stackTrace: stacktrace),
      );

  static Either<Failure, T> mapToModel<T>(
    T Function() convertModelFunction,
  ) =>
      Either<ModelConversionFailure, T>.tryCatch(
        () => convertModelFunction.call(),
        (error, stackTrace) => ModelConversionFailure(
          error: error,
          stackTrace: stackTrace,
        ),
      );
}
