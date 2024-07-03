part of 'user_authorization_cubit.dart';

@immutable
sealed class UserAuthorizationState {}

final class UserAuthorizationInitial extends UserAuthorizationState {}

final class UserAuthorizationRegisterLooding extends UserAuthorizationState {}

final class UserAuthorizationRegisterSucsses extends UserAuthorizationState {}

final class UserAuthorizationRegisterFail extends UserAuthorizationState {
  final String errorMassage;
  UserAuthorizationRegisterFail(this.errorMassage);
}

final class UserAuthorizationLoginLooding extends UserAuthorizationState {}

final class UserAuthorizationLoginSucsses extends UserAuthorizationState {}

final class UserAuthorizationLoginFail extends UserAuthorizationState {
  final String errorMassage;
  UserAuthorizationLoginFail(this.errorMassage);
}

final class UserChangePasswordLooding extends UserAuthorizationState {}

final class UseChangePasswordSucsses extends UserAuthorizationState {}

final class UserChangePasswordFail extends UserAuthorizationState {
  final String errorMassage;
  UserChangePasswordFail(this.errorMassage);
}
