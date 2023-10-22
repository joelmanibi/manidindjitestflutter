import 'package:tikchap/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikchap/booking/booking_view_model.dart';
import 'package:tikchap/booking/model/booking_response.dart';

class ValidationP extends StatefulWidget {
  ValidationP(this.data,{Key? key}) : super(key: key);
  EventStandResponseModel data;
  @override
  _ValidationPState createState() => _ValidationPState();
}

class _ValidationPState extends State<ValidationP> {
  final GlobalKey<FormState> formKey = GlobalKey();
  bool _showCircle = false;
  BookingViewModel _viewModel = Get.put(BookingViewModel());
 

  void _onshowCircle() {
    setState(() {
      _showCircle = !_showCircle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: loginForm()
      ),
    );
  }

  Padding loginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 190,
                height: 190,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
            ],
          ),
          
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child:  Text(
                        " Validation de paiement \n Ticket : ${widget.data!.stand_title} \n Match : ${widget.data!.event_title} \n A payer : ${widget.data!.e_s_price} FCFA + 1,5 % de frais",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF002920),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(125, 119, 138, 119),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF002920)),
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Code de Confirmation",
                    labelStyle:
                        const TextStyle(color: Colors.black26, fontSize: 16),
                  ),
                ),
                
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _viewModel.finalvalidation(widget.data.stadium_stand_id,
                      widget.data.event_id,widget.data.e_s_price,widget.data.e_s_price.toString(),
                      "ACCEPTER","VISA CARD"
                      );
                      _onshowCircle;
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF0E652F)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: const <Widget>[
                          Text("Valider",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _showCircle
                    ? const CircularProgressIndicator(color: Color(0xFFFF7F00))
                    : const CircularProgressIndicator(value: 0.0),
                const SizedBox(
                  height: 150,
                ),
                
              ],
            ),
          ),
        ],
      )),
    );
  }


}


