// import 'package:get/get.dart';
// import 'package:shopping/app/data/item_list.dart';
// import 'package:shopping/app/modules/home/data_model.dart';

// class HomeControlller extends GetxController{
//   List<Data> allCategories=datasFromJson(itemList);
//   List<Data> categories=[];
//   List<String> filters=['All','Premium','Tamilnadu'];
//   String selFilter='All';
//   void filter(String filter){
//     selFilter=filter;
//     if(filter=='All'){categories=allCategories;}
//     else{
//     categories=allCategories.where((element) => element.pCategory==filter).toList();
//     }
//     update();
//   }
//    decrementButton(Data data) {
//     if (data.count! > 0) {
//       data.count = data.count! - 1;
//       // totalamount = totalamount - data.price;
//     }

//     update();
//   }

//   incrementButton(Data data) {
//     data.count = data.count! + 1;

//     // if (dacount > 0) {
//     //   // addValue = data.price;
//     // }
//     // totalamount = totalamount! + addValue;

//     update();
//   }
// }