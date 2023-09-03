import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keswa/recourses/assets_strings.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/style_manager.dart';

Widget SortAndFilter({void onTapSort()?, void onTapFilter()?}) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetsApp.sort),
        SizedBox(width: 2),
        GestureDetector(
          onTap: onTapSort,
          child: Text(
            'Sort',
            style: getSemiBoldStyle(
                color: ColorManager.disabledGray, fontSize: FontSize.s16),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        VerticalDivider(
          color: ColorManager.lightGray,
          thickness: 1,
          endIndent: 5,
          indent: 5,
        ),
        SizedBox(
          width: 50,
        ),
        SvgPicture.asset(AssetsApp.filter),
        SizedBox(width: 2),
        GestureDetector(
          onTap: onTapFilter,
          child: Text(
            'Filter',
            style: getSemiBoldStyle(
                color: ColorManager.disabledGray, fontSize: FontSize.s16),
          ),
        ),
      ],
    );
