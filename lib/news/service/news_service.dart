import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_connect.dart';
import 'package:tikchap/core/cache_manager.dart';
import 'package:tikchap/core/base_network.dart';
import 'package:get/get.dart';
import 'package:tikchap/news/model/comment_request_model.dart';
import 'package:tikchap/news/model/comment_response_model.dart';
import 'package:tikchap/news/model/news_model.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class NewsService extends GetConnect with CacheManager {
  //final String base = "192.168.115.210:8080";
  final String getNewsEndpoint = "/api/sudo/v1/get-all-news";

  final String AddNewCommentEndpoint = "/api/sudo/v1/add-comment-to-news";
  Future<List<NewsData?>> fetchNews() async {
    // final String loginUrl = base + SigninEndpoint;
    final String base = getBase().toString();
    var token = getFirstname();
    var getEvetUrl = Uri.http(base, getNewsEndpoint);
    var response = await http.get(
      getEvetUrl,
      headers: {'Content-Type': 'application/json', 'x-access-token': '$token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> das = json.decode(response.body);
      final List<dynamic> data = das["news"];

      return data.map((json) => NewsData.fromJson(json)).toList();
    } else {
      // print(json.decode(response.body));
      // inspect(response);
      return throw Exception();
    }
  }

  Future<List<NewsCommentResponseModel?>> fetchNewsComment(String news) async {
    final String getNewsCommentEndpoint =
        "/api/customer/v1/get-all-news-comment/$news";

    final String base = getBase().toString();

    var token = getFirstname();
    var getEvetUrl = Uri.http(base, getNewsCommentEndpoint);
    var response = await http.get(
      getEvetUrl,
      headers: {'Content-Type': 'application/json', 'x-access-token': '$token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> das = json.decode(response.body);
      final List<dynamic> data = das["news_comments"];
      //  print(data);

      return data
          .map((json) => NewsCommentResponseModel.fromJson(json))
          .toList();
    } else {
      // print(json.decode(response.body));
      // inspect(response);
      return throw Exception();
    }
  }

  Future addNewComment(
      NewsCommentRequestModel model) async {
    var token = getFirstname();
    final String base = getBase().toString();
    var registerUrl = Uri.http(base, AddNewCommentEndpoint);
    // print(registerUrl);
    //  print(model.toJson());

    var response = await http.post(
      registerUrl,
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': '$token'
        },

        body: jsonEncode(model.toJson()));
  
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
