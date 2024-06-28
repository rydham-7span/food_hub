import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/modules/auth/model/user_model.dart';
import 'package:food_client/food_client.dart';

abstract class IAuthService {
  TaskEither<Failure, bool> login({
    required UserModel userModel,
  });

  TaskEither<Failure, bool> register({
    required UserModel userModel,
  });
}

class AuthService extends IAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  TaskEither<Failure, bool> register({
    required UserModel userModel,
  }) {
    return TaskEither.tryCatch(
      () async {
        final data = await auth.createUserWithEmailAndPassword(
          email: userModel.email?.trim() ?? '',
          password: userModel.password?.trim() ?? '',
        );
        await data.user?.updateDisplayName(userModel.name?.trim());
        return true;
      },
      (error, stackTrace) {
        return APIFailure(
          error: error,
          stackTrace: stackTrace,
        );
      },
    );
  }

  @override
  TaskEither<Failure, bool> login({
    required UserModel userModel,
  }) {
    return TaskEither.tryCatch(
      () async {
        await auth.signInWithEmailAndPassword(
          email: userModel.email?.trim() ?? '',
          password: userModel.password?.trim() ?? '',
        );
        return true;
      },
      (error, stackTrace) {
        return APIFailure(
          error: error,
          stackTrace: stackTrace,
        );
      },
    );
  }
}
