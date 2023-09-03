import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/components/category_list.dart';
import 'package:keswa/recourses/values_manager.dart';
import 'package:keswa/uitls/controller.dart';
import '../presentation/main_screen/categories_screen.dart';
import '../recourses/app_constants.dart';
import 'categories.dart';

var c = Get.put(Controller());
List<String> items = [
  'New Arival',
  'Shop All',
  'Dresses',
  'Jeans',
  'Knitwear',
  'Shorts',
  'skirts'
];
Widget CategoryItem({
  required BuildContext context,
}) =>
    AppConstants.cate
        ? Container(
            // padding: EdgeInsets.only(top: 15),
            width: MediaQuery.of(context).size.width,
            height: 492,
            child: GridView.builder(
              padding: EdgeInsets.only(top: 10),
              physics: BouncingScrollPhysics(),
              itemCount: AppConstants.imgSlider.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return category(
                    imgHeight: 180,
                    imgWidth: 170,
                    onTapItem: () {
                      AppConstants.cate = false;
                      c.getCategory(AppConstants.textCategory[index]);
                      Get.to(() => CategoriesScreen(),
                          transition: Transition.fadeIn);
                    },
                    textCategory: AppConstants.textCategory[index],
                    imgName: AppConstants.imgSlider[index]);
              },
            ),
          )
        : categoryList(context: context);
