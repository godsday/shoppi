import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homeController = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: GetBuilder<HomeController>(builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: width,
                    height: 100,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: homeController.filters
                            .map((e) => Catchip(filter: e))
                            .toList())),
              ),
              Expanded(
                flex: 10,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: homeController.categories.length,
                    itemBuilder: (context, index) {
                      final dataAtIndex = homeController.categories[index];

                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            SizedBox(
                                width: width * 0.94,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  color: Colors.white70,
                                  elevation: 10,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: width * 0.28,
                                            maxHeight: width * 0.28,
                                          ),
                                          child: SizedBox(
                                            width: 100,
                                            height: 140,
                                            child: CachedNetworkImage(
                                              imageUrl: "${dataAtIndex.pImage}",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 140,
                                        // height: 30,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dataAtIndex.pName.toString(),
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Stock - ${controller.categories[index].pAvailability.toString()}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(dataAtIndex.pDetails
                                                .toString()),
                                            // Text(dataAtIndex.pCategory
                                            //     .toString()),

                                            const SizedBox(
                                              height: 10,
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  width: 100,
                                                ),
                                                Text(
                                                  "\$ ${homeController.categories[index].pCost.toString()}",
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      GetBuilder<HomeController>(
                                          builder: (context) {
                                        return Column(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  // print("${homeComtroller.data[index].count}");
                                                  homeController
                                                      .incrementButton(
                                                          dataAtIndex);
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Colors.red,
                                                )),
                                            Text(
                                              "${homeController.categories[index].count}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  homeController
                                                      .decrementButton(
                                                          dataAtIndex);
                                                },
                                                icon: const Icon(
                                                  Icons.minimize,
                                                  color: Colors.red,
                                                )),
                                          ],
                                        );
                                      })
                                    ],
                                  ),
                                ))
                          ]));
                    }),
              )
            ],
          );
        }),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: GetBuilder<HomeController>(
        builder: (context) {
          return homeController.cartList.isNotEmpty
              ? FloatingActionButton.extended(
                  onPressed: () {
                    // print("${homeController.cartList.first.toString()}");

                    // Get.defaultDialog(title: "Odered List",actions: [
                    // ListView.builder(itemCount: homeController.cartList.length,
                    // itemBuilder:(context, index) =>ListTile(title: Text("${homeController.cartList[index].}"),) ),

                    // ElevatedButton(onPressed: (){}, child: Text("Confirm Order"))]);
                    Get.defaultDialog(
                      title: "Order List",
                      middleText: "",
                     actions:[  Center(
                        child: SizedBox(
                          width: width-10,
                          height: height-290,
                          
                          child: ListView.builder(
                            itemCount: homeController.cartList.length,
                            itemBuilder: (context, index) => ListTile( trailing: Text(
                                  "${homeController.cartList[index].count}"), 
                              title: Text(
                                  "${homeController.cartList[index].pName}"),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(onPressed: (){}, child: Text("CONFIRM ORDER",style: tEXT,))
                      ]
                    );
                  },
                  label: const Text("SUBMIT"))
              : const SizedBox();
        },
      ),
    );
  }
}

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
              homeController.selFilter == filter ? Colors.amber : Colors.grey,
        ),
      ),
    );
  }
}
