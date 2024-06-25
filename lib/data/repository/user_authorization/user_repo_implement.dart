import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/src/platform_file.dart';
import 'package:mime/mime.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/const/end_point.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
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
    List<MultipartFile> multipartFiles = [];

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

//!do requst
      var data = await apiServes.post(endpoint: endpoint, data: formData);
//!do parse
      UserModel userData = UserModel.fromJson(data);
      log(userData.data!.token.toString());
      log(userData.data!.user!.sId.toString());
      log(password);
      // token = userData.data!.token;
      // idUser = userData.data!.user!.sId;
      // currentPassword = password;
      //!do insert in cach
      CashNetwork.InsertToCash(key: 'token', value: userData.data!.token);
      CashNetwork.InsertToCash(key: 'idUser', value: userData.data!.user!.sId!);
      CashNetwork.InsertToCash(key: 'password', value: password);

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

  @override
  Future<Either<Failure, UserModel>> loginUser(
      {required String nationalId, required String password}) async {
    try {
      //endpoint
      String endpoint = EndPoints.signIn;

      //body

      Map<String, dynamic> bodyRequst = {
        "nationalId": nationalId,
        "password": password,
      };

//!do requst
      var data = await apiServes.post(endpoint: endpoint, data: bodyRequst);
//!do parse
      UserModel userData = UserModel.fromJson(data);
      log(userData.data!.token.toString());
      log(userData.data!.user!.sId.toString());
      log(password);
      // token = userData.data!.token;
      // idUser = userData.data!.user!.sId;
      // currentPassword = password;
      //!do inser in cach
      CashNetwork.InsertToCash(key: 'token', value: userData.data!.token);
      CashNetwork.InsertToCash(key: 'idUser', value: userData.data!.user!.sId!);
      CashNetwork.InsertToCash(key: 'password', value: password);
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
