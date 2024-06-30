import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voting/Shared/const/end_point.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/models/event_model/event_model.dart';
import 'package:voting/data/repository/event/event_repo.dart';

class EventRepoImplemnt extends EventRepo {
  final ApiServes apiServes;
  EventRepoImplemnt({required this.apiServes});

  @override
  Future<Either<Failure, List<Events>>> fetchEvent() async {
    try {
      String endpoint = EndPoints.event;

//do requst
      var data = await apiServes.get(endPoint: endpoint);
//do parsing
      List<Events> eventList = []; //! data come from backend
      for (var i in data['data']['events']) {
        eventList.add(Events.fromJson(i));
      }
//cheack
      log("7777777777777777777777777777777777777777");
      log(eventList[0].end.toString());
      log("7777777777777777777777777777777777777777");

      return right(eventList);
    } on Exception catch (e) {
      if (e is DioException) {
        // log(e.toString());
        return left(ServerFailuar.fromDioError(e)); //! return
      } else {
        // log(e.toString());
        return left(ServerFailuar(e.toString())); //! return
      }
    }
  }
}
