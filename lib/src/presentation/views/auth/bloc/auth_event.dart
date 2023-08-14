part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInNavigateToSignUpPageEvent extends AuthEvent {}

class SignInNavigateToForgetPasswordPageEvent extends AuthEvent {}

class SignInNavigateToTermsOfServicesPageEvent extends AuthEvent {}

class SignInNavigateIntoAppEvent extends AuthEvent {}
