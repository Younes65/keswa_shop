import 'package:flutter/material.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import '../recourses/color_manager.dart';
import '../recourses/values_manager.dart';

Widget dropDownMenu(
        {String? text,
        List<String>? list,
        void onChanged(String? value)?,
        required Color color}) =>
    DropdownButtonHideUnderline(
      child: Container(
        padding: EdgeInsets.all(AppSize.s8),
        height: AppSize.s48,
        decoration: BoxDecoration(color: ColorManager.white, boxShadow: [
          BoxShadow(
              color: ColorManager.lightGray.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(1, 1.5))
        ]),
        child: DropdownButton(
            iconEnabledColor: ColorManager.black,
            isExpanded: true,
            value: text!,
            items: list!.map((String items) {
              return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style:
                        getRegularStyle(color: color, fontSize: FontSize.s16),
                  ));
            }).toList(),
            onChanged: onChanged),
      ),
    );
