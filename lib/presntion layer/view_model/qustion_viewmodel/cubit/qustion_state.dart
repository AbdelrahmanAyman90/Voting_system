part of 'qustion_cubit.dart';

@immutable
sealed class QustionState {}

final class QustionInitial extends QustionState {}

final class QustionLooding extends QustionState {}

final class QustionSuccess extends QustionState {}

final class QustionFail extends QustionState {
  String errorMassage;
  QustionFail(this.errorMassage);
}
