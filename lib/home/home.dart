import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tikchap/event/event_view_model.dart';
import 'package:tikchap/news/news_view_model.dart';
import 'package:tikchap/home/components/breaking_news_card.dart';
import 'package:tikchap/home/components/incoming_event_card.dart';
import 'package:tikchap/news/model/news_model.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  EventViewModel eventController = Get.put(EventViewModel());
  NewsViewModel newsController = Get.put(NewsViewModel());
  TextEditingController searchController = Get.put(TextEditingController());
//  EventService? _eventService = Get.put(EventService());

  @override
  Widget build(BuildContext context) {
    List<NewsData?> newsDataList = [];

// Utilisez un FutureBuilder pour récupérer les données

    return SafeArea(
      child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 70,
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset("assets/icons/user.svg"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const Text(
          //         "Rechercher un evenement",
          //         style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //       GestureDetector(
          //         onTap: () {},
          //         child: const Text(""),
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                // fillColor: const Color.fromARGB(55, 119, 138, 119),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: "ex: cote d'ivoire vs maroc",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: searchController.text.isEmpty
                    ? InkWell(
                        onTap: () {
                          searchController.clear();
                        },
                        child: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                      )
                    : Container(),
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      GestureDetector(
                        onTap: () {},
                        child: const Text("Voir plus"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FutureBuilder(
                          future: eventController.getallEvent(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: (170 / 375.0) *
                                    MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.length,
                                  //eventController.getallEvent().length,
                                  itemBuilder: (context, index) =>
                                      IncomingEventCard(
                                    snapshot.data![index]!,
                                  ),
                                ),
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 150, vertical: 10),
                                child: Center(
                                  child: CircularProgressIndicator(
                                      color: Color(0xFF0E652F)),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Actualités",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      GestureDetector(
                        onTap: () {},
                        child: const Text("voir plus"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FutureBuilder<List<NewsData?>>(
                      future: newsController.getallNewss(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          return CarouselSlider.builder(
                            itemCount: 4,
                            itemBuilder: (context, index, realindex) {

                              return BreakingNewsCard(snapshot.data![index]!);
                            },
                            options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              enableInfiniteScroll: false,
                              enlargeCenterPage: true,
                            ),
                          );
                        }
                        // Retournez un widget vide car l'affichage du CarouselSlider se fera ci-dessous
                        return SizedBox.shrink();
                      },
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
