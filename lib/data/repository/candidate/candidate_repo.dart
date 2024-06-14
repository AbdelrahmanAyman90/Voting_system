import 'package:dartz/dartz.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/models/candidate/candidate_campaign_model.dart';
import 'package:voting/data/models/candidate/candidate_model.dart';

abstract class candidateRepo {
  Future<Either<Failure, List<CandidateModel>>> fetchAllCandidate();
  Future<Either<Failure, CandidateCampaignModel>> fetchsingelCandidate(
      String id);
}
