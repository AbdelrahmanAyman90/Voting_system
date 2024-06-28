import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/const/end_point.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';

import 'package:voting/data/repository/form_candidate/form_candidate_repo.dart';
import 'package:http_parser/http_parser.dart';

class FormCandidateRepoImplemntion extends FormCandidateRepo {
  final ApiServes apiServes;
  FormCandidateRepoImplemntion({required this.apiServes});

  @override
  Future<Either<Failure, String>> addFormCandidate(
      {required List<PlatformFile?> images,
      required String name,
      required String job,
      required String education}) async {
    //! convert to list
    List<PlatformFile> selectedFiles =
        images.where((image) => image != null).map((image) => image!).toList();

//!convert image to cand upload to api and represnt the type
    List<MultipartFile> multipartFiles = [];
    for (var file in selectedFiles) {
      var mimeType = lookupMimeType(file.path!) ?? 'application/octet-stream';
      var multipartFile = await MultipartFile.fromFile(
        file.path!,
        filename: file.name,
        contentType: MediaType.parse(mimeType),
      );
      multipartFiles.add(multipartFile);
    }
    try {
      //endpoint
      String endpoint = EndPoints.Candidate;
      //header
      Map<String, dynamic> headerRequest = {
        'authorization': "bearer ${token}",
      };
      //body

      FormData formData = FormData.fromMap({
        'images': multipartFiles,
      });
      formData.fields.add(MapEntry('name', name));
      formData.fields.add(MapEntry('job', job));
      formData.fields.add(MapEntry('education', education));

//do requst
      var data = await apiServes.post(
          endpoint: endpoint, data: formData, headerRequst: headerRequest);
      CashNetwork.InsertToCash(key: 'isCandidatSelf', value: "true");
      return right(data['message']);
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
