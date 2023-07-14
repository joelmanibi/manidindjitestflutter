class RegisterResponseModel {
  String? firstname;
  String? lastname;
  String? phone;
  String? token;
  
  RegisterResponseModel({this.phone, this.firstname,this.lastname,this.token});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    firstname = json['user_firstname'];
    lastname = json['user_lastname'];
    phone = json['user_phone'];
    token = json['user_token'];
    
  }
}
