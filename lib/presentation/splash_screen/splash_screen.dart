
import 'dart:async';

import 'package:flutter/material.dart';
import '../../recourses/app_constants.dart';
import '../../recourses/assets_strings.dart';
import '../../recourses/routes_manager.dart';
import '../../recourses/values_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer ;

  startTimer(){
    _timer =Timer(Duration(seconds: AppConstants.timer), goNext);
  }

  goNext(){
    Navigator.pushReplacementNamed(context, RouteManager.signInRoute);
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(AssetsApp.splashScreen,
                fit: BoxFit.fill,),
            ),
            Positioned(
                right: _mediaQuery.size.width * 0.3,
                left: _mediaQuery.size.width * 0.3,
                bottom: AppPadding.p51,
                child:Image.asset(AssetsApp.splashScreenLogo))

          ],
        ),
      ),

    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

}
