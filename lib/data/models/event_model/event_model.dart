class EventModel {
  List<Events>? events;

  EventModel({this.events});

  EventModel.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  String? type;
  String? start;
  String? end;

  Events({this.type, this.start, this.end});

  Events.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}
