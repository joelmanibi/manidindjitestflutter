import 'package:flutter/material.dart';
import 'package:tikchap/booking/booking_view_model.dart';
import 'package:tikchap/event/event_view_model.dart';
import 'package:get/get.dart';
import 'package:tikchap/event/model/event_response.dart';

class StandList extends StatefulWidget {
  StandList(this.data, {Key? key}) : super(key: key);
  EventResponseModel data;
  

  @override
  _StandListState createState() => _StandListState();
}

class _StandListState extends State<StandList> {
   BookingViewModel bookingController = Get.put(BookingViewModel());
//  EventService? _eventService = Get.put(EventService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.orange.shade900),
      ),
        body: SafeArea(
            child: Column(
                // 0170582276  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Reservation de ticket",
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 26),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Hero(
              tag: "${widget.data.event_title}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                    "http://192.168.40.210:8080/static/event/${widget.data.event_image!}"),
              ),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Rencontre:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("${widget.data.event_title}",
                      style: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold))
                ]),
          ),

          const SizedBox(
            height: 12.0,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Lieux:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("${widget.data.event_stadium}",
                      style: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold))
                ]),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Heure:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("${widget.data.event_hour}",
                      style: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold))
                ]),
          ),

          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Veuillez Selectionnez une tribune!",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // Widget à défiler en dessous
          Expanded(
              child: FutureBuilder(
                  future: bookingController.getEventStand(widget.data.event_id.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                                padding: const EdgeInsets.all(0),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          55, 119, 138, 119),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Text(
                                                      '${snapshot.data![index]!.stand_title}',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            197, 0, 0, 0),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    31, 248, 245, 245),
                                              ),
                                              child: const Padding(
                                                padding:
                                                    EdgeInsets.all(0.0),
                                                child: Text(
                                                  '',
                                                ),
                                              ),
                                            ),
                                          ]),


                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              margin: const EdgeInsets.only(
                                            top: 10),
                                              child: const Padding(
                                                padding:
                                              EdgeInsets.all(0.0),
                                                child: Text(
                                            'Cout du billet',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  197, 0, 0, 0),
                                            ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Text(
                                                  '${snapshot.data![index]!.e_s_price} FCFA',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        197, 0, 0, 0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            
                                          ]
                                          ),

                                          Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              margin: const EdgeInsets.only(
                                            top: 10),
                                              child: const Padding(
                                                padding:
                                              EdgeInsets.all(0.0),
                                                child: Text(
                                            'Billet disponible',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  197, 0, 0, 0),
                                            ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Text(
                                                  '${snapshot.data![index]!.e_s_price}',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        197, 0, 0, 0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            
                                          ]
                                          ),

                                    ]),


                                  ),
                                  
                                ]))
                            ),
                                  )));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }))
        ])));
  }
}
