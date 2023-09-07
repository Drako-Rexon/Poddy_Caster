import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poddy_caster/src/helper/helper_function.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInNavigateToSignUpPageEvent>(signInNavigateToSignUpPageEvent);
    on<SignInNavigateIntoAppEvent>(signInNavigateIntoAppEvent);
    on<SignInNavigateToForgetPasswordPageEvent>(
        signInNavigateToForgetPasswordPageEvent);
  }

  FutureOr<void> signInNavigateToSignUpPageEvent(
      SignInNavigateToSignUpPageEvent event, Emitter<AuthState> emit) {
    emit(SignInNavigateToSignUpPageState());
  }

  FutureOr<void> signInNavigateIntoAppEvent(
      SignInNavigateIntoAppEvent event, Emitter<AuthState> emit) {
    HelperFunction.setLoggedIn(true);
    log("LoggedIn Done: ${HelperFunction.getLoggedInStatus()}");
    log("intro Done: ${HelperFunction.getIntroDoneStatus()}");
    emit(SignInNavigateToAppPageState());
  }

  FutureOr<void> signInNavigateToForgetPasswordPageEvent(
      SignInNavigateToForgetPasswordPageEvent event, Emitter<AuthState> emit) {}
}
