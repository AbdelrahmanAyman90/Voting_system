class ErrorModel {
  final String status;
  final String errorMessage;
  final int code;
  Null data;

  ErrorModel({
    required this.status,
    required this.errorMessage,
    required this.code,
    this.data,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData['status'],
      errorMessage: jsonData['message'],
      code: jsonData['code'],
      data: jsonData['data'],
    );
  }
}
