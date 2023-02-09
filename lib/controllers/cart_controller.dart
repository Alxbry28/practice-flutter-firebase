import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/models/product.dart';

class CartController extends GetxController {
  RxList<Product> cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice =>
      cartItems.fold<double>(0, (sum, item) => sum + item.price!);


  double testAmount = 0.0;
  addToCart(Product product) {
    cartItems.add(product);
    // testAmount = totalPrice;
    // update();
  }

  removeToCart(Product product) {
    cartItems.remove(product);
    //  testAmount = totalPrice;
    //  update();
  }
}
