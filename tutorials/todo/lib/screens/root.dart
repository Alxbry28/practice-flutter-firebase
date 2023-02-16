import 'package:get/get.dart';
import 'package:practicefirebase/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:practicefirebase/controllers/user_controller.dart';
import 'package:practicefirebase/screens/auth/login.dart';
import 'package:practicefirebase/screens/home/home.dart';

class Root extends GetWidget<AuthController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user!.uid.isEmpty) {
          return Home();
        } else {
          return Login();
        }
      },
    );
  }
}
