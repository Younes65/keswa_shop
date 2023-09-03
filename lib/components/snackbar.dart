import 'package:get/get.dart';
import '../recourses/color_manager.dart';

snackbar({String? title, String? message}) {
  Get.snackbar(title!, message!,
      colorText: ColorManager.red, snackPosition: SnackPosition.BOTTOM);
}

snackbar1({String? title, String? message}) {
  Get.snackbar(title!, message!,
      colorText: ColorManager.lightGreen, snackPosition: SnackPosition.TOP);
}
