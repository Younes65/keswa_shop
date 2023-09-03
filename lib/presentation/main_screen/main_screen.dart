import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keswa/presentation/main_screen/More_screen.dart';
import 'package:keswa/presentation/main_screen/cart_screen.dart';
import 'package:keswa/presentation/main_screen/categories_screen.dart';
import 'package:keswa/presentation/main_screen/home_screen.dart';
import 'package:keswa/presentation/main_screen/wish_list.dart';
import 'package:keswa/recourses/app_constants.dart';
import 'package:keswa/recourses/assets_strings.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import 'package:keswa/recourses/values_manager.dart';
import 'package:keswa/uitls/controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var c = Get.put(Controller());
  // int selectedItem = 0;
  List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishListScreen(),
    MoreScreen()
  ];
  List<String> namedScreen = [
    AssetsApp.home,
    AssetsApp.categories,
    AssetsApp.cart,
    AssetsApp.wishlist,
    AssetsApp.more
  ];

  Widget getIcon(index) {
    return SvgPicture.asset(
      namedScreen[index],
      color: getSelectedItemColor(index),
    );
  }

  Color getSelectedItemColor(int index) {
    return index == AppConstants.selectedItem
        ? ColorManager.black
        : ColorManager.lightGray;
  }

  @override
  void initState() {
    super.initState();
    c.checkInternet();
    c.changedConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.white,
        selectedItemColor: ColorManager.black,
        unselectedItemColor: ColorManager.lightGray,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: AppConstants.selectedItem,
        onTap: (int index) {
          setState(() {
            AppConstants.selectedItem = index;
            if (AppConstants.selectedItem == 1) {
              AppConstants.cate = true;
              c.categoryName.value = 'Categories';
            }
          });
        },
        items: namedScreen.map((item) {
          var index = namedScreen.indexOf(item);
          return BottomNavigationBarItem(label: '', icon: getIcon(index));
        }).toList(),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (AppConstants.selectedItem != 0) {
            setState(() {
              AppConstants.selectedItem = 0;
            });
            return false;
          }
          SystemNavigator.pop();
          return true;
        },
        child: Obx(
          () => c.result == ConnectivityResult.none ||
                  c.result == ConnectivityResult.vpn
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wifi_off_sharp,
                      color: ColorManager.disabledGray,
                      size: AppSize.s60,
                    ),
                    SizedBox(
                      height: AppSize.s12,
                    ),
                    Text(
                      'Check your connection',
                      style: getMediumStyle(color: ColorManager.disabledGray),
                    )
                  ],
                ))
              : screens[AppConstants.selectedItem],
        ),
      ),
    );
  }
}
