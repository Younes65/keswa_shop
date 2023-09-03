import 'package:flutter/material.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/strings_manager.dart';

import '../presentation/main_screen/More_screen.dart';
import '../presentation/main_screen/cart_screen.dart';
import '../presentation/main_screen/categories_screen.dart';
import '../presentation/main_screen/home_screen.dart';
import '../presentation/main_screen/wish_list.dart';
import 'assets_strings.dart';

class AppConstants {
  static const int timer = 3;
  static bool visible = false;
  static IconData? visibilityOff = Icons.visibility_off;
  static Color colorBorder = ColorManager.white;
  static String selectedCountry = StringManager.cairo;
  static List<String> countryList = [
    'cairo',
    'october',
  ];
  static String selectedGender = StringManager.female;
  static List<String> genderList = [
    'Male',
    'Female',
  ];
  static List<String> brandImgs = [
    AssetsApp.shein,
    AssetsApp.pullBear,
    AssetsApp.lacoste,
  ];
  static List<String> items = [
    StringManager.blackLeather,
    StringManager.clothing,
    StringManager.country,
    StringManager.email,
    StringManager.enterPhoneToVerify,
    StringManager.facebook,
    StringManager.female
  ];
  static List<String> textDescription = [
    StringManager.blackLeather,
    StringManager.knittedJacket,
    StringManager.printed,
    StringManager.knittedJacket,
  ];
  static List<int> textPrice = [550, 550, 500, 550];
  static List<String> brandText = [
    StringManager.shein,
    StringManager.pull,
    StringManager.lacoste,
    StringManager.lacoste,
  ];
  static List<String> textDiscount = [
    'Price: 1000 EGP',
    '',
    '',
    'Price: 1000 EGP'
  ];

  static List<String> imgBrands = [
    AssetsApp.carter,
    AssetsApp.timberland,
    AssetsApp.koton,
    AssetsApp.oshkosh,
    AssetsApp.carter,
    AssetsApp.timberland,
    AssetsApp.carter,
    AssetsApp.koton,
    AssetsApp.oshkosh,
  ];
  static List<String> all = [
    'All',
    'Clothing',
    'Accessories',
    'Shoes',
    'Bags',
    'Home & Lifestyle'
  ];

  static List<String> brandss = [
    'SHEIN',
    'Clothing',
    'Accessories',
    'Pull and pear',
    'Bags',
    'Mavi',
    'Puma',
    'Lacoste',
    'Mango',
    'Reebok',
    'Gusto',
    'Hummel',
    'us polo',
    'Jack & Jones',
    'Massimo Dutti',
    'Trendyol Modest',
    'Tommy Hilfiger',
    'Tommy Hilfiger',
    'Tommy Hilfiger',
    'Mango',
    'Reebok',
  ];
  static List<String> colors = [
    'Green',
    'Blue',
    'Yellow',
    'Purple',
  ];
  static List<String> size = [
    'XS',
    'S',
    'M',
    'L',
    'XL',
    '2XL',
  ];
  static List<String> kind = [
    'Women',
    'Men',
    'Kids',
  ];
  static List<String> imgSlider = [
    AssetsApp.clothing,
    AssetsApp.sportsSwear,
    AssetsApp.scarves,
    AssetsApp.footWear,
    AssetsApp.footWear,
  ];
  static List<String> textCategory = [
    StringManager.clothing,
    StringManager.sport,
    StringManager.foot,
    StringManager.scarves,
    StringManager.clothing,
  ];
  static var list = AppConstants.brandss;
  static String newArrival = StringManager.newArrival;

  // static List<Widget> screens = [
  //   HomeScreen(),
  //   CategoriesScreen(),
  //   CartScreen(),
  //   WishListScreen(),
  //   MoreScreen()
  // ];
  static bool cate = true;
  static int selectedItem = 0;

  static List list1 = [];
  static List list2 = [];
  static List list3 = [];
  static List<int> list4 = [];
  static List list5 = [];
  static List list6 = [];

  static bool isUpdated = false;
}
