import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/src/platform_file.dart';
import 'package:mime/mime.dart';
import 'package:voting/Shared/const/end_point.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/models/user_model/user_model.dart';
import 'package:voting/data/repository/user_authorization/user_repo.dart';
import 'package:http_parser/http_parser.dart';

class UserAuthorizationepoImplemntion extends UserAuthorizationRepo {
  final ApiServes apiServes;
  UserAuthorizationepoImplemntion({required this.apiServes});
  @override
  Future<Either<Failure, UserModel>> registerUser({
    required PlatformFile natinalIdImage,
    required PlatformFile personalImage,
    required String nationalId,
    required String password,
  }) async {
//!convert image to cand upload to api and represnt the type
    List<MultipartFile> multipartFiles = [];
    // for (var file in selectedFiles) {
    //   var mimeType = lookupMimeType(file.path!) ?? 'application/octet-stream';
    //   var multipartFile = await MultipartFile.fromFile(
    //     file.path!,
    //     filename: file.name,
    //     contentType: MediaType.parse(mimeType),
    //   );
    //   multipartFiles.add(multipartFile);
    // }

    var nationalIdImage = await MultipartFile.fromFile(
      natinalIdImage.path!,
      filename: natinalIdImage.name,
      contentType: MediaType.parse(
          lookupMimeType(natinalIdImage.path!) ?? 'application/octet-stream'),
    );
    var PersonalImage = await MultipartFile.fromFile(
      personalImage.path!,
      filename: personalImage.name,
      contentType: MediaType.parse(
          lookupMimeType(personalImage.path!) ?? 'application/octet-stream'),
    );
    multipartFiles.addAll([nationalIdImage, PersonalImage]);

    try {
      //endpoint
      String endpoint = EndPoints.signUp;

      //body

      FormData formData = FormData.fromMap({
        'images': multipartFiles,
      });
      formData.fields.add(MapEntry('nationalId', nationalId));
      formData.fields.add(MapEntry('password', password));

//do requst
      var data = await apiServes.post(endpoint: endpoint, data: formData);
//do parse
      UserModel userData = UserModel.fromJson(data);
      log(userData.data!.token.toString());
      return right(userData);
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
