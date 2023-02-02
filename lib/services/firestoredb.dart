import "package:cloud_firestore/cloud_firestore.dart";
import 'package:practicefirebase/models/brew.dart';

class FirestoreDBService {
  String? uid;

  FirestoreDBService({this.uid});

  //collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  Future updateUserData(String sugars, String name, int strength) async {
    Map<String, dynamic> userData = {
      "sugars": sugars,
      "name": name,
      "strength": strength,
    };
    return await brewCollection.doc(uid).set(userData);
  }

  //brew list from snapshot
  List<Brew> _brewListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map(
          (doc) => Brew(
            name: doc.get("name") ?? "",
            strength: doc.get("strength") ?? "0",
            sugars: doc.get("sugars") ?? 0,
          ),
        )
        .toList();
  }

 Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapShot);
  } 

  //get brews stream
  // Stream<QuerySnapshot> get brews {
  //   return brewCollection.snapshots();
  // }
}
