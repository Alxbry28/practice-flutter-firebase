import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/pages/petra/otherpage.dart';
import 'package:practicefirebase/pages/petra/screens/second.dart';
import 'package:practicefirebase/states/counterState.dart';

class FirstHome extends StatelessWidget {
  // const FirstHome({super.key});
  final CounterState counterState = Get.put(CounterState());

  oldGoToNext(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Second()));
    // navigator.push(route);
  }

  goToSecond() {
    // Navigator.push(context, route)

    navigator!.push(MaterialPageRoute(builder: (context) => Second()));
    counterState.onClose();
  }

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
            ElevatedButton(onPressed: goToSecond, child: Text("Go to Second")),
            ElevatedButton(onPressed: _showSnackBar, child: Text("Snackbar")),
            ElevatedButton(onPressed: _showDialog, child: Text("Dialog")),
            ElevatedButton(
                onPressed: _showBottomSheet, child: Text("Bottom Sheet")),
            SizedBox(height: 40),
            // StreamBuilder(
            //   stream: counterState.streamController.stream,
            //   builder: (context, snapshot) {
            //     return Text(snapshot.data.toString());
            //   },
            // ),
            ElevatedButton(
                onPressed: () {
                  // counterState.startStream();
                },
                child: Text("Start Stream")),
            ElevatedButton(
                onPressed: () {
                  counterState.increment();
                  // counterState.startStream();
                },
                child: Text("Counter")),
            Obx(() => Text(
                  "State: ${counterState.counter.value.toString()}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),

            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/second");
                  // counterState.increment();
                  // counterState.startStream();
                },
                child: Text("Name Route: /second")),
          ]),
        ),
      ),
    );
  }
}
