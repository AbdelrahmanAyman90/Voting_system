import 'package:dio/dio.dart';
import 'package:voting/presntion%20layer/Api/core/errors/error_model.dart';

class ServerExeptions implements Exception {
  final ErrorModel errorModel;

  ServerExeptions({required this.errorModel});
}

void handleDioExeption(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerExeptions(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerExeptions(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerExeptions(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerExeptions(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerExeptions(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 401:
          throw ServerExeptions(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 403:
          throw ServerExeptions(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 404:
          throw ServerExeptions(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 409:
          throw ServerExeptions(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 422:
          throw ServerExeptions(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 504:
          throw ServerExeptions(
              errorModel: ErrorModel.fromJson(e.response!.data));
      }

    case DioExceptionType.cancel:
      throw ServerExeptions(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerExeptions(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerExeptions(errorModel: ErrorModel.fromJson(e.response!.data));
  }
}
