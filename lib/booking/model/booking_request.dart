class EventStandRequestModel {
  String? eventid;

  EventStandRequestModel({this.eventid});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventid'] = this.eventid;
    return data;
  }
}

class finalBookRequestModel {
  int? ticket_stand;
  int? ticket_event;
  int? ticket_price;
  String? payment_amount;
  String? payment_status;
  String? payment_mode;

  finalBookRequestModel({this.ticket_stand, this.ticket_event,this.ticket_price,this.payment_amount,this.payment_status,this.payment_mode});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_stand'] = this.ticket_stand;
    data['ticket_event'] = this.ticket_event;
    data['ticket_price'] = this.ticket_price;
    data['payment_amount'] = this.payment_amount;
    data['payment_status'] = this.payment_status;
    data['payment_mode'] = this.payment_mode;
    return data;
  }
}

