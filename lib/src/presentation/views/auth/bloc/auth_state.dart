part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

abstract class AuthActionState extends AuthState {}

class AuthInitial extends AuthState {}

class SignInNavigateToSignUpPageState extends AuthActionState {}

class SignInNavigateToForgetPasswordPageState extends AuthActionState {}

class SignInNavigateToTermsOfServicesPageState extends AuthActionState {}

class SignInNavigateToAppPageState extends AuthActionState {}
