class NewsModel {
  String? header;
  String? description;
  String? createdAt;
  String? image;
  NewsModel({this.header, this.description, this.createdAt, this.image});

  NewsModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    description = json['description'];
    createdAt = json['createdAt'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
