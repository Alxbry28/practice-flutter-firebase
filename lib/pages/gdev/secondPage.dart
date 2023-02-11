import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/pages/gdev/homepage.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation | Send Data"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(Get.arguments.toString()),
          ElevatedButton(
              onPressed: () {
                // Get.offAll(MyHomePage());
                Get.offAllNamed("/");
              },
              child: Text("Go to Home Page"))
        ],
      ),
    );
  }
}
