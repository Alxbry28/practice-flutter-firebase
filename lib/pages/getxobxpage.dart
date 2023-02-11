import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/controllers/countController.dart';

class RxPage extends StatelessWidget {
  const RxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Managment | Getx & Obx"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetBuilder<CountController>(
            init: CountController(),
            builder: (controller) {
              return Text("Count value is ${controller.count}");
            },
          ),
          // Text(Get.arguments.toString()),
          ElevatedButton(
              onPressed: () {
                Get.find<CountController>().incrementCounter();
                // countController.incrementCounter();
              },
              child: Text("Increment the value"))
        ],
      ),
    );
  }
}
