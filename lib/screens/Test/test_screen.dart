import 'package:flipzon/controllers/cart_controller.dart';
import 'package:flipzon/models/product.dart';
import 'package:flipzon/screens/Cart/cart_screen_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  @override
  TestScreenState createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const CartScreenTest(),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_bag)),
          ],
          title: const Text("Test Product Screen"),
        ),
        body: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
                child: ListView.builder(
                    itemCount: Product.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(index: index);
                    })),
          ],
        ));
  }
}

class ProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final int index;

  ProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(Product.products[index].imageUrl),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
              child: Text(
            Product.products[index].name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )),
          Expanded(
              child: Text("RS " + Product.products[index].price.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18))),
          IconButton(
              onPressed: () {
                cartController.addProduct(Product.products[index]);
              },
              icon: const Icon(Icons.add_circle))
        ],
      ),
    );
  }
}
