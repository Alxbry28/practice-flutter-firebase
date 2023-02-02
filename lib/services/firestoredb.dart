import "package:cloud_firestore/cloud_firestore.dart";

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
}
