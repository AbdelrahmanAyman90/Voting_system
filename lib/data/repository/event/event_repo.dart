import 'package:dartz/dartz.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/models/event_model/event_model.dart';

abstract class EventRepo {
  Future<Either<Failure, List<Events>>> fetchEvent();
}
