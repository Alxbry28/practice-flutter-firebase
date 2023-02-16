import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/controllers/auth_controller.dart';
import 'package:practicefirebase/controllers/bindings/auth_binding.dart';
import 'package:practicefirebase/screens/root.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AuthBinding(),
      home: Root(),
    );
  }
}
