import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_app/app/enum.dart';
import 'package:food_app/modules/auth/model/user_model.dart';
import 'package:food_app/modules/auth/repository/auth_repository.dart';
import 'package:food_client/food_client.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required IAuthService authService})
      : _authService = authService,
        super(const AuthState()) {
    on<SignUpEvent>(signUpRequest);
    on<LogInEvent>(logInRequest);
    on<AddUserToFBEvent>(addDetailsRequest);
  }

  final IAuthService _authService;

  Future<Unit> signUpRequest(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        signupStatus: FirebaseStatus.loading,
      ),
    );
    final response = await _authService.register(userModel: event.userModel).run();
    response.fold(
      (l) {
        emit(
          state.copyWith(
            signupStatus: FirebaseStatus.error,
            errorMessage: l.message.values.first,
          ),
        );
      },
      (r) {
        if (r) {
          if (event.userModel.isAdmin ?? false) {
            add(
              AddUserToFBEvent(
                userModel: event.userModel.copyWith(password: ''),
              ),
            );
            emit(
              state.copyWith(
                signupStatus: FirebaseStatus.loaded,
              ),
            );
          } else {
            add(AddUserToFBEvent(userModel: event.userModel.copyWith(password: '')));
            emit(
              state.copyWith(
                signupStatus: FirebaseStatus.loaded,
              ),
            );
          }
        }
      },
    );
    return unit;
  }

  Future<Unit> logInRequest(LogInEvent event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        loginStatus: FirebaseStatus.loading,
      ),
    );
    final response = await _authService.login(userModel: event.userModel).run();

    response.fold(
      (l) {
        emit(
          state.copyWith(
            loginStatus: FirebaseStatus.error,
            errorMessage: l.message.values.first,
          ),
        );
      },
      (r) {
        if (r[0]) {
          emit(
            state.copyWith(
              loginStatus: FirebaseStatus.loaded,
              isAdmin: r[1],
            ),
          );
        }
      },
    );
    return unit;
  }

  Future<Unit> addDetailsRequest(AddUserToFBEvent event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        loginStatus: FirebaseStatus.loading,
      ),
    );
    final response = await _authService.addData(userModel: event.userModel).run();
    response.fold(
      (l) {
        emit(
          state.copyWith(
            loginStatus: FirebaseStatus.error,
            errorMessage: l.message.values.first,
          ),
        );
      },
      (r) {
        if (r) {
          emit(
            state.copyWith(
              loginStatus: FirebaseStatus.loaded,
            ),
          );
        }
      },
    );
    return unit;
  }
}
