class SignInModel {
  String? status;
  Data? data;

  SignInModel({this.status, this.data});

  SignInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? nationalId;
  String? dateOfBirth;
  String? gender;
  String? address;
  String? account;

  User(
      {this.sId,
      this.name,
      this.nationalId,
      this.dateOfBirth,
      this.gender,
      this.address,
      this.account});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    nationalId = json['nationalId'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    address = json['address'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['nationalId'] = this.nationalId;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['account'] = this.account;
    return data;
  }
}

// import 'package:voting/presntion%20layer/Api/core/api/end_points.dart';

// class UserModel {
//   // final String id;
//   // final String nationalId;
//   final String token;

//   UserModel({
//     required this.token,
//     // required this.id,
//     // required this.nationalId,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> jsonData) {
//     return UserModel(
//       // id: jsonData['user'][ApiKeys.id],
//       // nationalId: jsonData['user'][ApiKeys.nationalId],
//       token: jsonData['data'][ApiKeys.token],
//     );
//   }
// }
// 