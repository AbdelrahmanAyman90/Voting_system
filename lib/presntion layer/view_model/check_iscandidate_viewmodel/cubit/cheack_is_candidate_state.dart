part of 'cheack_is_candidate_cubit.dart';

@immutable
sealed class CheackIsCandidateState {}

final class CheackIsCandidateInitial extends CheackIsCandidateState {}

final class CheackIsCandidateSelfLooding extends CheackIsCandidateState {}

final class CheackIsCandidateSelfSucsess extends CheackIsCandidateState {}

final class CheackIsCandidateSelfFail extends CheackIsCandidateState {
  final String errorMassage;
  CheackIsCandidateSelfFail(this.errorMassage);
}
