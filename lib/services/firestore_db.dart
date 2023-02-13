import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practicefirebase/models/products.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore.collection("products").snapshots().map(
        (event) => event.docs.map((e) => Product.fromSnapshot(e)).toList());
  }

  Future deleteProduct(String id) async {
    final docUser = _firebaseFirestore.collection("products").doc(id);
    return await docUser.delete();
  }
}
