import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/components/bottom_sheet.dart';
import 'package:keswa/components/bottom_sheet_filter.dart';
import 'package:keswa/components/custom_bar.dart';
import 'package:keswa/components/flexible_sheet.dart';
import 'package:keswa/components/sort_and_filter.dart';
import 'package:keswa/presentation/search_screen/search_screen.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/routes_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import 'package:keswa/recourses/values_manager.dart';
import 'package:keswa/uitls/controller.dart';
import '../../components/brand.dart';
import '../../recourses/app_constants.dart';
import '../../recourses/assets_strings.dart';
import '../product/product_item.dart';

class ViewALLScreen extends StatefulWidget {
  const ViewALLScreen({super.key});

  @override
  State<ViewALLScreen> createState() => _ViewALLScreenState();
}

class _ViewALLScreenState extends State<ViewALLScreen> {
  var c = Get.put(Controller());
  var selectedItem = 0;
  List<bool> react = List.filled(AppConstants.brandImgs.length, false);

  List<String> assetName =
      List.filled(AppConstants.brandImgs.length, AssetsApp.heart);
  String name = 'New Arrival';

  void title() {
    setState(() {
      name = c.filter.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueiry = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: AppSize.s10,
            ),
            Obx(
              () => Container(
                margin: EdgeInsets.only(left: 10),
                child: customBar(
                  onTapSearch: () =>
                      Navigator.pushNamed(context, RouteManager.searchRoute),
                  onPressedBack: () => Navigator.pop(context),
                  isShown: true,
                  isShownBack: true,
                  text: c.filter.value,
                ),
              ),
            ),
            // SizedBox(
            //   height: AppSize.s10,
            // ),
            Container(
              height: 30,
              child: SortAndFilter(
                onTapFilter: () {
                  flexibleSheet(context: context, widget: BottomSheetFilter());
                },
                onTapSort: () {
                  flexibleSheet(context: context, widget: BottomCustomSheet());
                },
              ),
            ),
            // SizedBox(
            //   height: AppSize.s8,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                thickness: 1,
                color: ColorManager.lightGray.withOpacity(0.6),
              ),
            ),
            SizedBox(
              height: AppSize.s8,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 20,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstants.all.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItem = index;
                          });
                        },
                        child: Text(
                          AppConstants.all[index],
                          style: selectedItem == index
                              ? getMediumStyle(
                                      color: ColorManager.lightGreen,
                                      fontSize: FontSize.s14)
                                  .apply(decoration: TextDecoration.underline)
                              : getMediumStyle(
                                  color: ColorManager.lightGray,
                                  fontSize: FontSize.s14),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: AppSize.s12,
            ),

            Container(
              height: mediaQueiry.size.height,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: AppConstants.brandImgs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.53,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => brand(
                  onTapProduct: () {
                    c.pushPrducts(
                        AppConstants.brandImgs[index],
                        AppConstants.brandText[index],
                        AppConstants.textDescription[index],
                        AppConstants.textPrice[index],
                        AppConstants.textDiscount[index]);
                    Get.to(() => ProductPage(),
                        transition: Transition.rightToLeft);
                  },
                  onTap: () {
                    setState(() {
                      react[index] = !react[index];
                      if (react[index]) {
                        assetName[index] = AssetsApp.heartBlack;
                      } else
                        assetName[index] = AssetsApp.heart;
                    });
                  },
                  // isLiked: react[index],
                  assetName: assetName[index],
                  imgName: AppConstants.brandImgs[index],
                  textBrand: AppConstants.brandText[index],
                  textDescription: AppConstants.textDescription[index],
                  textDiscount: AppConstants.textDiscount[index],
                  textPrice: '${AppConstants.textPrice[index]}',
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
