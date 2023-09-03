import 'package:flutter/material.dart';
import 'package:keswa/presentation/forgot_password_screen/forgot_screen.dart';
import 'package:keswa/presentation/product/product_item.dart';
import 'package:keswa/presentation/search_screen/search_screen.dart';
import 'package:keswa/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:keswa/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:keswa/presentation/verification_screen/verification_screen.dart';
import 'package:keswa/presentation/verify_screen/verify_screen.dart';
import 'package:keswa/presentation/view_all/view_all.dart';
import 'package:keswa/presentation/view_all/view_all_brands.dart';
import 'package:keswa/recourses/strings_manager.dart';
import 'package:keswa/presentation/splash_screen/splash_screen.dart';
import '../presentation/main_screen/main_screen.dart';

class RouteManager {
  static const String splashRoute = "/";
  static const String signInRoute = "/login_screen";
  static const String signUpRoute = "/register_screen";
  static const String forgotPasswordRoute = "/forgot_Password";
  static const String verificationRoute = "/verification_Screen4";
  static const String verifyRoute = "/verify_screen";
  static const String mainRoute = "/main_screen";
  static const String searchRoute = "/search_screen";
  static const String viewAllRoute = "/view_all_screen";
  static const String viewAllBrandsRoute = "/view_all_brands_screen";
  static const String productPage = "/prduct_screen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RouteManager.signInRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case RouteManager.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case RouteManager.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case RouteManager.verificationRoute:
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case RouteManager.verifyRoute:
        return MaterialPageRoute(builder: (_) => VerifyScreen());
      case RouteManager.mainRoute:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case RouteManager.searchRoute:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case RouteManager.viewAllRoute:
        return MaterialPageRoute(builder: (_) => ViewALLScreen());
      case RouteManager.viewAllBrandsRoute:
        return MaterialPageRoute(builder: (_) => ViewAllBrands());
      case RouteManager.productPage:
        return MaterialPageRoute(builder: (_) => ProductPage());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(StringManager.undefinedPage),
              ),
              body: Center(child: Text(StringManager.undefinedPage)),
            ));
  }
}
