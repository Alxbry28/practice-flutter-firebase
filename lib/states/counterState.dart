import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CounterState extends GetxController {
  RxInt counter = 0.obs;
  StreamController<int> streamController = StreamController<int>();

  void increment() {
    counter.value++;
  }

  void startStream() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("brews");
    Stream<DocumentSnapshot> doc =
        collectionReference.doc("ODbs7WLnOucwEpLhSLejIDx978e2").snapshots();
    doc.listen((event) {
      streamController.sink.add(event.get("counter"));
    });
  }

  @override
  void onClose() {
    streamController.close();
    super.onClose();
  }
}
