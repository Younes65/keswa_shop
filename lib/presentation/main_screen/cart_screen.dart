import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keswa/components/first_button.dart';
import 'package:keswa/components/flexible_sheet.dart';
import 'package:keswa/components/update_item.dart';
import 'package:keswa/presentation/checkout_screen/checkout_screen.dart';
import 'package:keswa/presentation/product/product_item.dart';
import 'package:keswa/recourses/app_constants.dart';
import 'package:keswa/recourses/assets_strings.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import 'package:keswa/recourses/values_manager.dart';
import 'package:keswa/uitls/controller.dart';

import '../../components/divider.dart';
import '../../recourses/strings_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  getTotal() {
    int sum = 0;
    for (int num in AppConstants.list4) {
      sum += num;
    }
    return sum;
  }

  int sum = 0;
  int indexState = 0;
  // int counter = 1;
  List<int> counter = List.filled(AppConstants.list1.length, 1);

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

  var size = '';
  int? item;
  var c = Get.put(Controller());
  bool isUpdated = false;

  @override
  void initState() {
    sum = getTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(sum);
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: ColorManager.background,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Shopping Cart ',
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s17),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: mediaQuery.size.height,
                      margin: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                      child: ListView.builder(
                        itemCount: AppConstants.list1.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            direction: DismissDirection.endToStart,
                            key: ValueKey(AppConstants.list1[index]),
                            onDismissed: (direction) {
                              setState(() {
                                AppConstants.list1.removeAt(index);
                                AppConstants.list2.removeAt(index);
                                AppConstants.list3.removeAt(index);
                                AppConstants.list4.removeAt(index);
                                AppConstants.list5.removeAt(index);
                              });
                            },
                            background: Container(
                              color: ColorManager.red,
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: AppPadding.p20,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: ColorManager.white,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Remove',
                                          style: getMediumStyle(
                                                  color: ColorManager.white)
                                              .apply(
                                                  decoration:
                                                      TextDecoration.underline),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 10),
                              height: 130,
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(AppConstants.list1[index]),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppConstants.list2[index],
                                            style: getSemiBoldStyle(
                                                color: ColorManager.black,
                                                fontSize: FontSize.s15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            AppConstants.list3[index],
                                            style: getRegularStyle(
                                                color: ColorManager.black,
                                                fontSize: FontSize.s15),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              c.pushIndex(index);
                                              print(c.index);

                                              flexibleSheet(
                                                  context: context,
                                                  widget: UpdateItem(
                                                    sendedIndex: index,
                                                  ));
                                            },
                                            child:
                                                // AppConstants.isUpdated
                                                //     ? Text(
                                                //         ' Size : ${c.sizeUpdated}',
                                                //         style: getMediumStyle(
                                                //                 color: ColorManager
                                                //                     .black,
                                                //                 fontSize:
                                                //                     FontSize.s15)
                                                //             .apply(
                                                //                 decoration:
                                                //                     TextDecoration
                                                //                         .underline))
                                                //   :
                                                Text(
                                              ' Size : ${AppConstants.list5[index]}',
                                              style: getMediumStyle(
                                                      color: ColorManager.black,
                                                      fontSize: FontSize.s15)
                                                  .apply(
                                                      decoration: TextDecoration
                                                          .underline),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            '${AppConstants.list4[index]} EGP',
                                            style: getBoldStyle(
                                                    color: ColorManager.black,
                                                    fontSize: FontSize.s15)
                                                .apply(color: ColorManager.red),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: ColorManager.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorManager.darkGray
                                                  .withOpacity(0.5),
                                              blurRadius: 0.2,
                                              spreadRadius: 0.1,
                                              offset: Offset(1, 0.5))
                                        ]),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsApp.heart,
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 80),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: ColorManager.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorManager.darkGray
                                                  .withOpacity(0.5),
                                              blurRadius: 0.2,
                                              spreadRadius: 0.1,
                                              offset: Offset(1, 0.5))
                                        ]),
                                    height: 30,
                                    width: 70,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  counter[index]++;
                                                  sum = sum +
                                                      AppConstants.list4[index];
                                                  print(AppConstants
                                                      .list4[index]);
                                                  print(sum);
                                                });
                                              },
                                              child: Text(
                                                '+',
                                                style: getBoldStyle(
                                                    color: ColorManager.black,
                                                    fontSize: FontSize.s15),
                                              )),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            '${counter[index]}',
                                            style: getBoldStyle(
                                                color: ColorManager.black,
                                                fontSize: FontSize.s14),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () {
                                              setState(() {
                                                sum = sum -
                                                    AppConstants.list4[index];
                                                print(
                                                    AppConstants.list4[index]);
                                                print(sum);
                                                counter[index]--;
                                              });
                                            },
                                            child: Text(
                                              '-',
                                              style: getBoldStyle(
                                                  color: ColorManager.black,
                                                  fontSize: FontSize.s15),
                                            ),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 120,
                width: mediaQuery.size.width,
                decoration:
                    BoxDecoration(color: ColorManager.white, boxShadow: [
                  BoxShadow(
                      color: ColorManager.lightGray.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(1, 1.5))
                ]),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: AppPadding.p12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s17),
                        ),
                        Text(
                          '${sum}',
                          style: getBoldStyle(
                              color: ColorManager.red, fontSize: FontSize.s18),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FirstButton(
                    textButton: 'Proceed to Checkout',
                    context: context,
                    funOnPressed: () {
                      Get.to(CheckoutScreen(), transition: Transition.downToUp);
                    },
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
