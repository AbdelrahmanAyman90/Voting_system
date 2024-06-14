part of 'get_candidate_info_cubit.dart';

@immutable
sealed class GetCandidateInfoState {}

final class GetCandidateInfoInitial extends GetCandidateInfoState {}

final class GetSingleCandidateLooding extends GetCandidateInfoState {}

final class GetSingleCandidateSuccess extends GetCandidateInfoState {
  final CandidateCampaignModel candidateInfo;
  GetSingleCandidateSuccess(this.candidateInfo);
}

final class GetSingleCandidateFail extends GetCandidateInfoState {
  final String errorMassage;
  GetSingleCandidateFail(this.errorMassage);
}
