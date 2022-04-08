import 'package:flipzon/models/product.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CartController extends GetxController {
  final _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    print("You have added the ${product.name} to the Cart");

    Get.snackbar(
        "Product Added", "You have added the ${product.name} to the Cart",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3));
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;
}
