import 'package:dartz/dartz.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/models/qustion_model/qustion_model.dart';

abstract class QustionRepo {
  Future<Either<Failure, List<QustionModel>>> fetchQustion();
}
