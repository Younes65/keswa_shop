
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keswa/recourses/theme_manager.dart';
import '../recourses/routes_manager.dart';
import 'package:get/get.dart';


class MyApp extends StatefulWidget {

  MyApp._private();

  static MyApp _instance = MyApp._private();

  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RouteManager.splashRoute,
      theme: getAppTheme(),
    );
  }
}
