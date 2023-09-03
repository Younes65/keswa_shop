import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:keswa/recourses/color_manager.dart';

Future flexibleSheet({required BuildContext context, required Widget widget}) =>
    showFlexibleBottomSheet(
      bottomSheetColor: ColorManager.white,
      minHeight: 0,
      initHeight: 0.8,
      maxHeight: 0.8,
      context: context,
      builder: (context, scrollController, bottomSheetOffset) {
        return widget;
      },
      isExpand: false,
    );
