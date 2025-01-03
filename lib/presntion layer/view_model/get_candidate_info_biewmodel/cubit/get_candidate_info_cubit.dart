import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voting/data/models/candidate/candidate_campaign_model.dart';
import 'package:voting/data/repository/candidate/candidate_repo_implemntion.dart';

part 'get_candidate_info_state.dart';

class GetCandidateInfoCubit extends Cubit<GetCandidateInfoState> {
  GetCandidateInfoCubit(this.candidateRepo) : super(GetCandidateInfoInitial());
  CandidateRepoImplemnt candidateRepo;
  bool? isAddCam;
  getSingleCandidateinfo({required String idCandidate}) async {
    emit(GetSingleCandidateLooding());
    try {
      var result = await candidateRepo.fetchsingelCandidate(idCandidate);
      result.fold((l) {
        emit(GetSingleCandidateFail(l.errorMassage));
      }, (r) async {
        sortIsAddCampOrNot(r);
        emit(GetSingleCandidateSuccess(r));
      });
    } on Exception catch (e) {
      emit(GetSingleCandidateFail(e.toString()));
    }
  }

  sortIsAddCampOrNot(camp) {
    if (camp.data?.campaign != null) {
      isAddCam = true;
    } else {
      isAddCam = false;
    }
  }

  @override
  void onChange(Change<GetCandidateInfoState> change) {
    print(change.toString());
    super.onChange(change);
  }
}
