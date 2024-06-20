import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

import 'package:voting/Shared/network/error_network.dart';

abstract class UserVotingRepo {
  Future<Either<Failure, String>> userVoting(
      {required String candadateId, required String confirmPassword});
}
