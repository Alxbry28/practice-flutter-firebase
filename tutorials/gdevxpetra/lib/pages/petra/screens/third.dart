import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/pages/petra/home.dart';

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: Center(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {
                  Get.offAll(Home());
                },
                child: Text("Go to Home")),
          ]),
        ),
      ),
    );
  }
}
