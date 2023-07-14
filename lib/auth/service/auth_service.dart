import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tikchap/auth/model/login_request_model.dart';
import 'package:tikchap/auth/model/login_response_model.dart';
import 'package:tikchap/auth/model/register_request_model.dart';
import 'package:tikchap/auth/model/register_response_model.dart';
import 'package:get/get_connect.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class LoginService extends GetConnect {
  final String base = "192.168.40.210:8080";
  final String SigninEndpoint = "/api/auth/signin-customer";
  final String SignupEndpoint = "/api/auth/signup-customer";
  

 Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
   // final String loginUrl = base + SigninEndpoint;
   
    var loginUrl = Uri.http(base, SigninEndpoint);
    var response = await http.post(loginUrl,
     headers: {'Content-Type': 'application/json'},
        body: jsonEncode(model.toJson())
        );
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      // inspect(response);
      return null;
    }
  }

  Future<RegisterResponseModel?> fetchRegister(
      RegisterRequestModel model) async {
        var registerUrl = Uri.http(base, SignupEndpoint);
        print(registerUrl);
        print(model.toJson());

        var response = await http.post(
          registerUrl,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(model.toJson())
            );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
