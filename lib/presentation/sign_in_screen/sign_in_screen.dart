import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/components/first_button.dart';
import 'package:keswa/components/second_button.dart';
import 'package:keswa/components/snackbar.dart';
import 'package:keswa/components/text_form.dart';
import 'package:keswa/presentation/main_screen/main_screen.dart';
import 'package:keswa/recourses/app_constants.dart';
import 'package:keswa/recourses/assets_strings.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/routes_manager.dart';
import 'package:keswa/recourses/strings_manager.dart';
import 'package:keswa/recourses/values_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s50,
                ),
                Center(
                  child: Text(
                    StringManager.welcomeKeswa,
                    style: theme.textTheme.displayLarge,
                  ),
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                Center(
                  child: Text(
                    StringManager.signInToEnjoy,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  StringManager.emailOrPhone,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(
                  height: AppSize.s12,
                ),
                textForm(
                    colorBorder: AppConstants.colorBorder,
                    controller: emailController,
                    labelText: StringManager.exampledEmail),
                SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  StringManager.password,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(
                  height: AppSize.s12,
                ),
                textForm(
                    colorBorder: AppConstants.colorBorder,
                    obscure: !AppConstants.visible,
                    controller: _passwordController,
                    labelText: StringManager.passwordHint,
                    suffixIcon: AppConstants.visibilityOff,
                    onIconPressed: () {
                      setState(() {
                        AppConstants.visible = !AppConstants.visible;
                        if (AppConstants.visible) {
                          AppConstants.visibilityOff = Icons.visibility;
                        } else
                          AppConstants.visibilityOff = Icons.visibility_off;
                      });
                    }),
                SizedBox(
                  height: AppPadding.p12,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      AppConstants.colorBorder = ColorManager.white;
                      Navigator.pushNamed(
                          context, RouteManager.forgotPasswordRoute);
                    },
                    child: Text(
                      StringManager.forgetPassword,
                      style: theme.textTheme.titleSmall
                          ?.apply(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                FirstButton(
                    textButton: StringManager.signInButton,
                    width: AppSize.s250,
                    height: AppSize.s50,
                    context: context,
                    funOnPressed: () {
                      if (emailController.text.isEmpty &&
                          _passwordController.text.isEmpty) {
                        snackbar(
                            title: StringManager.error,
                            message: StringManager.errorMessage1);
                      } else if (_passwordController.text.length < 8) {
                        snackbar(
                            title: StringManager.error,
                            message: StringManager.errorMessage2);
                        ;
                      } else
                        Get.off(() => MainScreen(),
                            transition: Transition.downToUp);
                    }),
                SizedBox(
                  height: AppSize.s20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Divider(
                        height: 2,
                        color: ColorManager.disabledGray,
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s8,
                    ),
                    Text(StringManager.or, style: theme.textTheme.titleSmall!),
                    SizedBox(
                      width: AppSize.s8,
                    ),
                    Flexible(
                      flex: 1,
                      child: Divider(
                        height: 2,
                        color: ColorManager.disabledGray,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppSize.s16,
                ),
                SecondButton(
                    colorText: ColorManager.white,
                    text: StringManager.facebook,
                    asset: AssetsApp.facebookLogo,
                    height: AppSize.s50,
                    width: 440,
                    color: ColorManager.accentBlue,
                    context: context,
                    funOnPressed: () {}),
                SizedBox(
                  height: AppSize.s12,
                ),
                SecondButton(
                    colorText: ColorManager.black,
                    text: StringManager.google,
                    asset: AssetsApp.googleLogo,
                    width: 440,
                    height: AppSize.s50,
                    color: ColorManager.white,
                    context: context,
                    funOnPressed: () {}),
                SizedBox(
                  height: AppSize.s16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringManager.register,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(
                      width: AppSize.s8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteManager.signUpRoute);
                        AppConstants.colorBorder = ColorManager.white;
                      },
                      child: Text(
                        StringManager.signUp,
                        style: theme.textTheme.displayMedium!.apply(
                            color: ColorManager.lightGreen,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
