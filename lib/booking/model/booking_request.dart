class EventStandRequestModel {
  String? eventid;

  EventStandRequestModel({this.eventid});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventid'] = this.eventid;
    return data;
  }
}
