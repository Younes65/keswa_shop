import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:keswa/components/first_button.dart';
import 'package:keswa/recourses/app_constants.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import 'package:keswa/recourses/values_manager.dart';

import '../../components/custom_bar.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: ColorManager.white, boxShadow: [
          BoxShadow(
              color: ColorManager.lightGray.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(1, 1.5))
        ]),
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        height: 100,
        child: FirstButton(
          height: 50,
          width: mediaQuery.width,
          textButton: 'Place Order',
          context: context,
          funOnPressed: () {},
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: ColorManager.white, boxShadow: [
                BoxShadow(
                    color: ColorManager.lightGray.withOpacity(0.4),
                    spreadRadius: 0.0,
                    blurRadius: 0.5,
                    offset: Offset(1, 1.5))
              ]),
              height: 60,
              child: customBar(
                paddingForward: 70,
                onPressedBack: () => Navigator.pop(context),
                isShownCarte: false,
                isShownBack: true,
                text: 'Checkout',
              ),
            ),
            SizedBox(
              height: AppSize.s20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppPadding.p20),
              height: mediaQuery.height,
              width: mediaQuery.width,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  decoration:
                      BoxDecoration(color: ColorManager.white, boxShadow: [
                    BoxShadow(
                        color: ColorManager.lightGray.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0.5, 0.5))
                  ]),
                  height: 200,
                  width: mediaQuery.width,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product',
                              style: getMediumStyle(
                                  color: ColorManager.black, fontSize: 17),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.edit))
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        child: CarouselSlider.builder(
                            itemCount: AppConstants.list1.length,
                            itemBuilder: (context, index, realIndex) {
                              return Image.asset(AppConstants.list1[index]);
                            },
                            options: CarouselOptions(
                                viewportFraction: 0.5, padEnds: true)),
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      )),
    );
  }
}
