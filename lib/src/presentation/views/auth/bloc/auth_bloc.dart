import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInNavigateToSignUpPageEvent>(signInNavigateToSignUpPageEvent);
    on<SignInNavigateIntoAppEvent>(signInNavigateIntoAppEvent);
  }

  FutureOr<void> signInNavigateToSignUpPageEvent(
      SignInNavigateToSignUpPageEvent event, Emitter<AuthState> emit) {
    emit(SignInNavigateToSignUpPageState());
  }

  FutureOr<void> signInNavigateIntoAppEvent(
      SignInNavigateIntoAppEvent event, Emitter<AuthState> emit) {
    emit(SignInNavigateToAppPageState());
  }
}
