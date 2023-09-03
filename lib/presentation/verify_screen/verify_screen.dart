import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/uitls/controller.dart';

import '../../components/custom_bar.dart';
import '../../components/first_button.dart';
import '../../components/snackbar.dart';
import '../../components/text_form.dart';
import '../../recourses/app_constants.dart';
import '../../recourses/color_manager.dart';
import '../../recourses/routes_manager.dart';
import '../../recourses/strings_manager.dart';
import '../../recourses/values_manager.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController verifyNumberController = TextEditingController();
  var c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: WillPopScope(
        onWillPop: () async {
          setState(() {
            AppConstants.colorBorder = ColorManager.white;
          });
          Navigator.of(context).pop();
          return true;
        },
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s30,
                ),
                customBar(
                    paddingBack: 10,
                    isShownBack: true,
                    text: StringManager.verifyYourPhone,
                    onPressedBack: () {
                      setState(() {
                        Navigator.of(context).pop();
                        AppConstants.colorBorder = ColorManager.white;
                      });
                    }),
                SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  StringManager.enterPhoneToVerify,
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: AppPadding.p20,
                ),
                Text(
                  StringManager.phoneNumber,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(
                  height: AppSize.s12,
                ),
                textForm(
                  inputType: TextInputType.phone,
                  colorBorder: AppConstants.colorBorder,
                  controller: verifyNumberController,
                  labelText: StringManager.codeEgypt,
                ),
                SizedBox(
                  height: AppSize.s30,
                ),
                FirstButton(
                    textButton: StringManager.send,
                    height: AppSize.s50,
                    width: AppSize.s250,
                    context: context,
                    funOnPressed: () {
                      if (verifyNumberController.text.isEmpty) {
                        snackbar(
                            title: StringManager.error,
                            message: StringManager.errorMessage3);
                        setState(() {
                          AppConstants.colorBorder = ColorManager.red;
                        });
                      } else if (verifyNumberController.text.length < 11 ||
                          verifyNumberController.text.length > 11) {
                        snackbar(
                            title: StringManager.error,
                            message: StringManager.phoneMessageError);
                      } else {
                        Navigator.pushNamed(
                            context, RouteManager.verificationRoute);
                        c.pushPhone(verifyNumberController.text);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
