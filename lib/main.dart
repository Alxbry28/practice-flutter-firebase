import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practicefirebase/pages/gdev/getBuilder.dart';
import 'package:practicefirebase/pages/gdev/getxobxpage.dart';
import 'package:practicefirebase/pages/gdev/homepage.dart';
import 'package:practicefirebase/pages/gdev/secondPage.dart';
import 'package:practicefirebase/pages/gdev/snackPage.dart';
import 'package:practicefirebase/pages/petra/home.dart';
import 'package:practicefirebase/pages/petra/screens/fourth.dart';
import 'package:practicefirebase/pages/petra/screens/second.dart';
import 'package:practicefirebase/pages/petra/screens/third.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: Home(),
      // getPages: [
      //   GetPage(name: "/", page: () => MyHomePage()),
      //   GetPage(name: "/snackPage", page: () => SnackPage()),
      //   GetPage(name: "/secondPage", page: () => SecondPage()),
      //   GetPage(name: "/getx", page: () => RxPage()),
      //   GetPage(name: "/getBuilderPage", page: () => GetBuilderPage()),
      // ],
      getPages: [
        GetPage(name: "/", page: () => Home()),
        GetPage(name: "/second", page: () => Second(), transition: Transition.fadeIn),
        GetPage(name: "/third", page: () => Third(), transition: Transition.zoom),
        GetPage(name: "/fourth", page: () => Fourth()),
      ],
      // home: SnackPage(),
    );
  }
}
