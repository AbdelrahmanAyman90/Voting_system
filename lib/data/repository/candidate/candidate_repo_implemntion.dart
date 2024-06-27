//! هنا الداتا موجوده

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/const/end_point.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/data/models/candidate/candidate_campaign_model.dart';
import 'package:voting/data/models/candidate/candidate_model.dart';
import 'package:voting/data/repository/candidate/candidate_repo.dart';

//! هي دي المسئوله عن انها تعمل الطلب للباك ايند ودي الي بستعيها في الكيوبت وهي دي الي بترجع الداتا
class CandidateRepoImplemnt extends candidateRepo {
  final ApiServes apiServes;
  CandidateRepoImplemnt({required this.apiServes});
  @override
  Future<Either<Failure, List<CandidateModel>>> fetchAllCandidate() async {
    try {
      String endpoint = EndPoints.candidateApproved;
//header
      Map<String, dynamic> headerRequest = {
        'authorization': "bearer ${token}",
      };
//do requst
      var data =
          await apiServes.get(endPoint: endpoint, headerRequst: headerRequest);
//do parsing
      List<CandidateModel> candidateList = []; //! data come from backend
      for (var i in data['data']['candidates']) {
        candidateList.add(CandidateModel.fromJson(i));
      }
      // for (var i in candidateList) {
      //   idApprovCandidate.add(i.user!);
      // }
//cheack
      log("ggggggggggg");
      log(candidateList.length.toString());
      return right(candidateList);
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

  @override
  Future<Either<Failure, CandidateCampaignModel>> fetchsingelCandidate(
      String id) async {
    try {
      String endpoint = "${EndPoints.SingleCandidateApproved}/$id";
//header
      Map<String, dynamic> headerRequest = {
        'authorization': "bearer ${token}",
      };
//do requst
      var data =
          await apiServes.get(endPoint: endpoint, headerRequst: headerRequest);
//do parsing

      CandidateCampaignModel candidateInfo =
          CandidateCampaignModel.fromJson(data);
//cheack
      if (candidateInfo.data?.campaign != null) {
        log("ليست نل");
        log(candidateInfo.data!.campaign.toString());
      } else {
        log("نل");
      }
      return right(candidateInfo);
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
