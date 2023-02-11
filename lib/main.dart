import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/pages/getBuilder.dart';
import 'package:practicefirebase/pages/getxobxpage.dart';
import 'package:practicefirebase/pages/homepage.dart';
import 'package:practicefirebase/pages/secondPage.dart';
import 'package:practicefirebase/pages/snackPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      getPages: [
        GetPage(name: "/", page: () => MyHomePage()),
        GetPage(name: "/snackPage", page: () => SnackPage()),
        GetPage(name: "/secondPage", page: () => SecondPage()),
        GetPage(name: "/getx", page: () => RxPage()),
        GetPage(name: "/getBuilderPage", page: () => GetBuilderPage()),
      ],
      // home: SnackPage(),
    );
  }
}
