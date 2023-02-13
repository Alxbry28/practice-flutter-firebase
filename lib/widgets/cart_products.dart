import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/controllers/cart_controller.dart';
import 'package:practicefirebase/models/products.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            return CartProductCart(
              cartController: controller,
              index: index,
              product: controller.products.keys.toList()[index],
              quantity: controller.products.values.toList()[index],
            );
          },
        ),
      ),
    );
  }
}

class CartProductCart extends StatelessWidget {
  final CartController cartController;
  final Product product;
  final int quantity, index;

  const CartProductCart(
      {super.key,
      required this.cartController,
      required this.product,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(product.imageUrl),
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )),
          Expanded(child: Text("\$${product.price}")),
          IconButton(
              onPressed: () {
                cartController.removeProduct(product);
              },
              icon: const Icon(Icons.remove_circle)),
          Text("${quantity}"),
          IconButton(
              onPressed: () {
                cartController.addProduct(product);
              },
              icon: const Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}
