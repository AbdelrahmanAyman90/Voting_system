import 'package:voting/presntion%20layer/Api/core/api/end_points.dart';

class ChangePasswordModel {
  final String message;
  final String status;

  ChangePasswordModel({
    required this.message,
    required this.status,
  });
  factory ChangePasswordModel.fromJson(Map<String, dynamic> jsonData) {
    return ChangePasswordModel(
        status: jsonData[ApiKeys.status], message: jsonData[ApiKeys.message]);
  }
}
