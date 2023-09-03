import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keswa/components/drop_down.dart';
import 'package:keswa/recourses/color_manager.dart';
import '../../components/first_button.dart';
import '../../components/snackbar.dart';
import '../../components/text_form.dart';
import '../../recourses/app_constants.dart';
import '../../recourses/routes_manager.dart';
import '../../recourses/strings_manager.dart';
import '../../recourses/values_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Color colorItem = ColorManager.darkGray;

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
                              height: AppSize.s30,
                            ),
                            Text(
                              StringManager.email,
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
                              StringManager.country,
                              style: theme.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: AppSize.s12,
                            ),
                            dropDownMenu(
                                color: colorItem,
                                text: AppConstants.selectedCountry,
                                list: AppConstants.countryList,
                                onChanged: (String? value) {
                                  setState(() {
                                    AppConstants.selectedCountry = value!;
                                    colorItem = ColorManager.black;
                                  });
                                }),
                            SizedBox(
                              height: AppSize.s20,
                            ),
                            Text(
                              StringManager.gender,
                              style: theme.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: AppSize.s12,
                            ),
                            dropDownMenu(
                                color: colorItem,
                                text: AppConstants.selectedGender,
                                list: AppConstants.genderList,
                                onChanged: (value) {
                                  setState(() {
                                    AppConstants.selectedGender = value!;
                                    colorItem = ColorManager.black;
                                  });
                                }),
                            SizedBox(
                              height: AppSize.s20,
                            ),
                            Text(
                              StringManager.dateOfBrith,
                              style: theme.textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: AppSize.s12,
                            ),
                            textForm(
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.utc(1980),
                                        lastDate: DateTime.utc(2025))
                                    .then((value) {
                                  if (value != null) {
                                    dateController.text =
                                        DateFormat.yMMMd().format(value);
                                  } else
                                    dateController.text = '';
                                });
                              },
                              colorBorder: AppConstants.colorBorder,
                              controller: dateController,
                              labelText: StringManager.date,
                            ),
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
                                readOnly: true,
                                colorBorder: AppConstants.colorBorder,
                                obscure: !AppConstants.visible,
                                controller: passwordController,
                                labelText: StringManager.passwordHint,
                                suffixIcon: AppConstants.visibilityOff,
                                onIconPressed: () {
                                  setState(() {
                                    AppConstants.visible =
                                        !AppConstants.visible;
                                    if (AppConstants.visible) {
                                      AppConstants.visibilityOff =
                                          Icons.visibility;
                                    } else
                                      AppConstants.visibilityOff =
                                          Icons.visibility_off;
                                  });
                                }),
                            SizedBox(
                              height: AppSize.s20,
                            ),
                            FirstButton(
                                textButton: StringManager.signUp,
                                width: AppSize.s250,
                                height: AppSize.s50,
                                context: context,
                                funOnPressed: () {
                                  if (emailController.text.isEmpty &&
                                      passwordController.text.isEmpty &&
                                      dateController.text.isEmpty) {
                                    snackbar(
                                        title: StringManager.error,
                                        message: StringManager.errorMessage4);
                                  } else if (passwordController.text.length <
                                      8) {
                                    snackbar(
                                        title: StringManager.error,
                                        message: StringManager.errorMessage2);
                                  } else if (dateController.text == '') {
                                    snackbar(
                                        title: 'error',
                                        message: 'Date required');
                                  } else {
                                    Navigator.pushNamed(
                                        context, RouteManager.verifyRoute);
                                  }
                                }),
                          ])))),
        ));
  }
}
