import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/data/repository/user_voting/user_vote_repo_implemnt.dart';

part 'user_vote_state.dart';

class UserVoteCubit extends Cubit<UserVoteState> {
  UserVoteCubit({required this.uservote}) : super(UserVoteInitial());

  UserVotingRepoImplemntion uservote;

  UserVoting({
    required candadateId,
    required confirmPassword,
  }) async {
    try {
      emit(UserVoteLooding());
      var result = await uservote.userVoting(
          candadateId: candadateId, confirmPassword: confirmPassword);
      result.fold((l) {
        emit(UserVoteFail(l.errorMassage));
      }, (r) async {
        await CashNetwork.InsertToCash(key: "user_vote", value: "true");
        emit(UserVoteSuccsess());
      });
    } on Exception catch (e) {
      emit(UserVoteFail(e.toString()));
    }
  }

  @override
  void onChange(Change<UserVoteState> change) {
    log(change.toString());

    super.onChange(change);
  }
}
