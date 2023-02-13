import 'package:get/get.dart';
import 'package:practicefirebase/controllers/cart_controller.dart';
import 'package:practicefirebase/models/product.dart';

class ShoppingController extends GetxController {
  RxList<Product> products = <Product>[].obs;
 

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var response = [
      Product(
          id: 1,
          price: 30,
          description: "some description of product",
          image: "abd",
          name: "First Product"),
      Product(
          id: 2,
          price: 30,
          description: "some description of product",
          image: "abd",
          name: "Second Product"),
      Product(
          id: 3,
          price: 30,
          description: "some description of product",
          image: "abd",
          name: "Third Product"),
      Product(
          id: 4,
          price: 30,
          description: "some description of product",
          image: "abd",
          name: "Fourth Product"),
    ];

    products.value = response;

  }
}
