import 'package:flutter/material.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/values_manager.dart';

Widget SecondButton({
  Color? colorText,
  String? text,
  String? asset,
  Color? color,
  double? height,
  double? width,
  required BuildContext context,
  required void funOnPressed(),
}) =>
    Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorManager.lightGray.withOpacity(0.4),
          spreadRadius: 1,
          blurRadius: 2,
        )
      ]),
      alignment: Alignment.center,
      child: ElevatedButton(
          onPressed: funOnPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color!),
            minimumSize: MaterialStateProperty.all(Size(width!, height!)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 32, width: 32, child: Image.asset(asset!)),
              SizedBox(
                width: AppSize.s30,
              ),
              Text(
                text!,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(color: colorText),
              )
            ],
          )),
    );
