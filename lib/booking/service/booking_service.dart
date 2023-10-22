import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_connect.dart';
import 'package:tikchap/booking/model/booking_request.dart';
import 'package:tikchap/booking/model/booking_response.dart';
import 'package:tikchap/core/base_network.dart';
import 'package:tikchap/core/cache_manager.dart';
import 'package:get/get.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class BookingService extends GetConnect with CacheManager {
  // final String base = "192.168.115.210:8080";

  Future<List<EventStandResponseModel?>> fetchEventStand(String eventid) async {
    // final String loginUrl = base + SigninEndpoint;
    final String base = getBase().toString();
    final String getEventEndpoint =
        "/api/customer/v1/get-all-event-stand/$eventid";
    var token = getFirstname();
    var getEvetUrl = Uri.http(base, getEventEndpoint);
    var response = await http.get(
      getEvetUrl,
      headers: {
        'Content-Type': 'application/json',
        //  'x-access-token': '$token'
      },
    );
    //  print(token);
    if (response.statusCode == 200) {
      
      final Map<String, dynamic> das = json.decode(response.body);
      final List<dynamic> data = das["event_s"];
      // print(data);
      return data
          .map((json) => EventStandResponseModel.fromJson(json))
          .toList();
    } else {
      return throw Exception();
    }
  }

  Future sendTicketBooking(
      finalBookRequestModel model) async {
    final String base = getBase().toString();
    const String bookingEndpoint = "/api/sudo/v1/booking";
    var token = getFirstname();
    var bookingUrl = Uri.http(base, bookingEndpoint);
    //  print(registerUrl);
       

    var response = await http.post(bookingUrl,
        headers: {'Content-Type': 'application/json',
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
