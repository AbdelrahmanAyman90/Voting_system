import 'package:dartz/dartz.dart';

import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/models/news_model/news_model.dart';

abstract class PreparApp {
  Future<Either<Failure, List<NewsModel>>> fetchNews();
  Future<Either<Failure, bool>> isUserVote();
  Future<Either<Failure, bool>> isUserCandidateSelf();
}
