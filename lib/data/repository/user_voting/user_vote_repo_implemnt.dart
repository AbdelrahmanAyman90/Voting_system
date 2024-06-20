import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/repository/user_voting/user_vote_repo.dart';

class UserVotingRepoImplemntion extends UserVotingRepo {
  final ApiServes apiServes;
  UserVotingRepoImplemntion({required this.apiServes});

  @override
  Future<Either<Failure, String>> userVoting(
      {required String candadateId, required String confirmPassword}) async {
    try {
      String endpoint = "election";
      //header
      Map<String, dynamic> headerRequest = {
        'authorization': "bearer ${token}",
      };
      //body
      Map<String, dynamic> bodyData = {
        'candidate': candadateId,
        'password': confirmPassword
      };
//do requst
      var data = await apiServes.post(
          endpoint: endpoint, data: bodyData, headerRequst: headerRequest);

      return right("good");
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
