class ElectionResult {
  String? status;
  Data? data;

  ElectionResult({this.status, this.data});

  ElectionResult.fromJson(Map<String, dynamic> json) {
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
  DataOfResult? results;

  Data({this.results});

  Data.fromJson(Map<String, dynamic> json) {
    results = json['results'] != null
        ? new DataOfResult.fromJson(json['results'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class DataOfResult {
  List<Results>? results;
  int? totalCount;
  int? totalUsers;

  DataOfResult({this.results, this.totalCount, this.totalUsers});

  DataOfResult.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
    totalUsers = json['totalUsers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    data['totalUsers'] = this.totalUsers;
    return data;
  }
}

class Results {
  Candidate? candidate;
  int? count;

  Results({this.candidate, this.count});

  Results.fromJson(Map<String, dynamic> json) {
    candidate = json['candidate'] != null
        ? new Candidate.fromJson(json['candidate'])
        : null;
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.candidate != null) {
      data['candidate'] = this.candidate!.toJson();
    }
    data['count'] = this.count;
    return data;
  }
}

class Candidate {
  String? sId;
  String? user;
  String? name;
  String? image;
  String? nationalId;

  Candidate({this.sId, this.user, this.name, this.image, this.nationalId});

  Candidate.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    name = json['name'];
    image = json['image'];
    nationalId = json['nationalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['name'] = this.name;
    data['image'] = this.image;
    data['nationalId'] = this.nationalId;
    return data;
  }
}
