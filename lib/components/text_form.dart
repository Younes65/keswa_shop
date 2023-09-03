import 'package:flutter/material.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import 'package:keswa/recourses/values_manager.dart';

Widget textForm(
        {String? onChange(String? value)?,
        Color? colorBorder,
        void onTap()?,
        bool readOnly = false,
        @required TextEditingController? controller,
        String? labelText,
        String? validator(String? value)?,
        bool obscure = false,
        IconData? suffixIcon,
        TextInputType? inputType,
        void onIconPressed()?}) =>
    Container(
      height: AppSize.s48,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: ColorManager.lightGray.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(1, 1.5))
      ]),
      child: TextFormField(
        onChanged: onChange,
        onTap: onTap,
        textAlign: TextAlign.left,
        keyboardType: inputType,
        obscureText: obscure,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(suffixIcon),
              color: ColorManager.disabledGray,
              onPressed: onIconPressed,
            ),
            filled: true,
            fillColor: ColorManager.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorBorder!),
                borderRadius: BorderRadius.circular(0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.lightGreen),
                borderRadius: BorderRadius.circular(0)),
            label: Text(
              labelText!,
              textAlign: TextAlign.left,
            ),
            labelStyle: getRegularStyle(
                color: ColorManager.disabledGray, fontSize: FontSize.s16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
            )),
      ),
    );
