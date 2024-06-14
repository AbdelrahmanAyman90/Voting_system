import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/models/qustion_model/qustion_model.dart';
import 'package:voting/data/repository/qustion/qustion_repo.dart';

class QustionRepoImplemntion extends QustionRepo {
  @override
  QustionRepoImplemntion(this.apiServes);
  ApiServes apiServes;
  Future<Either<Failure, List<QustionModel>>> fetchQustion() async {
    try {
      String endpoint = "question";

//do requst
      var data = await apiServes.get(endPoint: endpoint);
//do parsing
      List<QustionModel> qustionList = [];
      for (var i in data['data']['questions']) {
        qustionList.add(QustionModel.fromJson(i));
      }
//cheack
      log("======");
      log(qustionList.length.toString());
      return right(qustionList); //! return
    } on Exception catch (e) {
      if (e is DioException) {
        // log(e.toString());
        return left(ServerFailuar.fromDioError(
            e)); //! return the error massage that wiil be go to cubit
      } else {
        // log(e.toString());
        return left(ServerFailuar(e.toString())); //! return the error massage
      }
    }
  }
}
