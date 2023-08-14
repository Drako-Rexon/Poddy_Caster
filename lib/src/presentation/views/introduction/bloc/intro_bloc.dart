import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<ProceedToTheAppPage>(proceedToTheAppPage);
  }

  FutureOr<void> proceedToTheAppPage(
      ProceedToTheAppPage event, Emitter<IntroState> emit) {
    log("done clicked");
    emit(IntroToEnterAppNavigateState());
  }
}
