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
