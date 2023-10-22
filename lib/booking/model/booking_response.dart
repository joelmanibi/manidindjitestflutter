class EventStandResponseModel {
  int? stadium_stand_id;
  String? stand_title;
  String? event_title;
  int? event_id;
  int? e_s_price;
  bool? e_s_status;

  EventStandResponseModel(
      {this.stadium_stand_id,
      this.stand_title,
      this.event_title,
      this.event_id,
      this.e_s_price,
      this.e_s_status});

  EventStandResponseModel.fromJson(Map<String, dynamic> json) {
    stadium_stand_id = json['e_s_stand'];
    stand_title = json['stadium_stand']['stand_title'];
    event_title = json['event']['event_title'];
    event_id = json['event']['event_id'];
    e_s_price = json['e_s_price'];
    e_s_status = json['e_s_status'];
  }
}

class BookingResponseModel {
  String? ticket_code;
  String? event_title;
  String? stand_title;


  BookingResponseModel({this.ticket_code, this.event_title,this.stand_title,});

  BookingResponseModel.fromJson(Map<String, dynamic> json) {
    ticket_code = json['ticket']['ticket_code'];
    event_title = json['event']['event_title'];
    stand_title = json['stadium_stand']['stand_title'];
  }
}
