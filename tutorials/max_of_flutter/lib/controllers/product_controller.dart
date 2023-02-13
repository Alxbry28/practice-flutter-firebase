import 'package:get/get.dart';
import 'package:practicefirebase/models/products.dart';
import 'package:practicefirebase/services/firestore_db.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }

  Future deleteProduct(String id) async{
    await FirestoreDB().deleteProduct(id);
  }  

}
