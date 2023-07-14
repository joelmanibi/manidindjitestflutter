import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tikchap/event/event_view_model.dart';
import 'package:tikchap/event/model/event_response.dart';
import 'package:tikchap/home/components/breaking_news_card.dart';
import 'package:tikchap/home/components/incoming_event_card.dart';
import 'package:tikchap/news/model/news_model.dart';
import 'package:tikchap/event/service/event_service.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  EventViewModel eventController = Get.put(EventViewModel());
//  EventService? _eventService = Get.put(EventService());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 70,
            ),
            GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.person,
                  color: Color.fromARGB(179, 15, 15, 15),
                  size: 30,
                )),
          ],
        ),
      ),
      const SizedBox(height: 4),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Rechercher un evenement",
                style: TextStyle(fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () {},
              child: const Text(""),
            ),
          ],
        ),
      ),
      const SizedBox(height: 4),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(55, 119, 138, 119),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none),
            hintText: "ex: cote d'ivoire vs maroc",
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),

      // Widget à défiler en dessous
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 40),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Reservez vos billets",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26.0,)),
            GestureDetector(
              onTap: () {},
              child: const Text("voir plus"),
            ),
          ],
        ),
      ),
      const SizedBox(height: 4),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              FutureBuilder(
                  future: eventController.getallEvent(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height:
                            (170 / 375.0) * MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            //eventController.getallEvent().length,
                            itemBuilder: (context, index) => IncomingEventCard(
                                snapshot.data![index]!)),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  })
            ])),
      ),
     
      
      const SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Actualités",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                )),
            GestureDetector(
              onTap: () {},
              child: const Text("voir plus"),
            ),
          ],
        ),
      ),
      CarouselSlider.builder(
          itemCount: NewsData.breakingNewsData.length,
          itemBuilder: (context, index, id) =>
              BreakingNewsCard(NewsData.breakingNewsData[index]),
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
          )),
              ]))

      
    ]));
  }
}
