import 'package:flutter/material.dart';
import 'package:tikchap/booking/booking_view_model.dart';
import 'package:get/get.dart';
import 'package:tikchap/booking/components/payment_mode/moov_mode.dart';
import 'package:tikchap/booking/components/payment_mode/om_mode.dart';
import 'package:tikchap/booking/components/payment_mode/visa_card.dart';
import 'package:tikchap/booking/components/payment_mode/wave_mode.dart';
import 'package:tikchap/booking/model/booking_response.dart';

class PaymentMode extends StatefulWidget {
  PaymentMode(this.data, {Key? key}) : super(key: key);
  EventStandResponseModel data;

  @override
  _PaymentModeState createState() => _PaymentModeState();
}



class _PaymentModeState extends State<PaymentMode> {
  BookingViewModel bookingController = Get.put(BookingViewModel());
bool isCreditCardFormVisible = false;
bool isOMFormVisible = false;
bool isMTNFormVisible = false;
bool isMOOVFormVisible = false;
bool isWAVEFormVisible = false;

  void _showCreditCardForm() {
    setState(() {
      isCreditCardFormVisible = true;
    });
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return CreditCardForm(widget.data);
      },
    ).whenComplete(() {
      setState(() {
        isCreditCardFormVisible = false;
      });
    });
  }

  void _showOMForm() {
    setState(() {
      isOMFormVisible = true;
    });
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return OMForm();
      },
    ).whenComplete(() {
      setState(() {
        isOMFormVisible = false;
      });
    });
  }

  void _showMTNForm() {
    setState(() {
      isMTNFormVisible = true;
    });
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return OMForm();
      },
    ).whenComplete(() {
      setState(() {
        isMTNFormVisible = false;
      });
    });
  }

  void _showMOOVForm() {
    setState(() {
      isMOOVFormVisible = true;
    });
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return MOOVForm();
      },
    ).whenComplete(() {
      setState(() {
        isMOOVFormVisible = false;
      });
    });
  }

  void _showWAVEForm() {
    setState(() {
      isWAVEFormVisible = true;
    });
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return WAVEForm();
      },
    ).whenComplete(() {
      setState(() {
        isWAVEFormVisible = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.orange.shade900),
          title: const Text("Methode de paiement"),
        ),
        body: SafeArea(
            child: Column(
                // 0170582276  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const SizedBox(height: 20),
              Container(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                margin:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Column(children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            top: 10),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              55,
                                                              119,
                                                              138,
                                                              119),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: Column(children: [
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 10),
                                                              child:
                                                                  const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                child: Text(
                                                                  'Categorie de billet',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            197,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 10),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        0.0),
                                                                child: Text(
                                                                  '${widget.data!.stand_title}',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            197,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ]),
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 10),
                                                              child:
                                                                  const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                child: Text(
                                                                  'Cout du billet',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            197,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 10),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        0.0),
                                                                child: Text(
                                                                  '${widget.data!.e_s_price} FCFA',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            197,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ]),
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 10),
                                                              child:
                                                                  const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                child: Text(
                                                                  'Match',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            197,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 10),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                        0.0),
                                                                child: Text(
                                                                  "${widget.data!.event_title}",
                                                                  style:
                                                                       TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color.fromARGB(248, 17, 16, 16),
                                                                  ),
                                                                )
                                                              ),
                                                            ),
                                                          ]),

                                                    ]),
                                                  ),
                                                ])),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Selectionnez votre methode de paiement",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
            margin: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(248, 17, 16, 16), // Couleur du texte du bouton
                padding: EdgeInsets.all(1.0), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Bord arrondi du bouton
                ),
              ),
                onPressed: () {
                  if (isCreditCardFormVisible) {
                    return; // Évite d'ouvrir le formulaire à plusieurs reprises
                  }
                  _showCreditCardForm();
                },
                child: Row(
                  children: [
                    Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: NetworkImage(
                      'https://static-00.iconduck.com/assets.00/visa-icon-512x329-mpibmtt8.png', // Remplacez par le lien HTTP de votre image
                    ),
                    fit: BoxFit.cover,
                  ),
                    shape: BoxShape.circle,
                  ),
                ),
                    const Text("   CARTE VISA"),
                  ],
                ),
              ),
            ),
            
            Container(
            margin: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(248, 17, 16, 16), // Couleur du texte du bouton
                padding: EdgeInsets.all(1.0), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Bord arrondi du bouton
                ),
              ),
                onPressed: () {
                  if (isOMFormVisible) {
                    return; // Évite d'ouvrir le formulaire à plusieurs reprises
                  }
                  _showOMForm();
                },
                child: Row(
                  children: [
                    Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: NetworkImage(
                      'https://www.annuaireci.com/Content/UserFiles/Ivory%20Coast/Upload/LOGO%20ORANGE.png', // Remplacez par le lien HTTP de votre image
                    ),
                    fit: BoxFit.cover,
                  ),
                    shape: BoxShape.circle,
                  ),
                ),
                    Text("   ORANGE MONEY"),
                  ],
                ),
              ),
            ),
            Container(
            margin: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(248, 17, 16, 16),  // Couleur du texte du bouton
                padding: EdgeInsets.all(1.0), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Bord arrondi du bouton
                ),
              ),
                onPressed: () {
                  if (isMTNFormVisible) {
                    return; // Évite d'ouvrir le formulaire à plusieurs reprises
                  }
                  _showMTNForm();
                },
                child: Row(
                  children: [
                    Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: NetworkImage(
                      'https://matinlibre.com/wp-content/uploads/2020/08/4-3-750x430-1-750x430.jpg', // Remplacez par le lien HTTP de votre image
                    ),
                    fit: BoxFit.cover,
                  ),
                    shape: BoxShape.circle,
                  ),
                ),
                    Text("   MTN MOBILE MONEY"),
                  ],
                ),
              ),
            ),
            Container(
            margin: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(248, 17, 16, 16),  // Couleur du texte du bouton
                padding: EdgeInsets.all(1.0), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Bord arrondi du bouton
                ),
              ),
                onPressed: () {
                  if (isMOOVFormVisible) {
                    return; // Évite d'ouvrir le formulaire à plusieurs reprises
                  }
                  _showMOOVForm();
                },
                child: Row(
                  children: [
                    Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/fr/1/1d/Moov_Africa_logo.png?20210529100313', // Remplacez par le lien HTTP de votre image
                    ),
                    fit: BoxFit.cover,
                  ),
                    shape: BoxShape.circle,
                  ),
                ),
                    Text("   MOOV MONEY"),
                  ],
                ),
              ),
            ),
            Container(
            margin: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(248, 17, 16, 16),  // Couleur du texte du bouton
                padding: EdgeInsets.all(1.0), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Bord arrondi du bouton
                ),
              ),
                onPressed: () {
                  if (isWAVEFormVisible) {
                    return; // Évite d'ouvrir le formulaire à plusieurs reprises
                  }
                  _showWAVEForm();
                },
                child: Row(
                  children: [
                    Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: NetworkImage(
                      'https://paydunya.com/refont/images/icon_pydu/partners/wave.png', // Remplacez par le lien HTTP de votre image
                    ),
                    fit: BoxFit.cover,
                  ),
                    shape: BoxShape.circle,
                  ),
                ),
                    Text("   WAVE"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
              ])));
  }
  
}


