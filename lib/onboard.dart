import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tikchap/core/authentication_manager.dart';
import 'package:tikchap/auth/auth_view.dart';

import 'bottomNavigationBar.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = Get.find();

    return Obx(() {
      return authManager.isLogged.value ? const Dashboard() : const LoginView();
    });
  }
}
