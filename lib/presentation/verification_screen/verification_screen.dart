import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:keswa/components/first_button.dart';
import 'package:keswa/components/snackbar.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/routes_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import 'package:pinput/pinput.dart';

import '../../components/custom_bar.dart';
import '../../recourses/app_constants.dart';
import '../../recourses/strings_manager.dart';
import '../../recourses/values_manager.dart';
import '../../uitls/controller.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  var c = Get.put(Controller());
  TextEditingController pinController = TextEditingController();
  int _secondsRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.s20,
              ),
              customBar(
                  paddingForward: AppSize.s75,
                  isShownBack: true,
                  onPressedBack: () {
                    setState(() {
                      Navigator.of(context).pop();
                      AppConstants.colorBorder = ColorManager.white;
                    });
                  },
                  text: StringManager.verification),
              SizedBox(
                height: AppSize.s20,
              ),
              Obx(
                () => Text(
                  '${StringManager.verificationCode}${c.phone}',
                  style: theme.textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              Text(
                StringManager.phoneNumber,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(
                height: AppSize.s12,
              ),
              Center(
                child: Pinput(
                  controller: pinController,
                  length: 4,
                  defaultPinTheme: PinTheme(
                      textStyle:
                          getSemiBoldStyle(color: ColorManager.lightGreen),
                      height: AppSize.s50,
                      width: AppSize.s50,
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(color: ColorManager.lightGreen),
                          boxShadow: [
                            BoxShadow(
                                color: ColorManager.lightGray.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(1, 1.5))
                          ])),
                ),
              ),
              SizedBox(
                height: AppSize.s30,
              ),
              FirstButton(
                  width: AppSize.s250,
                  height: AppSize.s50,
                  textButton: StringManager.verify,
                  context: context,
                  funOnPressed: () {
                    if (pinController.text.isEmpty) {
                      snackbar(
                          title: StringManager.error,
                          message: StringManager.errorMessage4);
                      setState(() {
                        AppConstants.colorBorder = ColorManager.red;
                      });
                    } else {
                      Navigator.pushReplacementNamed(
                          context, RouteManager.signInRoute);
                      Fluttertoast.showToast(
                          msg: StringManager.msg,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: ColorManager.disabledGray,
                          textColor: ColorManager.black,
                          fontSize: FontSize.s14);
                    }
                  }),
              SizedBox(
                height: AppSize.s20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "00:$_secondsRemaining",
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                  SizedBox(
                    width: AppSize.s10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _secondsRemaining = 60;
                      });
                    },
                    child: Text(
                      StringManager.resend,
                      style: theme.textTheme.titleSmall!
                          .apply(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
