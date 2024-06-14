import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/src/platform_file.dart';
import 'package:mime/mime.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/network/error_network.dart';
import 'package:voting/data/repository/add_campiagn/add_campiagn_repo.dart';
import 'package:http_parser/http_parser.dart';

class AddCampiagnRepoImplemntion extends AddCampiagnRepo {
  final ApiServes apiServes;
  AddCampiagnRepoImplemntion({required this.apiServes});
  @override
  Future<Either<Failure, String>> addCampaignForCandidate(
      {required String bio,
      required String goals,
      required PlatformFile video,
      String? link}) async {
//!convert vedio to cand upload to api and represnt the type
    var mimeType = lookupMimeType(video.path!) ?? 'application/octet-stream';
    var multipartFile = await MultipartFile.fromFile(
      video.path!,
      filename: video.name,
      contentType: MediaType.parse(mimeType),
    );

    try {
      String endpoint = "campaign";
      //header
      Map<String, dynamic> headerRequest = {
        'authorization': "bearer ${token}",
      };
      //body

      FormData formData = FormData.fromMap({
        'video': multipartFile,
      });
      formData.fields.add(MapEntry('bio', bio));
      formData.fields.add(MapEntry('goals', goals));
      link != null ? formData.fields.add(MapEntry('kink', link)) : null;

//do requst
      var data = await apiServes.post(
          endpoint: endpoint, data: formData, headerRequst: headerRequest);

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
