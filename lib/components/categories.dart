import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import 'package:keswa/recourses/values_manager.dart';

Widget category(
        {String? textCategory,
        String? imgName,
        void onTapItem()?,
        double? imgHeight,
        double? imgWidth}) =>
    GestureDetector(
      onTap: onTapItem,
      child: Container(
        width: 130,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: imgHeight,
              width: imgWidth,
              child: Image.asset(
                imgName!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                textCategory!,
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s16),
              ),
            ),
          ],
        ),
      ),
    );
