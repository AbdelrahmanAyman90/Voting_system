part of 'get_candidate_cubit.dart';

@immutable
sealed class GetCandidateState {}

final class GetCandidateInitial extends GetCandidateState {}

final class GetCandidateLooding extends GetCandidateState {}

final class GetCandidateSuccess extends GetCandidateState {
  final List<CandidateModel> allCandidate;
  GetCandidateSuccess(this.allCandidate);
}

final class GetCandidateFail extends GetCandidateState {
  final String errorMassage;
  GetCandidateFail(this.errorMassage);
}
