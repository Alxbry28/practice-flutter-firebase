import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/widgets/cart_products.dart';
import 'package:practicefirebase/widgets/cart_total.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CartProducts(),
            CartTotal(),
            ElevatedButton(
              onPressed: () {
                // Get.to(CartScreen());
              },
              child: Text("Go To Catalog"),
            ),
          ],
        ),
      ),
    );
  }
}
