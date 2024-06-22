import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/models/user_model/user_model.dart';

abstract class UserAuthorizationRepo {
  Future<Either<Failure, UserModel>> registerUser({
    required PlatformFile natinalIdImage,
    required PlatformFile personalImage,
    required String nationalId,
    required String password,
  });
}
