import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/screens/cart.dart';
import 'package:practicefirebase/widgets/catalog_products.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CatalogProducts(),
              ElevatedButton(
                onPressed: () {
                  Get.to(CartScreen());
                },
                child: Text("Go To Cart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
