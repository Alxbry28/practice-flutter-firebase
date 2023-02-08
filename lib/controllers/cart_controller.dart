import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/models/product.dart';

class CartController extends GetxController {
  RxList<Product> cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice =>
      cartItems.fold<double>(0, (sum, item) => sum + item.price!);

  addToCart(Product product) {
    cartItems.add(product);
  }

  removeToCart(Product product) {
    cartItems.remove(product);
    
  }
}
