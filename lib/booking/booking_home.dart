import 'package:flutter/material.dart';
import 'package:tikchap/booking/components/singleTicket_view.dart';
import 'package:tikchap/event/event_view_model.dart';
import 'package:tikchap/home/home.dart';
import 'package:get/get.dart';

class MyBooking extends StatefulWidget {
  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> with SingleTickerProviderStateMixin {
  EventViewModel eventController = Get.put(EventViewModel());
//  EventService? _eventService = Get.put(EventService());
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length:list.length, vsync: this);// initialise it here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> list = [
    Tab(icon: Icon(Icons.confirmation_num),
      text: 'Tickets Match'),
    Tab(icon: Icon(Icons.hotel),
    text: 'Hebergement'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF7F00),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: list,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: Colors.white),
              insets: EdgeInsets.symmetric(horizontal: 0.0)),
          indicatorWeight: 4.0,
          labelPadding: EdgeInsets.only(left: 30.0, right: 30.0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune),
          )
        ],
        title: Text('Mes tickets'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(children: [
                    
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyTicket()),
                        );
                      },
                      child: Container(
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(children: [
                            Container(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 10),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(36, 255, 128, 0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Text(
                                            'Cote divoire vs Maroc',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  197, 0, 0, 0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(31, 248, 245, 245),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Text(
                                            '10,000 FCFA',
                                          ),
                                        ),
                                      ),
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: const Padding(
                                                padding: EdgeInsets.all(0.0),
                                                child: Text(
                                                  'Debut',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: const Padding(
                                                padding: EdgeInsets.all(0.0),
                                                child: Text(
                                                  ':',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: const Padding(
                                                padding: EdgeInsets.all(0.0),
                                                child: Text(
                                                  '08:30',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        197, 0, 0, 0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Text('Tribune lagunaire'),
                                        ),
                                      ),
                                    ]),
                              ]),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(36, 255, 128, 0),
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
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: const Padding(
                                                padding: EdgeInsets.all(0.0),
                                                child: Text('Sam,24 sept 2022'),
                                              ),
                                            ),
                                          ]),
                                      
                                    ]),
                                Divider(color: Colors.black),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: const Padding(
                                                padding: EdgeInsets.all(0.0),
                                                child: Icon(Icons.brightness_1,
                                                    color: Color.fromARGB(
                                                        202, 45, 201, 6)),
                                              ),
                                            ),
                                            Container(
                                              child: const Padding(
                                                padding: EdgeInsets.all(0.0),
                                                child: Text(
                                                  'En attente',
                                                ),
                                              ),
                                            ),
                                          ]),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyTicket()),
                                          );
                                        },
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Container(
                                                child: const Padding(
                                                  padding: EdgeInsets.all(0.0),
                                                  child: Text(
                                                    'Detail',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: const Padding(
                                                  padding: EdgeInsets.all(0.0),
                                                  child: Icon(
                                                      Icons.navigate_next,
                                                      color: Color.fromARGB(
                                                          179, 15, 15, 15)),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ]),
                              ]),
                            )
                          ])),
                    ),

                  ])),
            ],
          )),
          SingleChildScrollView(
              child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(children: [
                    Text("Aucune reservations effectué")
                  ])),
            ],
          )),
        ],
      ),
    );
  }
}
