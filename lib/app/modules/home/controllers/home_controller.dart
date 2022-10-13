import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/app/data/item_list.dart';

import '../data_model.dart';

class HomeController extends GetxController {
  List<Data> allCategories = datasFromJson(itemList);
  List<Data> categories = [];
  List<String> filters = ['All', "Premium", 'Tamilnadu'];
  String selFilter = "All";
  @override
  void onInit() {
    filter();
    super.onInit();
  }

  void filter({String filter = "All"}) {
    selFilter = filter;
    if (filter == 'All') {
      categories = allCategories;
      update();
    } else {
      categories = allCategories
          .where((element) => element.pCategory == filter)
          .toList();
    }
    update();
  }

  Color color = Colors.white;

  dynamic totalamount = 0;
  dynamic addValue = 0;
  decrementButton(Data data) {
    if (data.count! > 0 && data.count! <= 1 && cartList.contains(data)) {
      cartList.remove(data);
      data.count = data.count! - 1;
    } else if (data.count! > 1) {
      data.count = data.count! - 1;
    }

    update();
  }

  List<Data> cartList = [];
  incrementButton(Data data) {
    if (cartList.contains(data)) {
      data.count = data.count! + 1;
    } else {
      data.count = data.count! + 1;
      cartList.add(data);
    }

    update();
  }
}
