class QustionModel {
  String? sId;
  String? question;
  String? answer;

  QustionModel({this.sId, this.question, this.answer});

  QustionModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}
