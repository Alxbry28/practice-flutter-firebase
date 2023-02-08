import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/controllers/cart_controller.dart';
import 'package:practicefirebase/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.products[index].name}',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                      '${controller.products[index].description}'),
                                ],
                              ),
                              Text('\$${controller.products[index].price}',
                                  style: const TextStyle(fontSize: 24)),
                            ],
                          ),
                          Obx(
                            () => Text(
                                "Qty: ${cartController.cartItems.where((p0) => p0.id == controller.products[index].id).length}"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    textStyle:
                                        const TextStyle(color: Colors.white)),
                                child: const Text('Add to Cart'),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .removeToCart(controller.products[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    textStyle:
                                        const TextStyle(color: Colors.white)),
                                child: const Text('Remove'),
                              ),
                            ],
                          ),
                          Obx(() => IconButton(
                                icon: controller
                                        .products[index].isFavorite.value
                                    ? const Icon(Icons.check_box_rounded)
                                    : const Icon(
                                        Icons.check_box_outline_blank_outlined),
                                onPressed: () {
                                  controller.products[index].isFavorite
                                      .toggle();
                                },
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          GetX<CartController>(builder: (cartController) {
            return Text(
              "Total amount: \$ ${cartController.totalPrice}",
              style: TextStyle(color: Colors.white, fontSize: 24),
            );
          }),
          SizedBox(height: 100),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
      ),
    );
  }
}
