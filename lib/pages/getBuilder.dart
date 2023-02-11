import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/controllers/countController.dart';

class GetBuilderPage extends StatelessWidget {
  // const GetBuilderPage({super.key});

  // CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management | GetBuilder"),
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
          ElevatedButton(onPressed: () {
            Get.find<CountController>().incrementCounter();
            // countController.incrementCounter();
          }, child: Text("Increment the value"))
        ],
      ),
    );
  }
}
