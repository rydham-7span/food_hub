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
    this.isAdmin = false,
  });

  final String? errorMessage;
  final FirebaseStatus? loginStatus;
  final FirebaseStatus? signupStatus;
  final bool isAdmin;

  AuthState copyWith({
    String? errorMessage,
    FirebaseStatus? loginStatus,
    FirebaseStatus? signupStatus,
    bool? isAdmin,
  }) {
    return AuthState(
        signupStatus: signupStatus ?? this.signupStatus,
        loginStatus: loginStatus ?? this.loginStatus,
        errorMessage: errorMessage ?? '',
        isAdmin: isAdmin ?? this.isAdmin);
  }
}
