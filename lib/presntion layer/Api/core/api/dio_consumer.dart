import 'package:dio/dio.dart';
import 'package:voting/presntion%20layer/Api/core/api/api_consumer.dart';
import 'package:voting/presntion%20layer/Api/core/api/end_points.dart';
import 'package:voting/presntion%20layer/Api/core/errors/exeptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(const Interceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }
  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      bool isFromData = false}) async {
    try {
      final response = await dio.delete(path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
          options: options);
      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.get(path,
          data: data, queryParameters: queryParameters, options: options);
      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      bool isFromData = false}) async {
    try {
      final response = await dio.patch(path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
          options: options);
      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      bool isFromData = false}) async {
    try {
      final response = await dio.post(path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
          options: options);
      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }
}
