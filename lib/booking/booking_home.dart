import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tikchap/booking/components/singleTicket_view.dart';
import 'package:tikchap/event/event_view_model.dart';
import 'package:tikchap/home/home.dart';
import 'package:get/get.dart';

class MyBooking extends StatefulWidget {
  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking>
    with SingleTickerProviderStateMixin {
  EventViewModel eventController = Get.put(EventViewModel());
//  EventService? _eventService = Get.put(EventService());
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: list.length, vsync: this); // initialise it here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> list = [
    Tab(
        icon: SvgPicture.asset(
          "assets/icons/ticket.svg",
          color: Colors.white,
          height: 25,
          width: 25,
        ),
        text: 'Tickets Match'),
    Tab(
        icon: SvgPicture.asset(
          "assets/icons/bed.svg",
          color: Colors.white,
          height: 25,
          width: 25,
        ),
        text: 'Hebergement'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0E652F),
        bottom: TabBar(
          labelColor: Color(0xFFFF7F00), // Couleur du texte de l'onglet actif
          unselectedLabelColor: Colors.white,
          controller: _tabController,
          isScrollable: true,
          tabs: list,
          indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: Colors.white),
              insets: EdgeInsets.symmetric(horizontal: 0.0)),
          indicatorWeight: 4.0,
          labelPadding: const EdgeInsets.only(left: 30.0, right: 30.0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune, color: Colors.white),
          )
        ],
        title: const Text(
          'Mes reservations',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => MyTicket());
                      },
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                          height: Get.height,
                        ),
                        child: ListView.builder(
                          shrinkWrap: false,
                          scrollDirection: Axis.vertical,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: SizedBox(
                                    height: 150,
                                    width: 350,
                                    child: Image.asset(
                                      "assets/ticket.jpg",
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 113, left: 205),
                                  child: Text(
                                    '10 000 FCFA',
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 99, left: 205),
                                  child: Text(
                                    'Lagunaire',
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 89, left: 205),
                                  child: Text(
                                    'H2',
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 50, left: 25),
                                  child: Text(
                                    "Côte d'Ivoire",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 50, left: 145),
                                  child: Text(
                                    "Guinée Bissao",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 75, left: 95),
                                  child: Text(
                                    "Janvier",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 93, left: 90),
                                  child: Text(
                                    "Dimanche 13 2024",
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 105, left: 90),
                                  child: Text(
                                    "20H00",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 122, left: 90),
                                  child: Text(
                                    "Stade Olympique Alassane Ouattara",
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 255),
                                  child: QrImage(
                                    data:
                                        "12gyu5d5f2f6rgf2g5fg2fg6f3gfg@yi7890",
                                    version: QrVersions.auto,
                                    size: 100,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text("Aucune reservations effectué"),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
