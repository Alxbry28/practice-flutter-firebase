import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/controllers/cart_controller.dart';
import 'package:practicefirebase/controllers/product_controller.dart';
import 'package:practicefirebase/models/products.dart';
import 'package:practicefirebase/screens/cart.dart';

class CatalogProducts extends StatelessWidget {
  final productController = Get.put(ProductController());
  CatalogProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            return CatalogProductCard(index: index);
          },
        ),
      ),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final productController = Get.put(ProductController());
  final int index;
  CatalogProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:
                NetworkImage(productController.products[index].imageUrl),
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Text(
            productController.products[index].name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )),
          Expanded(child: Text("\$${productController.products[index].price}")),
          IconButton(
              onPressed: () async {
                await productController
                    .deleteProduct(productController.products[index].uid!);
                // cartController.addProduct(productController.products[index]);
              },
              icon: const Icon(Icons.delete)),
          IconButton(
              onPressed: () {
                cartController.addProduct(productController.products[index]);
              },
              icon: const Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}
