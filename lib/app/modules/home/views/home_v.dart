
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:shopping/app/modules/home/controllers/homecontroller.dart';



// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<HomeController>(
//         builder: (controller) {
//           return Column(
//             children: [
//               SizedBox(
//                   height: 100,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: controller.filters
//                         .map((e) => CatChip(filter: e))
//                         .toList(),
//                   )),
//                   Expanded(child: ListView.builder(itemCount: controller.categories.length,itemBuilder:(context, index) {return Text(controller.categories[index].pName??'');})),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class CatChip extends StatelessWidget {
//   CatChip({super.key, required this.filter});
//   final String filter;
//   final homeController = Get.find<HomeController>();
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () => homeController.filter(filter),
//         child: Chip(
//           label: Text(filter),
//           backgroundColor:
//               homeController.selFilter == filter ? Colors.orange : Colors.grey,
//         ));
//   }
// }
