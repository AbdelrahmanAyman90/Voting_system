part of 'check_is_voted_cubit.dart';

@immutable
sealed class CheckIsVotedState {}

final class CheckIsVotedInitial extends CheckIsVotedState {}

final class CheackIsUserVotedLooding extends CheckIsVotedState {}

final class CheackIsUserVoteSucsess extends CheckIsVotedState {}

final class CheackIsUserVoteFail extends CheckIsVotedState {
  final String errorMassage;
  CheackIsUserVoteFail(this.errorMassage);
}
