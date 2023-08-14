part of 'intro_bloc.dart';

@immutable
abstract class IntroEvent {}

class IntroInitialEvent extends IntroEvent {}

class NextButtonClickedEvent extends IntroEvent {}

class PreviousButtonClickedEvent extends IntroEvent {}

class ProceedToTheAppPage extends IntroEvent {}
