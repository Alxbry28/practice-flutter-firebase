import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/pages/petra/screens/second.dart';

class Fourth extends StatelessWidget {
  const Fourth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth Screen"),
      ),
      body: Center(
        child: Container(
          child: (Get.arguments != null)
              ? Text(Get.arguments)
              : Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.back(result: "Hello");
                          // Get.off(Second());
                        },
                        child: Text("Return Text 'Hello'")),
                    ElevatedButton(
                        onPressed: () {
                          Get.back(result: "World");
                          // Get.offAll(Second());
                        },
                        child: Text("Return Text 'World'")),
                  ],
                ),
        ),
      ),
    );
  }
}
