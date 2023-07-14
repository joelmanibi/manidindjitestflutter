import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tikchap/home/home.dart';

class MyTicket extends StatefulWidget {
  @override
  _MyTicketState createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket>  {
  

  textStyle() {
    return const TextStyle(color: Colors.black, fontSize:20.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF7F00),
       
        title: const Text('Mon E-Ticket',
        textAlign: TextAlign.center,),

      ),

      body: Column(
        children: [

        Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),

      child: Column(
        children:[
         
        GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child:Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      
      child: Column(
        children:[

          
          Container(

          padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
          decoration: BoxDecoration(
      color: const Color.fromARGB(36, 255, 128, 0),
      borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
      children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(31, 248, 245, 245),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Image.asset(
                      'assets/UTB.png',
                      height: 50,
                      width: 50,
                    ),
                ),
              ),
              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top:20,bottom: 20),
                child: const Padding(
                  padding: EdgeInsets.all(00),
                  child: Text(
                        'Cote divoire vs Maroc',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(197, 0, 0, 0),
                        ),
                      ),
                ),
              ),
              
            ]
            ),
              
              
            ]
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        'Heure',
                      ),
                ),
              ),
            ]
            ),

              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10,right: 120),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        'Date',
                      ),
                ),
              ),
            ]
            ),

            ]
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        '08:30',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(197, 0, 0, 0),
                        ),
                      ),
                ),
              ),
            ]
            ),

              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10,right: 35),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        '02 Oct, 2022',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(197, 0, 0, 0),
                        ),
                      ),
                ),
              ),
            ]
            ),

            ]
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        'Stade',
                      ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        'STADE FELIX HOUPHOUET BOIGNY',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(197, 0, 0, 0),
                        ),
                      ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        'Ville Hote',
                      ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        'ABIDJAN',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(197, 0, 0, 0),
                        ),
                      ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                    'Tribune',
                  ),
            ),
          ),
            ]
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                    'Tribune lagunaire',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(197, 0, 0, 0),
                    ),
                  ),
            ),
          ),
            ]
            ),

        

        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        '',
                      ),
                ),
              ),
            ]
            ),

              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15,right:125),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        'Cout',
                      ),
                ),
              ),
            ]
            ),

            ]
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(197, 0, 0, 0),
                        ),
                      ),
                ),
              ),
            ]
            ),

              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10,right: 37),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                        '10,000 FCFA',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(197, 0, 0, 0),
                        ),
                      ),
                ),
              ),
            ]
            ),

            ]
          ),
          const Divider(
            color: Color.fromARGB(62, 0, 0, 0),
          ),

      ]
          ),
        ),

        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
      color: const Color.fromARGB(36, 255, 128, 0),
      borderRadius: BorderRadius.circular(12),
          ),

          child: Column(
      children:[
          Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(31, 248, 245, 245),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: QrImage(
                        data: "12gyu5d5f2f6rgf2g5fg2fg6f3gfg@yi7890",
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                        ),
                      ),
                    ]
                  ),

          const Divider(
            color: Colors.black
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
               Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.brightness_1,
                    color: Color.fromARGB(202, 45, 201, 6)
                  ),
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
                ]
              ),
            
          ]
        ),
      ]
    ),
  )

      ]
          )
        ),
        ),

      ]
          )
        ),

        
      ],
    ),

    );
  }
}
