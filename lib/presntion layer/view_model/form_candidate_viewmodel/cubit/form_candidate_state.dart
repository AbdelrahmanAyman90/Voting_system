part of 'form_candidate_cubit.dart';

@immutable
sealed class FormCandidateState {}

final class FormCandidateInitial extends FormCandidateState {}

final class FormCandidateLoodin extends FormCandidateState {}

final class FormCandidateSuccsess extends FormCandidateState {}

final class FormCandidateFail extends FormCandidateState {
  final String errorMassage;
  FormCandidateFail(this.errorMassage);
}
