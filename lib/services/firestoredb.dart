import "package:cloud_firestore/cloud_firestore.dart";

class FirestoreDBService {

  //collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");
  
}
