import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:voting/Shared/network/error_network.dart';

abstract class AddCampiagnRepo {
  Future<Either<Failure, String>> addCampaignForCandidate({
    required String bio,
    required String goals,
    required PlatformFile video,
    String? link,
  });
}
