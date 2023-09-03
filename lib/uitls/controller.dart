import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/presentation/view_all/view_all.dart';
import 'package:keswa/recourses/strings_manager.dart';

import '../presentation/main_screen/categories_screen.dart';

class Controller extends GetxController {
  // sending phone number
  var phone = ''.obs;

  void pushPhone(String phoneNumber) {
    phone = phoneNumber.obs;
  }

// check connectivity
  var result = ConnectivityResult.none.obs;

// check internet state
  Future<ConnectivityResult> checkInternet() async {
    var connectivity = await Connectivity().checkConnectivity();
    print('Connectivity status: $connectivity');
    result.value = connectivity;
    return connectivity;
  }

// listen if change happen
  void changedConnection() async {
    await Connectivity().onConnectivityChanged.listen((event) {
      print('Connectivity changed: $event');
      result.value = event;
    });
  }

  var filter = StringManager.newArrival.obs;

  void pushFliter(String categ) {
    filter = categ.obs;
  }

  // function to get widget
  var index = 0.obs;

  pushIndex(int screen) {
    index = screen.obs;
  }

  // function to send subCategory Name

  var categoryName = 'Categories'.obs;
  getCategory(String cate) {
    categoryName = cate.obs;
  }

  // fun to send data items to product
  var imageName = ''.obs;
  var brandName = ''.obs;
  var productName = ''.obs;
  var productPrice;
  var discount = ''.obs;
  pushPrducts(String image, String brand, String product, int price,
      String discountText) {
    imageName = image.obs;
    brandName = brand.obs;
    productName = product.obs;
    productPrice = price.obs;
    discount = discountText.obs;
  }

  // fun to push to cart
  var sizeItem = ''.obs;

  pushCart({String? size}) {
    sizeItem = size!.obs;
  }

  var sizeUpdated = ''.obs;

  pushSize({String? size}) {
    sizeUpdated = size!.obs;
  }
}
