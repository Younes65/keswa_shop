import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import 'package:keswa/recourses/values_manager.dart';

Widget brand(
        {
        // required bool isLiked,
        void onTap()?,
        String? assetName,
        String textPrice = '',
        String textDescription = '',
        String textDiscount = '',
        String? textBrand,
        String? imgName,
        void onTapProduct()?}) =>
    GestureDetector(
      onTap: onTapProduct,
      child: Container(
        width: AppSize.s160,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: 220,
                width: 160,
                child: Image.asset(
                  imgName!,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: AppPadding.p34),
                alignment: Alignment.topLeft,
                width: 35,
                height: 20,
                color: ColorManager.red,
                child: Center(
                  child: Text(
                    '-30%',
                    style: getRegularStyle(color: ColorManager.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: AppPadding.p60),
                alignment: Alignment.topLeft,
                width: 60,
                height: 20,
                color: ColorManager.lightGreen,
                child: Center(
                  child: Text(
                    'Exclusive',
                    style: getRegularStyle(color: ColorManager.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(AppSize.s8),
                alignment: Alignment.topRight,
                child: CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorManager.white,
                    child: GestureDetector(
                        onTap: onTap, child: SvgPicture.asset(assetName!))),
              )
            ]),
            SizedBox(
              height: 6,
            ),
            Center(
              child: Text(
                textBrand!,
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s17),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Center(
                child: Text(
              textDescription,
              style: getRegularStyle(
                  color: ColorManager.lightGray, fontSize: FontSize.s12),
            )),
            const SizedBox(
              height: 6,
            ),
            if (textDiscount != '')
              Center(
                  child: Text(textDiscount,
                      style: getRegularStyle(
                              color: ColorManager.lightGray,
                              fontSize: FontSize.s12)
                          .apply(decoration: TextDecoration.lineThrough))),
            const SizedBox(
              height: 3,
            ),
            Center(
              child: Text(textPrice,
                  style: getSemiBoldStyle(
                      color: ColorManager.red, fontSize: FontSize.s16)),
            ),
            if (textDiscount == '')
              Center(
                  child: Text('',
                      style: getRegularStyle(
                              color: ColorManager.lightGray,
                              fontSize: FontSize.s12)
                          .apply(decoration: TextDecoration.lineThrough))),
          ],
        ),
      ),
    );
