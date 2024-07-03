import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voting/data/models/event_model/event_model.dart';
import 'package:voting/data/repository/event/event_repo_implemnt.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit(this.event) : super(EventInitial());
  EventRepoImplemnt event;
  Map<String, dynamic> events = {};

  fetchEvent() async {
    emit(EventLooding());
    try {
      var result = await event.fetchEvent();

      result.fold((l) {
        emit(EventFail(l.errorMassage));
      }, (r) async {
        await setEventTime(evntData: r);
        emit(EventSuccses(r));
      });
    } on Exception catch (e) {
      emit(EventFail(e.toString()));
    }
  }

  setEventTime({required List<Events> evntData}) {
    tz.initializeTimeZones();

    tz.Location egypt = tz.getLocation('Africa/Cairo');

    for (var e in evntData) {
      events[e.type!] = {
        "start": tz.TZDateTime.from(DateTime.parse(e.start!), egypt),
        "end": tz.TZDateTime.from(DateTime.parse(e.end!), egypt),
      };
    }
  }

  String? eventCases(String event) {
    DateTime now = DateTime.now();
    if (events.containsKey(event)) {
      var e = events[event];

      // log(events[event].toString());
      if (now.isAfter(e['start']) && now.isBefore(e['end']))
        return 'now';
      else if (now.isBefore(e['start'])) {
        return 'not start';
      } else {
        return 'end';
      }
    } else {
      return 'not start';
    }
  }
}
