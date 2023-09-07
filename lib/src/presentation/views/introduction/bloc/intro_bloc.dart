import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:poddy_caster/src/helper/helper_function.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<ProceedToTheAppPage>(proceedToTheAppPage);
  }

  FutureOr<void> proceedToTheAppPage(
      ProceedToTheAppPage event, Emitter<IntroState> emit) async {
    HelperFunction.setIntroDone(true);
    log("Intro Done: ${HelperFunction.getIntroDoneStatus()}");
    emit(IntroToEnterAppNavigateState());
  }
}
