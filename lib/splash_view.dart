//import 'package:tikchap/core/authentication_manager.dart';
//import 'package:tikchap/home_view.dart';
//import 'package:tikchap/login/login_view.dart';
//import 'package:tikchap/onboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikchap/core/authentication_manager.dart';
import 'package:tikchap/onboard.dart';

class SplashView extends StatelessWidget {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return const OnBoard();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  

  Scaffold waitingView() {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
              color: Color(0xFFFF7F00),
            ),
          ),
          const Text('Chargement...'),
        ],
      ),
    )
    );
  }
}
