import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/presentation/main_screen/home_screen.dart';
import 'package:keswa/presentation/view_all/view_all.dart';
import 'package:keswa/presentation/view_all/view_all_brands.dart';
import 'package:keswa/recourses/app_constants.dart';
import 'package:keswa/uitls/controller.dart';
import '../recourses/color_manager.dart';
import '../recourses/font_manager.dart';
import '../recourses/style_manager.dart';
import '../recourses/values_manager.dart';
import 'first_button.dart';

class BottomSheetFilter extends StatefulWidget {
  const BottomSheetFilter({super.key});

  @override
  State<BottomSheetFilter> createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {
  int isSelected = 0;
  int checked = 0;
  List<bool> isChecked = List.filled(AppConstants.list.length, false);
  List<String> filter = [
    'Brands',
    'Colors',
    'Size',
    'Price',
    'New Arrival',
    'Offers',
    'Style'
  ];
  var c = Get.put(Controller());
  RangeValues _currentRangeValues = const RangeValues(100, 2000);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorManager.white,
        width: double.infinity,
        height: 500,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.s10,
              ),
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
                          'Filter By',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s16),
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
                height: 30,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filter.length,
                    itemBuilder: (contexxt, index) {
                      return Container(
                        padding: EdgeInsets.only(right: AppPadding.p12),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = index;
                              if (isSelected == 0)
                                AppConstants.list = AppConstants.brandss;

                              if (isSelected == 1)
                                AppConstants.list = AppConstants.colors;
                              if (isSelected == 2)
                                AppConstants.list = AppConstants.size;
                            });
                          },
                          child: Text(
                            filter[index],
                            style: isSelected == index
                                ? getMediumStyle(color: ColorManager.lightGreen)
                                    .apply(decoration: TextDecoration.underline)
                                : getMediumStyle(
                                    color: ColorManager.lightGray,
                                  ),
                          ),
                        ),
                      );
                    }),
              ),
              if (isSelected == 0 || isSelected == 2)
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: AppConstants.list.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 6),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 16,
                          child: Row(
                            children: [
                              Checkbox(
                                value: isChecked[index],
                                onChanged: (value) {
                                  setState(() {
                                    checked = index;
                                    print('$checked');
                                    isChecked[index] = value ?? false;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                AppConstants.list[index],
                                style: getMediumStyle(
                                    color: ColorManager.black, fontSize: 15),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
              if (isSelected == 1)
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: AppConstants.list.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: isChecked[index],
                                    onChanged: (value) {
                                      setState(() {
                                        checked = index;
                                        print('$checked');
                                        isChecked[index] = value ?? false;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    AppConstants.list[index],
                                    style: getMediumStyle(
                                        color: ColorManager.black,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: ColorManager.black,
                              ),
                            ],
                          ),
                        );
                      },
                    )),
              if (isSelected == 3)
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: ColorManager.lightGray)),
                            child: Center(
                              child: Text(
                                'Form : ${_currentRangeValues.start.round().toString()} EGP',
                                style: getMediumStyle(
                                    color: ColorManager.lightGray,
                                    fontSize: FontSize.s16),
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: ColorManager.lightGray)),
                            child: Center(
                              child: Text(
                                'To : ${_currentRangeValues.end.round().toString()} EGP',
                                style: getMediumStyle(
                                    color: ColorManager.lightGray,
                                    fontSize: FontSize.s16),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RangeSlider(
                      activeColor: ColorManager.black,
                      inactiveColor: ColorManager.black,
                      values: _currentRangeValues,
                      max: 2000,
                      divisions: 8,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              FirstButton(
                  textButton: 'Apply',
                  context: context,
                  funOnPressed: () {
                    if (isChecked[checked] == true) {
                      // AppConstants.list = AppConstants.brandss;
                      setState(() {
                        c.pushFliter(AppConstants.list[checked]);
                        print(c.filter);
                      });
                    }
                    Navigator.pop(context);
                    AppConstants.list = AppConstants.brandss;
                  })
            ]));
  }
}
