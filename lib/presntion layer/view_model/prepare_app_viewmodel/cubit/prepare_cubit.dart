import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/data/models/news_model/news_model.dart';
import 'package:voting/data/repository/news/news_repo_implment.dart';

part 'prepare_state.dart';

class PrepareAppCubit extends Cubit<PrepareAppState> {
  PrepareAppCubit(this.prepareApp) : super(NewsInitial());
  PreparAppImplemnt prepareApp;
  bool? isUserVoted;
  bool? isCandidateSelf;
  fetchNews() async {
    emit(NewsLooding());
    try {
      var result = await prepareApp.fetchNews();
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
        var result = await prepareApp.isUserVote();
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
      } on DioException catch (e) {
        IsVotedFail();
        log(e.toString());
      } on Exception catch (e) {
        IsVotedFail();
      }
    } else {
      log("enter!!");

      isUserVoted = await CashNetwork.GetFromCash(key: 'user_vote') == "true"
          ? true
          : false;
    }
  }

  isUserCandidateSelf() async {
    String candidateSelfCase =
        await CashNetwork.GetFromCash(key: 'user_candidate_self');
    log("------->${token}");
    if (candidateSelfCase == "") {
      log(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,$candidateSelfCase");
      try {
        var result = await prepareApp.isUserCandidateSelf();
        result.fold(
          (l) {
            log("message");
          },
          (r) async {
            log("000000000000000000 $r");
            await CashNetwork.InsertToCash(
                key: "user_candidate_self", value: r.toString());
            isCandidateSelf = r;
          },
        );
      } on DioException catch (e) {
        log(e.toString());
        emit(CandidateSelfFail());
      } on Exception catch (e) {
        emit(CandidateSelfFail());
      }
    } else {
      log("enter candidate!!");

      isCandidateSelf =
          await CashNetwork.GetFromCash(key: 'user_candidate_self') == "true"
              ? true
              : false;
    }
  }

  @override
  void onChange(Change<PrepareAppState> change) {
    log(change.toString());

    super.onChange(change);
  }
}
