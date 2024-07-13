import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/data/repository/preparapp/prepar_app_repo_implment.dart';

part 'check_is_voted_state.dart';

class CheckIsVotedCubit extends Cubit<CheckIsVotedState> {
  CheckIsVotedCubit(this.prepareApp) : super(CheckIsVotedInitial());
  PreparAppRepoImplemnt prepareApp;
  bool? isUserVoted;

  isVoted() async {
    String votedCase = CashNetwork.GetFromCash(key: 'user_vote');

    if (votedCase == "") {
      emit(CheackIsUserVotedLooding());
      try {
        var result = await prepareApp.isUserVote();
        result.fold(
          (l) {
            emit(CheackIsUserVoteFail(l.errorMassage));
          },
          (r) async {
            await CashNetwork.InsertToCash(
                key: "user_vote", value: r.toString());
            isUserVoted = r;
            emit(CheackIsUserVoteSucsess());
          },
        );
      } on Exception catch (e) {
        emit(CheackIsUserVoteFail(e.toString()));
      }
    } else {
      isUserVoted = await CashNetwork.GetFromCash(key: 'user_vote') == "true"
          ? true
          : false;
      emit(CheackIsUserVoteSucsess());
    }
  }
}
