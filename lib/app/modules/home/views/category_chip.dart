import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class Catchip extends StatelessWidget {
  Catchip({super.key, required this.filter});
  final homeController = Get.find<HomeController>();
  final String filter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => homeController.filter(filter: filter),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Chip(
          label: Text(filter),
          backgroundColor:
              homeController.selFilter == filter ? Colors.amber : Colors.grey.shade300,
        ),
      ),
    );
  }
}
