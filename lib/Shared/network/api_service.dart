import 'package:dio/dio.dart';

class ApiServes {
  final Dio dio;
  String _baseUrl = "https://graduation-project-n8m0.onrender.com/api/";

  ApiServes({required this.dio});

  Future<dynamic> post(
      {required String endpoint, Map<String, dynamic>? bodyRequst}) async {
    // Make a POST request using Dio
    Response response = await dio.post(
      _baseUrl + endpoint,
      data: bodyRequst,
    );

    return response.data;
  }

  Future<dynamic> get({required String endPoint}) async {
    // do requst
    var response = await dio.get(_baseUrl + endPoint);
    return response.data; //contain a JSON object
  }

  Future<dynamic> patch(
      {required String endpoint,
      Map<String, dynamic>? bodyRequst,
      Map<String, dynamic>? headerRequst}) async {
    // Make a POST request using Dio
    Response response = await dio.patch(
      _baseUrl + endpoint,
      data: bodyRequst,
      options: Options(headers: headerRequst),
    );

    return response.data;
  }
}

Dio creatdio() {
  Dio dio = Dio();

  dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true));

  return dio;
}
