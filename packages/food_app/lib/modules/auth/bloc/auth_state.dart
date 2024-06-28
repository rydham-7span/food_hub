part of 'auth_bloc.dart';

// @immutable
// sealed class AuthState {}
//
// final class AuthInitial extends AuthState {}

class AuthState {
  const AuthState({
    this.loginStatus = FirebaseStatus.initial,
    this.signupStatus = FirebaseStatus.initial,
    this.errorMessage,
  });

  final String? errorMessage;
  final FirebaseStatus? loginStatus;
  final FirebaseStatus? signupStatus;

  AuthState copyWith({
    String? errorMessage,
    FirebaseStatus? loginStatus,
    FirebaseStatus? signupStatus,
  }) {
    return AuthState(
      signupStatus: signupStatus ?? this.signupStatus,
      loginStatus: loginStatus ?? this.loginStatus,
      errorMessage: errorMessage ?? '',
    );
  }
}
