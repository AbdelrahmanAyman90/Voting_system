part of 'event_cubit.dart';

@immutable
sealed class EventState {}

final class EventInitial extends EventState {}

final class EventLooding extends EventState {}

final class EventSuccses extends EventState {
  List<Events> event;
  EventSuccses(this.event);
}

final class EventFail extends EventState {
  String errorMassage;
  EventFail(this.errorMassage);
}

final class CandidateSelLooding extends EventState {}

final class CandidateSelfSuccess extends EventState {}

final class CandidateSelfFail extends EventState {}
