class SignUpModel {
  String? status;
  Data? data;

  SignUpModel({this.status, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
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
  late String token;

  Data({this.user, required this.token});

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
  String? name;
  String? nationalId;
  String? dateOfBirth;
  String? gender;
  String? address;
  String? account;
  String? sId;

  User(
      {this.name,
      this.nationalId,
      this.dateOfBirth,
      this.gender,
      this.address,
      this.account,
      this.sId});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nationalId = json['nationalId'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    address = json['address'];
    account = json['account'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nationalId'] = this.nationalId;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['account'] = this.account;
    data['_id'] = this.sId;
    return data;
  }
}
