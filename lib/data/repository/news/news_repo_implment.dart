//! هنا الداتا موجوده

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/const/end_point.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/models/news_model/news_model.dart';

import 'package:voting/data/repository/news/news_repo.dart';

//! هي دي المسئوله عن انها تعمل الطلب للباك ايند ودي الي بستعيها في الكيوبت وهي دي الي بترجع الداتا
class PreparAppImplemnt extends PreparApp {
  final ApiServes apiServes;
  PreparAppImplemnt({required this.apiServes});
  @override
  Future<Either<Failure, List<NewsModel>>> fetchNews() async {
    try {
      String endpoint = EndPoints.news;

//do requst
      var data = await apiServes.get(endPoint: endpoint);
//do parsing
      List<NewsModel> newsList = []; //! data come from backend
      for (var i in data['data']['news']) {
        newsList.add(NewsModel.fromJson(i));
      }
//cheack
      log(newsList.length.toString());
      return right(newsList);
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
  Future<Either<Failure, bool>> isUserVote() async {
    String endpoint = EndPoints.checkIsVoted;
    Map<String, dynamic> headerRequest = {
      'authorization': "bearer ${token}",
    };
    try {
      var data =
          await apiServes.get(endPoint: endpoint, headerRequst: headerRequest);
      return right(data["data"]["voted"]);
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
