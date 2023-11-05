import 'package:flutter/material.dart';
import 'package:tikchap/bottomNavigationBar.dart';
import 'package:tikchap/core/base_network.dart';
import 'package:tikchap/news/model/news_model.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:tikchap/news/news_view_model.dart';
import 'package:get/get.dart';
import 'package:tikchap/onboard.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(this.data, {Key? key}) : super(key: key);
  NewsData data;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final String base = getBase().toString();
  NewsViewModel newsController = Get.put(NewsViewModel());
  TextEditingController _commentController = TextEditingController();

  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null);
  }

  String formatRelativeDate(String date) {
    final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    final publicationDate = formatter.parse(date);
    final now = DateTime.now();
    final difference = now.difference(publicationDate);

    if (difference.inMinutes < 2) {
      return "Il y a ${difference.inMinutes.toString()} minute";
    } else if (difference.inMinutes < 60) {
      return "Il y a ${difference.inMinutes.toString()} minutes";
    } else if (difference.inHours < 2) {
      return "Il y a 1 heure";
    } else if (difference.inHours < 24) {
      return "Il y a ${difference.inHours.toString()} heures";
    } else {
      final dateFormatter = DateFormat('dd/MM/yyyy à HH:mm');
      return dateFormatter.format(publicationDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.orange.shade900),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Naviguez vers la page d'accueil ou toute autre page souhaitée
            Get.to(Dashboard()); // Utilisez GetX pour gérer la navigation
            //Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.title!,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
                child: ListView(children: [
              SizedBox(
                height: 10.0,
              ),
              Hero(
                tag: "${widget.data.title}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                      "http://${base}/static/news/${widget.data.image!}"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "source: ${widget.data.source!}",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        formatRelativeDate(widget.data.createdAt!),
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.visibility,
                            color: Colors.black54,
                          ),
                          Text(
                            "  ${widget.data.vue!} vues",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 18.0,
              ),
              ExpandableText(
                widget.data.content!,
                expandText: 'voir plus',
                collapseText: 'reduire',
                maxLines: 3,
                linkColor: Colors.orange.shade900,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.person_outline_sharp,
                    color: Colors.black54,
                  ),
                  Text(
                    "Publier par : ${widget.data.author!}",
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 18.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.comment, color: Colors.black54),
                  Text(
                    "Commentaires",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              FutureBuilder(
                  future: newsController
                      .getallNewsComments(widget.data.id.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 200.0,
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            //  Comment comment = comments[index];

                            return Card(
                              margin: EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: CircleAvatar(child: Text("HK")),
                                title: Text(
                                    "${snapshot.data![index]!.newsComment_authorFn}"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${snapshot.data![index]!.newsComment_content}"),
                                    Text(
                                      formatRelativeDate(
                                          snapshot.data![index]!.createAt!),
                                      style: const TextStyle(
                                          fontSize: 12.0, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(child: Text("Aucun commentaire"));
                    }
                  }),
            ])),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _commentController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Ajouter un commentaire',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      newsController.addcomment(
                          widget.data.id, _commentController.text);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
