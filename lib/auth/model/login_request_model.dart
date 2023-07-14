class LoginRequestModel {
  String? phone;
  String? password;

  LoginRequestModel({this.phone, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_phone'] = this.phone;
    data['user_password'] = this.password;
    return data;
  }
}
