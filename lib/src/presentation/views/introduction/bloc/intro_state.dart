part of 'intro_bloc.dart';

@immutable
abstract class IntroState {}

abstract class IntroActionState extends IntroState {}

class IntroInitial extends IntroState {}

class IntroSucceedToNextState extends IntroState {}

class IntroSucceedToPreviousState extends IntroState {}

class IntroToEnterAppNavigateState extends IntroActionState {}

class IntroErrorState extends IntroActionState {}
