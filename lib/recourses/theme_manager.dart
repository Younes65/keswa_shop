import 'package:flutter/material.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/style_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: ColorManager.background,

    // button theme
    buttonTheme: ButtonThemeData(
        buttonColor: ColorManager.lightGreen, shape: StadiumBorder()),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            textStyle:
                getBoldStyle(fontSize: FontSize.s20, color: ColorManager.black),
            backgroundColor: ColorManager.lightGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0)))),
    textTheme: TextTheme(
      displayMedium:
          getBoldStyle(color: ColorManager.white, fontSize: FontSize.s17),
      displayLarge:
          getBoldStyle2(color: ColorManager.black, fontSize: FontSize.s20),
      titleLarge:
          getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
      titleMedium:
          getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
      titleSmall: getRegularStyle(
          color: ColorManager.disabledGray, fontSize: FontSize.s16),
      bodySmall:
          getRegularStyle(color: ColorManager.black, fontSize: FontSize.s16),
    ),

    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorManager.disabledGray; // Disabled color
          }
          return ColorManager.black; // Enabled color
        },
      ),
      checkColor:
          MaterialStatePropertyAll(ColorManager.white), // Checkmark color
    ),
  );
}
