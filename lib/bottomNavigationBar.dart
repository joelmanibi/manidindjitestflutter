import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'booking/booking_home.dart';
import 'home/home.dart';

void checkConnectivity() async {
  // Check user internet connectivity and login
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
    }
  } on SocketException catch (_) {
    print('not connected');
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  RxInt _index = 0.obs;

  @override
  Widget build(BuildContext context) {
    // CUser _cUser = Get.put(CUser());
    List fragments = [
      Home(),
      MyBooking(),
      Home(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => fragments[_index.value],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _index.value,
          onTap: (value) => _index.value = value,
          selectedItemColor: const Color(0xFFFF7F00),
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(
            color: Color(0xFFFF7F00),
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          // elevation: 30,
          selectedLabelStyle:
              const TextStyle(fontSize: 1, color: Color(0xFFFF7F00)),
          unselectedLabelStyle: const TextStyle(
            fontSize: 1,
            color: Colors.grey,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/home.svg",
                    height: 25,
                    width: 25,
                    color: _index == 0 ? const Color(0xFFFF7F00) : Colors.grey,
                  ),
                  Text(
                    "Accueil",
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          _index == 0 ? const Color(0xFFFF7F00) : Colors.grey,
                      fontWeight:
                          _index == 0 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/ticket.svg",
                    height: 25,
                    width: 25,
                    color: _index == 1 ? const Color(0xFFFF7F00) : Colors.grey,
                  ),
                  Text(
                    "Reservation",
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          _index == 1 ? const Color(0xFFFF7F00) : Colors.grey,
                      fontWeight:
                          _index == 1 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SizedBox(height: 1),
                  SvgPicture.asset(
                    "assets/icons/user.svg",
                    height: 20,
                    width: 25,
                    color: _index == 2 ? const Color(0xFFFF7F00) : Colors.grey,
                  ),
                  SizedBox(height: 3),
                  Text(
                    "Mon compte",
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          _index == 2 ? const Color(0xFFFF7F00) : Colors.grey,
                      fontWeight:
                          _index == 2 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
