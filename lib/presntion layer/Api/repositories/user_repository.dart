import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/presntion%20layer/Api/core/api/api_consumer.dart';
import 'package:voting/presntion%20layer/Api/core/api/end_points.dart';
import 'package:voting/presntion%20layer/Api/core/errors/exeptions.dart';
import 'package:voting/presntion%20layer/Api/functions/upload_images.dart';
import 'package:voting/presntion%20layer/Api/models/sign_in_model.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});

  Future<Either<String, SignInModel>> signIn(
      {required String nationalId, required String password}) async {
    try {
      final response = await api.post(EndPoints.signIn, data: {
        ApiKeys.nationalId: nationalId,
        ApiKeys.password: password,
      });

      final user = SignInModel.fromJson(response);

      final decoderToken = JwtDecoder.decode(user.data!.token!);
      CashNetwork.InsertToCash(key: ApiKeys.token, value: user.data!.token!);
      CashNetwork.InsertToCash(
          key: ApiKeys.id, value: decoderToken[ApiKeys.id]);

      return right(user);
    } on ServerExeptions catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> signUp(
      {required String nationalId,
      required PlatformFile idImage,
      required PlatformFile personalImage,
      required String password}) async {
    try {
      final response =
          await api.post(EndPoints.signUp, isFromData: true, data: {
        ApiKeys.nationalId: nationalId,
        ApiKeys.images: await uploadIDImage(
          idImage,
        ),
        ApiKeys.images: await uploadPersonalImage(personalImage),
        ApiKeys.password: password
      });
      return right('Success');
    } on ServerExeptions catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }
}
