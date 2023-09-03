import 'package:flutter/material.dart';
import '../recourses/color_manager.dart';
import '../recourses/values_manager.dart';

Widget divider() {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding:
            const EdgeInsets.only(left: AppPadding.p30, right: AppPadding.p30),
        child: Divider(
          height: 2,
          color: ColorManager.disabledGray,
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}
