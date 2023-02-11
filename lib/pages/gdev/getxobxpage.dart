import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/controllers/countController.dart';
import 'package:practicefirebase/controllers/valueController.dart';

class RxPage extends StatelessWidget {
  // const RxPage({super.key});
   final valueController = Get.put(ValueController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Managment | Getx & Obx"),
      ),
      body: Center(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // GetBuilder<CountController>(
              //   init: CountController(),
              //   builder: (controller) {
              //     return Text("Count value is ${controller.count}");
              //   },
              // ),
              GetX<ValueController>(
                init: ValueController(),
                builder: (controller) {
                  return Text("value1 is ${controller.valueModel.value.value1}");
                },
              ),
              Obx(() => Text(
                  "value1 is ${Get.find<ValueController>().valueModel.value.value2}")),
        
              // Text(Get.arguments.toString()),
              ElevatedButton(
                  onPressed: () {
                    String value1 = "Firebase Flutter for Beginners";
                    String value2 = "Learning Flutter Getx";
                    Get.find<ValueController>().updateTheValues(value1, value2);
                  },
                  child: Text("Change the value"))
            ],
          ),
        ),
      ),
    );
  }
}
