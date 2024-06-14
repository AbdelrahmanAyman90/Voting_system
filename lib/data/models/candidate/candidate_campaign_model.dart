class CandidateCampaignModel {
  Data? data;

  CandidateCampaignModel({this.data});

  CandidateCampaignModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Candidate? candidate;
  Campaign? campaign;

  Data({this.candidate, this.campaign});

  Data.fromJson(Map<String, dynamic> json) {
    candidate = json['candidate'] != null
        ? new Candidate.fromJson(json['candidate'])
        : null;
    campaign = json['campaign'] != null
        ? new Campaign.fromJson(json['campaign'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.candidate != null) {
      data['candidate'] = this.candidate!.toJson();
    }
    if (this.campaign != null) {
      data['campaign'] = this.campaign!.toJson();
    }
    return data;
  }
}

class Candidate {
  String? sId;
  String? user;
  String? name;
  String? education;
  String? job;
  String? image;

  Candidate(
      {this.sId, this.user, this.name, this.education, this.job, this.image});

  Candidate.fromJson(Map<String, dynamic> json) {
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

class Campaign {
  String? sId;
  String? candidate;
  String? video;
  String? bio;
  String? goals;
  int? iV;
  String? link;

  Campaign(
      {this.sId,
      this.candidate,
      this.video,
      this.bio,
      this.goals,
      this.iV,
      this.link});

  Campaign.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    candidate = json['candidate'];
    video = json['video'];
    bio = json['bio'];
    goals = json['goals'];
    iV = json['__v'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['candidate'] = this.candidate;
    data['video'] = this.video;
    data['bio'] = this.bio;
    data['goals'] = this.goals;
    data['__v'] = this.iV;
    data['link'] = this.link;
    return data;
  }
}
