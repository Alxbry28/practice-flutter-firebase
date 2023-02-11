import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackPage extends StatelessWidget {
  const SnackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson 1"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.snackbar("Show SnackBar",
                        "Showing Snackbar by clicking this button",
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                        backgroundColor: Colors.grey[800]);
                  },
                  child: const Text("Show Snackbar")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Default Dialog",
                        content: Container(
                          child: Column(
                            children: [
                              Text("Testing 1"),
                              Text("Testing 2"),
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Close Dialog")),
                          ElevatedButton(onPressed: () {}, child: Text("No")),
                        ]);
                  },
                  child: const Text("Show Dialog")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        height: 150,
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(title: Text("Getx Bottom Sheet")),
                            ListTile(title: Text("Getx Bottom Sheet")),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Text("Show Bottom Sheet")),
            ),
          ],
        ),
      ),
    );
  }
}
