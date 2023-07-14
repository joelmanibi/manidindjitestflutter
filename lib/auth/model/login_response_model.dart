class LoginResponseModel {
  String? firstname;
  String? lastname;
  String? phone;
  String? token;

  LoginResponseModel({this.token,this.firstname,this.lastname,this.phone});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    firstname = json['user_firstname'];
    lastname = json['user_lastname'];
    phone = json['user_phone'];
    token = json['user_token'];
  }
}
