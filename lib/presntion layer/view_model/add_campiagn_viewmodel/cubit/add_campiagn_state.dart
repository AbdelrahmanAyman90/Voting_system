part of 'add_campiagn_cubit.dart';

@immutable
sealed class AddCampiagnState {}

final class AddCampiagnInitial extends AddCampiagnState {}

final class AddCampiagnLooding extends AddCampiagnState {}

final class AddCampiagnSuccses extends AddCampiagnState {}

final class AddCampiagnFail extends AddCampiagnState {
  final String errorMassage;
  AddCampiagnFail(this.errorMassage);
}
