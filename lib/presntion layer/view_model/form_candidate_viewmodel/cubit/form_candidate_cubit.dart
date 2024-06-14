import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:voting/data/repository/form_candidate/form_candidate_repo_implemnt.dart';

part 'form_candidate_state.dart';

//todo متنساش توبط الراجع في حاله النجاح في الريبو
class FormCandidateCubit extends Cubit<FormCandidateState> {
  FormCandidateCubit(this.formCandidateRepo) : super(FormCandidateInitial());

  FormCandidateRepoImplemntion formCandidateRepo;

  List<PlatformFile?> selectedImages = List.generate(7, (_) => null);

  addCandidate({required name, required job, required education}) async {
    emit(FormCandidateLoodin());
    try {
      var result = await formCandidateRepo.addFormCandidate(
          images: selectedImages, name: name, job: job, education: education);
      result.fold((l) {
        emit(FormCandidateFail(l.errorMassage));
      }, (r) {
        emit(FormCandidateSuccsess());
      });
    } on Exception catch (e) {
      emit(FormCandidateFail(e.toString()));
    }
  }

  sortedImage(value) {
    selectedImages.add(value);
  }

  @override
  void onChange(Change<FormCandidateState> change) {
    print(change);
    super.onChange(change);
  }
}
