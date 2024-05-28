import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/models/news_model/news_model.dart';

import 'package:voting/data/repository/news/news_repo.dart';

class NewsRepoImplemnt extends NewsRepo {
  final ApiServes apiServes;
  NewsRepoImplemnt(this.apiServes);
  @override
  Future<Either<Failure, List<NewsModel>>> fetchNews() async {
    try {
      String endpoint = "news";

//do requst
      var data = await apiServes.get(endPoint: endpoint);
//do parsing
      List<NewsModel> newsList = [];
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
}
