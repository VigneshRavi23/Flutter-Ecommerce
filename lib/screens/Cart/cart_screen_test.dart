import 'package:flipzon/controllers/cart_controller.dart';
import 'package:flipzon/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreenTest extends StatefulWidget {
  const CartScreenTest({Key? key}) : super(key: key);
  @override
  CartScreenTestState createState() => CartScreenTestState();
}

class CartScreenTestState extends State<CartScreenTest> {
  final CartController cartController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag)),
          ],
          title: const Text("Cart"),
        ),
        body: Obx(
          () => Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                  child: ListView.builder(
                      itemCount: cartController.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCard(
                            controller: cartController,
                            product:
                                cartController.products.keys.toList()[index],
                            qty: cartController.products.values
                                .toList()[index]
                                .hashCode,
                            index: index);
                      })),
            ],
          ),
        ));
  }
}

class ProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int qty;
  final int index;

  ProductCard(
      {Key? key,
      required this.index,
      required this.controller,
      required this.product,
      required this.qty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(product.imageUrl),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
              child: Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )),
          Expanded(
              child: Text("RS " + product.price.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
          IconButton(
              onPressed: () {
                controller.removeProduct(product);
              },
              icon: const Icon(Icons.remove_circle)),
          Text(qty.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          IconButton(
              onPressed: () {
                controller.addProduct(product);
              },
              icon: const Icon(Icons.add_circle))
        ],
      ),
    );
  }
}
