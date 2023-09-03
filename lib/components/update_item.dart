import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/presentation/main_screen/cart_screen.dart';
import 'package:keswa/recourses/routes_manager.dart';
import 'package:keswa/uitls/controller.dart';

import '../presentation/main_screen/main_screen.dart';
import '../recourses/app_constants.dart';
import '../recourses/color_manager.dart';
import '../recourses/font_manager.dart';
import '../recourses/strings_manager.dart';
import '../recourses/style_manager.dart';
import '../recourses/values_manager.dart';
import 'divider.dart';
import 'first_button.dart';
import 'flexible_sheet.dart';

class UpdateItem extends StatefulWidget {
  final int? sendedIndex;
  const UpdateItem({Key? key, this.sendedIndex}) : super(key: key);

  @override
  State<UpdateItem> createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  var size = '';
  int? item;
  var c = Get.put(Controller());

  Widget sizeChart() {
    return Container(
      height: 250,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.cancel_outlined)),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Size Chart',
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s16),
                ),
              ),
            ),
            SizedBox(
              width: 40,
            )
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppPadding.p20),
      height: 500,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined)),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Update Item',
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                )
              ],
            ),
            SizedBox(
              height: AppPadding.p12,
            ),
            Container(
              alignment: Alignment.center,
              height: AppSize.s130,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: AppPadding.p8),
                    child: Image.asset(AppConstants.list1[widget.sendedIndex!]),
                  );
                },
              ),
            ),
            SizedBox(
              height: AppSize.s12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppConstants.list2[widget.sendedIndex!],
                  style: getBoldStyle(color: ColorManager.black, fontSize: 16),
                ),
                Text(
                  "${AppConstants.list4[widget.sendedIndex!]} EGP",
                  style: getBoldStyle(color: ColorManager.red, fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s12,
            ),
            Text(
              AppConstants.list3[widget.sendedIndex!],
              style: getRegularStyle(color: ColorManager.black, fontSize: 16),
            ),
            divider(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.selectSize,
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s17),
                    ),
                    GestureDetector(
                      onTap: () {
                        flexibleSheet(context: context, widget: sizeChart());
                      },
                      child: Text(
                        StringManager.sizeChart,
                        style: getRegularStyle(
                                color: ColorManager.disabledGray,
                                fontSize: FontSize.s16)
                            .apply(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  height: AppSize.s42,
                  width: mediaQuery.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: AppConstants.size.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            item = index;
                            size = AppConstants.size[index];
                          });
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: AppSize.s16,
                          width: AppSize.s50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: item == index
                                  ? ColorManager.disabledGray
                                  : ColorManager.white,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        ColorManager.lightGray.withOpacity(0.4),
                                    spreadRadius: 0.5,
                                    blurRadius: 2,
                                    offset: Offset(0.5, 1))
                              ]),
                          child: Center(
                            child: Text(
                              AppConstants.size[index],
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  'Only 1 Item left!',
                  style: theme.textTheme.titleSmall!
                      .apply(color: ColorManager.red.withOpacity(0.6)),
                )),
              ],
            ),
            divider(),
            FirstButton(
              textButton: 'Update',
              context: context,
              funOnPressed: () {
                setState(() {
                  // AppConstants.isUpdated = true;

                  c.pushSize(size: size);
                  print(size);
                  if (c.index >= 0 && c.index < AppConstants.list5.length) {
                    AppConstants.list5[c.index.value] = c.sizeUpdated;
                  }
                  AppConstants.selectedItem = 2;
                  Get.toNamed(RouteManager.mainRoute);
                });
              },
            )
          ]),
    );
  }
}
