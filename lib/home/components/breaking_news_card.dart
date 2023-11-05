import 'package:flutter/material.dart';
import 'package:tikchap/core/base_network.dart';
import 'package:tikchap/news/detail_view.dart';
import 'package:tikchap/news/model/news_model.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BreakingNewsCard extends StatefulWidget {
  BreakingNewsCard(this.data, {Key? key}) : super(key: key);
  NewsData data;
  @override
  State<BreakingNewsCard> createState() => _BreakingNewsCardState();
}

class _BreakingNewsCardState extends State<BreakingNewsCard> {
  final String base = getBase().toString();
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
    
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(widget.data),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                "http://${base}/static/news/${widget.data.image!}"),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.data.source!,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    formatRelativeDate(widget.data.createdAt!),
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
