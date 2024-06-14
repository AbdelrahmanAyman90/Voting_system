import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

import 'package:voting/Shared/network/error_network.dart';

abstract class FormCandidateRepo {
  Future<Either<Failure, String>> addFormCandidate(
      {required List<PlatformFile> images,
      required String name,
      required String job,
      required String education});
}
