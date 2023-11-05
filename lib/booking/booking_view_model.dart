import 'package:get/get.dart';
import 'package:tikchap/booking/model/booking_request.dart';
import 'package:tikchap/booking/model/booking_response.dart';
import 'package:tikchap/booking/service/booking_service.dart';
import 'package:flutter/material.dart';

import '../bottomNavigationBar.dart';


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

  Future finalvalidation(
      int? ticket_stand,
      int? ticket_event,
      int? ticket_price,
      String payment_amount,
      String payment_status,
      String payment_mode) async {
    final response = await _bookingService!.sendTicketBooking(
        finalBookRequestModel(
            ticket_stand: ticket_stand,
            ticket_event: ticket_event,
            ticket_price: ticket_price,
            payment_amount: payment_amount,
            payment_status: payment_status,
            payment_mode: payment_mode));
    
    if (response != null) {
      Get.defaultDialog(
          title: "Félicitation!",
          middleText: 'Rendez-vous bientot au Stade pour le match',
          textConfirm: 'OK',
          backgroundColor: Color.fromARGB(255, 221, 233, 229),
          confirmTextColor: Colors.white,
          buttonColor: const Color(0xFF0E652F),
          onConfirm: () {
            Get.offAll(const Dashboard());
          });
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          title: "ERREUR",
          middleText: 'Echec de validation',
          textConfirm: 'OK',
          backgroundColor: Color.fromARGB(255, 199, 166, 164),
          confirmTextColor: Colors.white,
          buttonColor: Colors.red,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
