import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_connect.dart';
import 'package:tikchap/core/cache_manager.dart';
import 'package:tikchap/core/base_network.dart';
import 'package:get/get.dart';
import 'package:tikchap/event/model/event_response.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class EventService extends GetConnect with CacheManager {
  //final String base = "192.168.115.210:8080";
  final String getEventEndpoint = "/api/sudo/v1/get-all-event";
  Future<List<EventResponseModel?>> fetchEvent() async {
    // final String loginUrl = base + SigninEndpoint;
    final String base = getBase().toString();
    var token = getFirstname();
    var getEvetUrl = Uri.http(base, getEventEndpoint);
    var response = await http.get(
      getEvetUrl,
      headers: {'Content-Type': 'application/json', 'x-access-token': '$token'},
    );
    
    if (response.statusCode == 200) {
      
      final Map<String, dynamic> das = json.decode(response.body);
      final List<dynamic> data = das["event"];
      
      return data.map((json) => EventResponseModel.fromJson(json)).toList();
    } else {
      // print(json.decode(response.body));
      // inspect(response);
      return throw Exception();
    }
  }
}
