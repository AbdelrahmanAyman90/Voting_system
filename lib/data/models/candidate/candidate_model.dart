class CandidateModel {
  String? sId;
  String? user;
  String? name;
  String? education;
  String? job;
  String? image;

  CandidateModel(
      {this.sId, this.user, this.name, this.education, this.job, this.image});

  CandidateModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    name = json['name'];
    education = json['education'];
    job = json['job'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['name'] = this.name;
    data['education'] = this.education;
    data['job'] = this.job;
    data['image'] = this.image;
    return data;
  }
}
