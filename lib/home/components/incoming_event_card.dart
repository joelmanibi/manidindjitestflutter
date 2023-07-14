import 'package:flutter/material.dart';
import 'package:tikchap/booking/components/stand_list_view.dart';
import 'package:tikchap/event/model/event_response.dart';
//import 'package:tikchap/home/model/news_model.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class IncomingEventCard extends StatefulWidget {
  IncomingEventCard(this.data, {Key? key}) : super(key: key);
  EventResponseModel data;
  @override
  State<IncomingEventCard> createState() => _IncomingEventCardState();
}

class _IncomingEventCardState extends State<IncomingEventCard> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: SizedBox(
        width: (140 / 375.0) * MediaQuery.of(context).size.width,
        height: (140 / 375.0) * MediaQuery.of(context).size.width,
        child: GestureDetector(
            onTap: () => {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StandList(widget.data),
            ))
              //
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: Container(
                      padding: EdgeInsets.all(
                          (5 / 375.0) * MediaQuery.of(context).size.width),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                        image:  DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "http://192.168.40.210:8080/static/event/${widget.data.event_image!}"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.data.event_title!,
                    style: const TextStyle(
                        color: Color.fromARGB(172, 0, 0, 0),
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat.yMMMMd('fr_FR').format(DateTime.parse(widget.data.event_date!)).toString(),
                        style: TextStyle(
                          fontSize:
                              (12 / 375.0) * MediaQuery.of(context).size.width,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        widget.data.event_hour!,
                        style: TextStyle(
                          fontSize:
                              (12 / 375.0) * MediaQuery.of(context).size.width,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(
                              (8 / 375.0) * MediaQuery.of(context).size.width),
                          height:
                              (28 / 375.0) * MediaQuery.of(context).size.width,
                          width:
                              (28 / 375.0) * MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
