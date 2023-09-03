import 'package:flutter/material.dart';

Widget FirstButton({
  String? textButton,
  double? height = 45,
  double? width = 230,
  required BuildContext context,
  required void funOnPressed(),
}) =>
    Container(
      alignment: Alignment.center,
      child: ElevatedButton(
          onPressed: funOnPressed,
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(width!, height!)),
          ),
          child: Text(
            textButton!,
            style: Theme.of(context).textTheme.displayMedium,
          )),
    );
