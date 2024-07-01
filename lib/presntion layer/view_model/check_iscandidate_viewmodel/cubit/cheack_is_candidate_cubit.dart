import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/data/repository/preparapp/prepar_app_repo_implment.dart';

part 'cheack_is_candidate_state.dart';

class CheackIsCandidateCubit extends Cubit<CheackIsCandidateState> {
  CheackIsCandidateCubit(this.prepareApp) : super(CheackIsCandidateInitial());
  PreparAppRepoImplemnt prepareApp;
  bool? isCandidateSelf;

  isUserCandidateSelf() async {
    String candidateSelfCase =
        CashNetwork.GetFromCash(key: 'user_candidate_self');
    if (candidateSelfCase == "") {
      emit(CheackIsCandidateSelfLooding());

      log("candidate from cash--->$candidateSelfCase");
      try {
        var result = await prepareApp.isUserCandidateSelf();
        result.fold(
          (l) => emit(CheackIsCandidateSelfFail(l.errorMassage)),
          (r) async {
            log("iscandidate from api---> $r");
            await CashNetwork.InsertToCash(
                key: "user_candidate_self", value: r.toString());
            isCandidateSelf = r;
            log("valu is_candidate if after enter to api --->$isCandidateSelf");
            emit(CheackIsCandidateSelfSucsess());
          },
        );
      } on Exception catch (e) {
        emit(CheackIsCandidateSelfFail(e.toString()));
      }
    } else {
      log("enter candidate!!");

      isCandidateSelf =
          await CashNetwork.GetFromCash(key: 'user_candidate_self') == "true"
              ? true
              : false;
      emit(CheackIsCandidateSelfSucsess());
    }
  }

  @override
  void onChange(Change<CheackIsCandidateState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
