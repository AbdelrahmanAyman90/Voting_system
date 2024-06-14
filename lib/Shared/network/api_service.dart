import 'package:dio/dio.dart';

//response for do api fun like get put post
class ApiServes {
  final Dio dio;
  String _baseUrl = "https://graduation-project-yok6.onrender.com/api/";

  ApiServes({required this.dio});

  Future<dynamic> post({
    required String endpoint,
    required Object data,
    Map<String, dynamic>? headerRequst,
  }) async {
    // Make a POST request using Dio
    Response response = await dio.post(
      _baseUrl + endpoint,
      data: data,
      options: Options(headers: headerRequst),
    );

    return response.data;
  }

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? headerRequst,
  }) async {
    // do requst
    var response = await dio.get(_baseUrl + endPoint,
        options: Options(headers: headerRequst));
    return response.data; //contain a JSON object
  }

  Future<dynamic> patch(
      {required String endpoint,
      Map<String, dynamic>? bodyRequst,
      Map<String, dynamic>? headerRequst}) async {
    // Make a Patch request using Dio
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
