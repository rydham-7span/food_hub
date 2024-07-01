part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LogInEvent extends AuthEvent {
  LogInEvent({required this.userModel});

  final UserModel userModel;
}

class SignUpEvent extends AuthEvent {
  SignUpEvent({required this.userModel});

  final UserModel userModel;
}

class AddUserToFBEvent extends AuthEvent {
  AddUserToFBEvent({required this.userModel});

  final UserModel userModel;
}
