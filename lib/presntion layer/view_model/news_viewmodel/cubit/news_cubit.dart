import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/data/models/news_model/news_model.dart';
import 'package:voting/data/repository/news/news_repo_implment.dart';

part 'news_state.dart';

class PrepareAppCubit extends Cubit<PrepareAppState> {
  PrepareAppCubit(this.newsRepo) : super(NewsInitial());
  NewsRepoImplemnt newsRepo;
  bool? isUserVoted;

  fetchNews() async {
    emit(NewsLooding());
    try {
      var result = await newsRepo.fetchNews();
      result.fold((l) {
        emit(NewsFail(l.errorMassage));
      }, (r) {
        emit(NewsSuccess(r));
      });
    } on Exception catch (e) {
      emit(NewsFail(e.toString()));
    }
  }

  isVoted() async {
    String votedCase = await CashNetwork.GetFromCash(key: 'user_vote');
    log("------->${token}");
    if (votedCase == "") {
      try {
        var result = await newsRepo.isUserVote();
        result.fold(
          (l) {
            log("message");
          },
          (r) async {
            log("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&  $r");
            await CashNetwork.InsertToCash(
                key: "user_vote", value: r.toString());
            isUserVoted = r;
          },
        );
      } on Exception catch (e) {
        log(e.toString());
      }
    } else {
      log("enter!!");

      isUserVoted = await CashNetwork.GetFromCash(key: 'user_vote') == "true"
          ? true
          : false;
    }
  }
}
