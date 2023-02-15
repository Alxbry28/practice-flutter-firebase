import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/pages/petra/screens/fourth.dart';
import 'package:practicefirebase/pages/petra/screens/third.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  String dataFromFourth = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {
                  Get.off(Third());
                },
                child: Text("Go to Third and remove this screen from stack")),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(Third());
                },
                child: Text("Go to Third and remove everything from stack")),
            const SizedBox(height: 40),
            Text("data from fourth screen: ${dataFromFourth}"),
            ElevatedButton(
                onPressed: () async {
                  dataFromFourth = await Get.to(Fourth()) ?? dataFromFourth;
                  setState(() {});
                },
                child: Text("Return data from fourth screen")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/fourth", arguments: "Passed from second");
                },
                child: Text("Go to Named /fourth with parameter")),
          ]),
        ),
      ),
    );
  }
}
