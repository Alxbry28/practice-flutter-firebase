import 'package:get/get.dart';
import 'package:practicefirebase/models/products.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      "Product Added",
      "You added ${product.name}",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  RxMap<dynamic, dynamic> get products => _products;

  get productSubtotal => _products.isEmpty
      ? 0
      : _products.entries
          .map((product) => product.key.price * product.value)
          .toList();

  get total => _products.isEmpty
      ? 0
      : _products.entries
          .map((product) => product.key.price * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
}
