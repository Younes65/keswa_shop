import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/components/custom_bar.dart';
import 'package:keswa/components/first_button.dart';
import 'package:keswa/components/text_form.dart';
import 'package:keswa/recourses/app_constants.dart';
import 'package:keswa/recourses/routes_manager.dart';
import 'package:keswa/recourses/strings_manager.dart';
import 'package:keswa/recourses/values_manager.dart';
import '../../components/snackbar.dart';
import '../../recourses/color_manager.dart';
import '../../uitls/controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var c = Get.put(Controller());
  TextEditingController verifyNumberController = TextEditingController();

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
                    paddingBack: 15,
                    paddingForward: 35,
                    isShownBack: true,
                    text: StringManager.forgetYourPassword,
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
