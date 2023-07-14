import 'package:get/get.dart';
import 'package:tikchap/booking/model/booking_response.dart';
import 'package:tikchap/booking/service/booking_service.dart';

class BookingViewModel extends GetxController {
  BookingService? _bookingService;

  @override
  void onInit() {
    super.onInit();
    _bookingService = Get.put(BookingService());
  }

  Future<List<EventStandResponseModel?>> getEventStand(String eventid) async {
    final response = await _bookingService!.fetchEventStand(eventid);
    //print(response);
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
