class EventStandResponseModel {
  int? stadium_stand_id;
  String? stand_title;
  int? e_s_price;

  EventStandResponseModel(
    {
      this.stadium_stand_id,
      this.stand_title,
      this.e_s_price
    });
    
  EventStandResponseModel.fromJson(Map<String, dynamic> json) {
    stadium_stand_id = json['e_s_stand'];
    stand_title = json['stadium_stand']['stand_title'];
    e_s_price = json['e_s_price'];
    }
  
}
