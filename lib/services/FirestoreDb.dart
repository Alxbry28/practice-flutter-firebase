import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practicefirebase/models/user.dart';

class FirestoreDb {
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection("persons")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromMap(doc.data())).toList());

  Future updateUser(Map<String, dynamic> userInfo) async {
    final docUser = FirebaseFirestore.instance.collection("persons").doc();

    // docUser.update({
    // "city.name": "Sydeny", // update name value
    // "city.name": FieldValue.delete(), // removing field
    // });

    await docUser.update(userInfo);
  }

  Future deleteUser(String id) async {
    final docUser = FirebaseFirestore.instance.collection("persons").doc(id);

    // docUser.update({
    //   // "city.name": "Sydeny", // update name value
    //   // "city.name": FieldValue.delete(), // removing field
    // });

    await docUser.delete();
  }

  Future<User?> readUser() async {
    final docUser = FirebaseFirestore.instance
        .collection("persons")
        .doc("scmvfXV6SITIIXD91bcx");
    final snapShot = await docUser.get();
    if (snapShot.exists) {
      return User.fromMap(snapShot.data()!);
    }
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection("persons").doc();
    final newId = docUser.id;
    user.id = newId;
    // final user =
    //     User(id: newId, age: 21, name: name, birthday: DateTime(2001, 11, 28));
    // final json = {
    //   "id": newId,
    //   "name": name,
    //   "age": 21,
    //   "birthday": DateTime(2001, 11, 28),r
    // };
    final json = user.toMap();
    await docUser.set(json);
  }
}
