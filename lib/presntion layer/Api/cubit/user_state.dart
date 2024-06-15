part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class SignUpLoading extends UserState {}

final class SignUpSuccess extends UserState {}

final class SignUpFaliur extends UserState {
  final String errorMessage;

  SignUpFaliur({required this.errorMessage});
}

final class SignInLoading extends UserState {}

final class SignInSuccess extends UserState {}

final class SignInFaliur extends UserState {
  final String errorMessage;

  SignInFaliur({required this.errorMessage});
}

final class ChangePasswordLoading extends UserState {}

final class ChangePasswordSuccess extends UserState {
  final String message;

  ChangePasswordSuccess({required this.message});
}

final class ChangePasswordFaliur extends UserState {
  final String errorMessagee;

  ChangePasswordFaliur({required this.errorMessagee});
}

final class GetUserDataLoading extends UserState {}

final class GetUserDataSuccess extends UserState {
  final SignInModel user;

  GetUserDataSuccess({required this.user});
}

final class GetUserDataFaliur extends UserState {
  final String errorMessagee;

  GetUserDataFaliur({required this.errorMessagee});
}
