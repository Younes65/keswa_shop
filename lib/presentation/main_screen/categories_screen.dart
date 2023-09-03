import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/uitls/controller.dart';
import '../../components/categories_items.dart';
import '../../components/custom_bar.dart';
import '../../recourses/app_constants.dart';
import '../../recourses/color_manager.dart';
import '../../recourses/font_manager.dart';
import '../../recourses/style_manager.dart';
import '../search_screen/search_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int selectedItem = 0;
  var c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(color: ColorManager.white, boxShadow: [
              BoxShadow(
                  color: ColorManager.lightGray.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(1, 1.5))
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => customBar(
                    onTapSearch: () => Get.to(SearchScreen()),
                    paddingBack: 75,
                    isShown: true,
                    isShownBack: false,
                    text: c.categoryName.value,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  margin: EdgeInsets.only(left: 10),
                  height: 30,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: AppConstants.kind.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedItem = index;
                                });
                              },
                              child: Text(
                                AppConstants.kind[index],
                                style: selectedItem == index
                                    ? getSemiBoldStyle(
                                            color: ColorManager.lightGreen,
                                            fontSize: FontSize.s20)
                                        .apply(
                                            decoration:
                                                TextDecoration.underline)
                                    : getSemiBoldStyle(
                                        color: ColorManager.lightGray,
                                        fontSize: FontSize.s20),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),

          Expanded(child: CategoryItem(context: context))
          // Container(
          //   // padding: EdgeInsets.only(top: 15),
          //   width: MediaQuery.of(context).size.width,
          //   height: 490,
          //   child: GridView.builder(
          //     physics: BouncingScrollPhysics(),
          //     itemCount: AppConstants.imgSlider.length,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         childAspectRatio: 0.66, crossAxisCount: 2),
          //     itemBuilder: (context, index) {
          //       return category(
          //           onTapItem: () {
          //             setState(() {
          //               c.getCategory(AppConstants.textCategory[index]);
          //               Get.to(() => CategoriesScreen(),
          //                   transition: Transition.topLevel);
          //             });
          //           },
          //           textCategory: AppConstants.textCategory[index],
          //           imgName: AppConstants.imgSlider[index]);
          //     },
          //   ),
          // )
        ],
      )),
    );
  }
}
