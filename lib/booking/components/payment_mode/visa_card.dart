import 'package:flutter/material.dart';
import 'package:tikchap/booking/components/payment_mode/validation_booking.dart';
import 'package:tikchap/booking/model/booking_response.dart';

class CreditCardForm extends StatefulWidget {
  CreditCardForm(this.data, {Key? key}) : super(key: key);
  EventStandResponseModel data;

  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  bool _showCircle = false;

  void _onshowCircle() {
    setState(() {
      _showCircle = !_showCircle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informations de carte de crédit',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.number,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(123, 179, 184, 179),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF002920)),
                  borderRadius: BorderRadius.circular(10)),
              labelText: "Numero de carte",
              labelStyle: const TextStyle(color: Colors.black26, fontSize: 16),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(123, 179, 184, 179),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF002920)),
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Date d\'expiration",
                    labelStyle:
                        const TextStyle(color: Colors.black26, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(123, 179, 184, 179),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF002920)),
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "CVV",
                    labelStyle:
                        const TextStyle(color: Colors.black26, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              
              _onshowCircle();
              Future.delayed(Duration(seconds: 5), () {
                _onshowCircle();
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ValidationP(widget.data),
                ));
              });
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF0E652F)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Column(
                children: <Widget>[
                  Text("Valider le paiement", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _showCircle
              ? const CircularProgressIndicator(color: Color(0xFFFF7F00))
              : const CircularProgressIndicator(value: 0.0),
        ],
      ),
    );
  }
}
