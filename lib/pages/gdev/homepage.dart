import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/pages/gdev/getBuilder.dart';
import 'package:practicefirebase/pages/gdev/secondPage.dart';
import 'package:practicefirebase/pages/gdev/snackPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "GetX Demo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(6),
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const SnackPage()));

              Get.to(SnackPage());
            },
            child: Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(6),
              color: Colors.blue,
              child: const Center(
                child: Text(
                  "SnackBar, Dialog, and Bottom Sheet",
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
                //  Get.to(SecondPage(),arguments: "Hello from the home page");
                 Get.toNamed("/secondPage",arguments: "Hello from the home page");
            },
            child: Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(6),
              color: Colors.red,
              child: Center(
                child: Text(
                  "Navigation | Send data to other screen",
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(GetBuilderPage());
            },
            child: Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(6),
              color: Colors.amber[600],
              child: const Center(
                child: Text(
                  "State Management | GetBuilder",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed("/getx");
            },
            child: Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(6),
              color: Colors.green,
              child: const Center(
                child: Text(
                  "State Managment | Getx & Obx",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
