import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_app/domain/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService service;
  AuthCubit(this.service) : super(AuthInitial());

  exit() async {
    try {
      await service.exit();

      emit(AuthInitial());
    } catch (error) {
      emit(ExitError(error.toString()));
    }
  }

  signIn({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final result = await service.signIn(
        email: email,
        password: password,
      );

      log(result.toString());
      emit(SignInSuccess(result));
    } catch (error) {
      if (error.toString() == '[firebase_auth/user-not-found]') {
        log('not found');
      }
      log(error.toString());
      emit(SignInFailed(error.toString()));
    }
  }

  signUp({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final result = await service.signUp(
        email: email,
        password: password,
      );

      log(result.toString());
      emit(SignUpSuccess(result));
    } catch (error) {
      log(error.toString());
      emit(SignUpFailed(error.toString()));
    }
  }

  reset() {
    emit(AuthInitial());
  }
}
