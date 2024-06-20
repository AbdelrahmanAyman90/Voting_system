part of 'user_vote_cubit.dart';

@immutable
sealed class UserVoteState {}

final class UserVoteInitial extends UserVoteState {}

final class UserVoteLooding extends UserVoteState {}

final class UserVoteSuccsess extends UserVoteState {}

final class UserVoteFail extends UserVoteState {
  final String errorMassage;
  UserVoteFail(this.errorMassage);
}
