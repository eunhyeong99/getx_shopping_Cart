import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_cart/controller/cart_controller.dart';

import '../controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final ShoppingController controller = Get.put(ShoppingController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(12.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
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
                                    '${controller.products[index].productName}',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                    ),
                                  ),
                                  Text(
                                    '${controller.products[index].productDescription}',
                                  ),
                                ],
                              ),
                              Text(
                                '\$${controller.products[index].price}',
                                style: TextStyle(
                                  fontSize: 24.0,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cartController.addToItem(controller.products[index]);
                            },
                            child: Text('Add to cart'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          const SizedBox(height: 30),
          GetX<CartController>(
            builder: (controller) {
              return Text(
                'Total amount : \$ ${controller.totalPrice}',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              );
            }
          ),
          const SizedBox(height: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              cartController.count.toString(),
              style: TextStyle(fontSize: 20),
            );
          }
        ),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
