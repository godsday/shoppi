import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/home_controller.dart';
import 'bottom_sbmitt_button.dart';
import 'category_chip.dart';

class HomeView extends GetView<HomeController> {
  final homeController = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoppi'),
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
                                              placeholder: (context, url) =>
                                                  SizedBox(
                                                width: 100.0,
                                                height: 140.0,
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.grey,
                                                  highlightColor: Colors.white,
                                                  child: Container(
                                                    color: Colors.amber,
                                                    width: 100,
                                                    height: 140,
                                                  ),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 140,
                                      
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
      floatingActionButton: FloatingButton(homeController: homeController, width: width, height: height),
    );
  }
}
