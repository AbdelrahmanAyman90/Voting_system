import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voting/data/repository/add_campiagn/add_campiagn_repo_implment.dart';

part 'add_campiagn_state.dart';

class AddCampiagnCubit extends Cubit<AddCampiagnState> {
  AddCampiagnCubit({required this.addCampiagnRepo})
      : super(AddCampiagnInitial());
  AddCampiagnRepoImplemntion addCampiagnRepo;

  addCampiagn(
      {required bio, required goals, required video, String? link}) async {
    emit(AddCampiagnLooding());

    try {
      var result = await addCampiagnRepo.addCampaignForCandidate(
          bio: bio, goals: goals, video: video, link: link);
      result.fold((l) {
        emit(AddCampiagnFail(l.errorMassage));
      }, (r) {
        emit(AddCampiagnSuccses());
      });
    } on Exception catch (e) {
      emit(AddCampiagnFail(e.toString()));
    }
  }

  @override
  void onChange(Change<AddCampiagnState> change) {
    log(change.toString());

    super.onChange(change);
  }
}
