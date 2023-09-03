import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keswa/presentation/main_screen/cart_screen.dart';
import 'package:keswa/presentation/main_screen/main_screen.dart';
import 'package:keswa/recourses/app_constants.dart';
import 'package:keswa/recourses/assets_strings.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import '../recourses/color_manager.dart';

Widget customBar(
        {double? paddingBack,
        double? paddingForward,
        bool isShown = false,
        bool isShownBack = false,
        bool isImage = false,
        String? imageLogo,
        void onPressedBack()?,
        void onTapSearch()?,
        bool isShownCarte = false,
        String? text}) =>
    Container(
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isShownBack)
            Container(
              child: IconButton(
                onPressed: onPressedBack,
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
          SizedBox(
            width: paddingBack,
          ),
          Center(
              child: !isImage
                  ? Container(
                      alignment: Alignment.center,
                      child: Text(
                        text!,
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s20),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Container(
                      alignment: Alignment.center,
                      width: 141,
                      height: 48,
                      child: SvgPicture.asset(
                        imageLogo!,
                        fit: BoxFit.cover,
                      ))),
          SizedBox(
            width: paddingForward,
          ),
          if (isShown)
            GestureDetector(
              onTap: onTapSearch,
              child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(
                    AssetsApp.search,
                    fit: BoxFit.cover,
                  )),
            ),
          if (isShownCarte)
            GestureDetector(
              onTap: () {
                AppConstants.isUpdated = false;
                AppConstants.selectedItem = 2;
                Get.to(MainScreen(), transition: Transition.fade);
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  AssetsApp.cart,
                  color: ColorManager.black,
                  fit: BoxFit.cover,
                ),
              ),
            )
        ],
      ),
    );
