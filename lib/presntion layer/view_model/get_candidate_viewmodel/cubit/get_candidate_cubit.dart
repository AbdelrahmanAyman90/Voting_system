import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voting/data/models/candidate/candidate_campaign_model.dart';
import 'package:voting/data/models/candidate/candidate_model.dart';
import 'package:voting/data/repository/candidate/candidate_repo_implemntion.dart';

part 'get_candidate_state.dart';

class GetCandidateCubit extends Cubit<GetCandidateState> {
  GetCandidateCubit(this.candidateRepo) : super(GetCandidateInitial());
  CandidateRepoImplemnt candidateRepo;
  Campaign? compiagnData;
  List<CandidateModel> allCandidateList = [];

  getAllCandidate() async {
    emit(GetCandidateLooding());
    try {
      var result = await candidateRepo.fetchAllCandidate();
      result.fold((l) {
        emit(GetCandidateFail(l.errorMassage));
      }, (r) {
        setCandataedata(r);
        emit(GetCandidateSuccess(r));
      });
    } on Exception catch (e) {
      emit(GetCandidateFail(e.toString()));
    }
  }

  setCandataedata(List<CandidateModel> candataeData) {
    allCandidateList.clear();
    allCandidateList.addAll(candataeData);
  }
}

@override
void onChange(Change<GetCandidateState> change) {
  print(change.toString());
}
