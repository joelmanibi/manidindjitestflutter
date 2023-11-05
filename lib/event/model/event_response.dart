class EventResponseModel {
  int? event_id;
  String? event_title;
  String? event_date;
  String? event_image;
  String? event_hour;
  String? event_stadium;

  EventResponseModel(
    {
      this.event_id,
      this.event_title,
      this.event_date,
      this.event_image,
      this.event_stadium,
      this.event_hour
    });
    

  EventResponseModel.fromJson(Map<String, dynamic> json) {
    event_id = json['event_id'];
    event_title = json['event_title'];
    event_date = json['event_date'];
    event_image = json['event_image'];
    event_hour = json['hour']['hour_title'];
    event_stadium = json['stadium']['stadium_title'];
  }
  
}
