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
