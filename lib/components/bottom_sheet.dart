import 'package:flutter/material.dart';
import 'package:keswa/components/first_button.dart';
import '../recourses/color_manager.dart';
import '../recourses/font_manager.dart';
import '../recourses/style_manager.dart';
import '../recourses/values_manager.dart';

class BottomCustomSheet extends StatefulWidget {
  const BottomCustomSheet({Key? key}) : super(key: key);

  @override
  State<BottomCustomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomCustomSheet> {
  bool color = false;
  bool color1 = false;
  bool color2 = false;
  bool color3 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 34,
            alignment: Alignment.bottomCenter,
            child: Row(
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
                      'Sort By',
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
          ),
          SizedBox(
            height: AppSize.s10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppPadding.p25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color = !color;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: color
                                ? ColorManager.lightGreen
                                : ColorManager.lightGray)),
                    child: Center(
                        child: Text(
                      'Most Recent',
                      style: getMediumStyle(
                          color: color
                              ? ColorManager.lightGreen
                              : ColorManager.lightGray),
                    )),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color1 = !color1;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: color1
                                ? ColorManager.lightGreen
                                : ColorManager.lightGray)),
                    child: Center(
                        child: Text(
                      'Most Reviewed',
                      style: getMediumStyle(
                          color: color1
                              ? ColorManager.lightGreen
                              : ColorManager.lightGray),
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppSize.s10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppPadding.p25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color2 = !color2;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: color2
                                ? ColorManager.lightGreen
                                : ColorManager.lightGray)),
                    child: Center(
                        child: Text(
                      'Price: High to Low',
                      style: getMediumStyle(
                          color: color2
                              ? ColorManager.lightGreen
                              : ColorManager.lightGray),
                    )),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color3 = !color3;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: color3
                                ? ColorManager.lightGreen
                                : ColorManager.lightGray)),
                    child: Center(
                        child: Text(
                      'Price: Low to High',
                      style: getMediumStyle(
                          color: color3
                              ? ColorManager.lightGreen
                              : ColorManager.lightGray),
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FirstButton(
              textButton: 'Apply',
              context: context,
              funOnPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
