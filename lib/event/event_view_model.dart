import 'package:tikchap/core/authentication_manager.dart';
import 'package:tikchap/auth/model/login_request_model.dart';
import 'package:tikchap/auth/model/register_request_model.dart';
import 'package:tikchap/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikchap/event/model/event_response.dart';
import 'package:tikchap/event/service/event_service.dart';

class EventViewModel extends GetxController {
  EventService? _eventService;

  @override
  void onInit() {
    super.onInit();
    _eventService = Get.put(EventService());
  }

  Future<List<EventResponseModel?>> getallEvent() async {
    final response = await _eventService!.fetchEvent();
   
    // ignore: unnecessary_null_comparison
    if (response != null) {
      
      return response;
    } else {
      /// Show user a dialog about the error response
      // print("error");
      return throw Exception();
    }
  }
}
