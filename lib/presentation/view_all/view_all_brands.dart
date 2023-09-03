import 'package:flutter/material.dart';
import 'package:keswa/recourses/color_manager.dart';
import '../../components/custom_bar.dart';
import '../../recourses/app_constants.dart';
import '../../recourses/assets_strings.dart';
import '../../recourses/routes_manager.dart';
import '../../recourses/strings_manager.dart';
import '../../recourses/values_manager.dart';

class ViewAllBrands extends StatefulWidget {
  const ViewAllBrands({super.key});

  @override
  State<ViewAllBrands> createState() => _ViewAllBrandsState();
}

class _ViewAllBrandsState extends State<ViewAllBrands> {
  List<bool> react = List.filled(AppConstants.brandImgs.length, false);
  List<String> assetName =
      List.filled(AppConstants.brandImgs.length, AssetsApp.heart);
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSize.s10,
              ),
              customBar(
                paddingBack: AppSize.s50,
                paddingForward: AppSize.s60,
                onTapSearch: () =>
                    Navigator.pushNamed(context, RouteManager.searchRoute),
                onPressedBack: () => Navigator.pop(context),
                isShown: true,
                isShownBack: true,
                text: StringManager.featureBrand,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: mediaQuery.size.height,
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: AppConstants.imgBrands.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.5,
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 13),
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        ColorManager.lightGray.withOpacity(0.4),
                                    spreadRadius: 1.5,
                                    blurRadius: 3,
                                    offset: Offset(0, 1.1))
                              ]),
                          alignment: Alignment.center,
                          // color: ColorManager.white,
                          // height: 90,
                          // width: 130,
                          child: Image.asset(
                            AppConstants.imgBrands[index],
                            fit: BoxFit.cover,
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
