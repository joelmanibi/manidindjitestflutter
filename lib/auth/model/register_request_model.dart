class RegisterRequestModel {
  String? phone;
  String? password;
  String? lastname;
  String? firstname;

  RegisterRequestModel({this.phone, this.password,this.firstname,this.lastname});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_phone'] = this.phone;
    data['user_lastname'] = this.lastname;
    data['user_firstname'] = this.firstname;
    data['user_password'] = this.password;
    return data;
  }
}
