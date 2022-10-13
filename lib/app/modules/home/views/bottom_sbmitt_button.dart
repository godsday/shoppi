import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
    required this.homeController,
    required this.width,
    required this.height,
  }) : super(key: key);

  final HomeController homeController;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (context) {
        return homeController.cartList.isNotEmpty
            ? FloatingActionButton.extended(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Order List",
                      middleText: "",
                      actions: [
                        Center(
                          child: SizedBox(
                            width: width - 10,
                            height: height - 290,
                            child: ListView.builder(
                              itemCount: homeController.cartList.length,
                              itemBuilder: (context, index) => ListTile(
                                trailing: Text(
                                    "${homeController.cartList[index].count}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                title: Text(
                                    "${homeController.cartList[index].pName}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              "CONFIRM ORDER",
                            ))
                      ]);
                },
                label: const Text("SUBMIT"))
            : const SizedBox();
      },
    );
  }
}
