import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/pages/petra/otherpage.dart';
import 'package:practicefirebase/states/counterState.dart';

class Home extends StatelessWidget {
  // const Home({super.key});
  final CounterState counterState = Get.put(CounterState());

  goToNext() {
    // Navigator.push(context, route)
    Get.to(OtherPage());
  }

  _showSnackBar() {
    Get.snackbar("Hey There", "Snackbar is Easy");
  }

  _showDialog() {
    Get.defaultDialog(title: "Simple Dialog", content: Text("Too Easy"));
  }

  _showBottomSheet() {
    Get.bottomSheet(
        Container(
          child: Wrap(
            children: [
              ListTile(
                title: Text("Music"),
                leading: Icon(Icons.music_note),
              ),
              ListTile(
                title: Text("Video"),
                leading: Icon(Icons.videocam),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
        backgroundColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Package"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          counterState.increment();
        },
      ),
      body: Center(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(onPressed: goToNext, child: Text("Go to Other")),
            ElevatedButton(onPressed: _showSnackBar, child: Text("Snackbar")),
            ElevatedButton(onPressed: _showDialog, child: Text("Dialog")),
            ElevatedButton(
                onPressed: _showBottomSheet, child: Text("Bottom Sheet")),
            SizedBox(height: 40),
            StreamBuilder(
              stream: counterState.streamController.stream,
              builder: (context, snapshot) {
                return Text(snapshot.data.toString());
              },
            ),
            ElevatedButton(
                onPressed: () {
                  counterState.startStream();
                },
                child: Text("Start Stream")),
            Obx(() => Text(
                  "State: ${counterState.counter.value.toString()}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
          ]),
        ),
      ),
    );
  }
}
