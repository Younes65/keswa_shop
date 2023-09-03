import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/components/brand.dart';
import 'package:keswa/components/categories.dart';
import 'package:keswa/presentation/product/product_item.dart';
import 'package:keswa/recourses/app_constants.dart';
import 'package:keswa/recourses/assets_strings.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/routes_manager.dart';
import 'package:keswa/recourses/strings_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import 'package:keswa/recourses/values_manager.dart';
import 'package:keswa/uitls/controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/custom_bar.dart';
import 'categories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var c = Get.put(Controller());
  int activeIndex = 0;
  List<String> imgs = [
    AssetsApp.bannerMask,
    AssetsApp.bannerSlider,
    AssetsApp.homeLogo1
  ];
  List<String> imgSlider = [
    AssetsApp.clothing,
    AssetsApp.sportsSwear,
    AssetsApp.scarves,
    AssetsApp.footWear
  ];
  List<String> imgList = [AssetsApp.styleBanner, AssetsApp.styleBanner];
  List<String> imgBrands = [
    AssetsApp.carter,
    AssetsApp.timberland,
    AssetsApp.carter,
    AssetsApp.timberland,
    AssetsApp.carter,
    AssetsApp.timberland,
  ];
  List<String> textCategory = [
    StringManager.clothing,
    StringManager.sport,
    StringManager.foot,
    StringManager.scarves
  ];
  List<String> brandImgs = [
    AssetsApp.shein,
    AssetsApp.pullBear,
    AssetsApp.lacoste
  ];

  List<String> textDescription = [
    StringManager.blackLeather,
    StringManager.knittedJacket,
    StringManager.printed
  ];
  List<int> textPrice = [550, 550, 550];
  List<String> textDiscount = ['Price: 1000 EGP', '', '', 'Price: 1000 EGP'];

  List<String> brandText = [
    StringManager.shein,
    StringManager.pull,
    StringManager.lacoste,
  ];

  bool isWomenSelected = false;
  bool isMenSelected = false;
  bool isKidsSelected = false;

  List<bool> react = List.filled(AppConstants.brandImgs.length, false);
  List<String> assetName =
      List.filled(AppConstants.brandImgs.length, AssetsApp.heart);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme1 = theme.textTheme.titleLarge!.apply(
        color: ColorManager.lightGreen, decoration: TextDecoration.underline);
    var textTheme2 = theme.textTheme.titleLarge!.apply(
      color: ColorManager.lightGray,
    );
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.s20,
              ),
              Center(
                child: customBar(
                  onTapSearch: () {
                    setState(() {
                      Navigator.pushNamed(context, RouteManager.searchRoute);
                    });
                  },
                  paddingBack: AppSize.s100,
                  paddingForward: AppSize.s75,
                  isShownBack: false,
                  isImage: true,
                  isShown: true,
                  imageLogo: AssetsApp.homeLogo,
                ),
              ),
              SizedBox(
                height: AppSize.s12,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: AppPadding.p51),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isWomenSelected = false;
                          if (isWomenSelected) {
                            isKidsSelected = false;
                            isMenSelected = false;
                          } else {
                            isKidsSelected = false;
                            isMenSelected = false;
                          }
                        });
                      },
                      child: Text(
                        StringManager.women,
                        style: isWomenSelected ? textTheme2 : textTheme1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMenSelected = true;
                          if (isMenSelected) {
                            isWomenSelected = true;
                            isKidsSelected = false;
                          }
                        });
                      },
                      child: Text(
                        StringManager.men,
                        style: isMenSelected ? textTheme1 : textTheme2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isKidsSelected = true;
                          if (isKidsSelected) {
                            isWomenSelected = true;
                            isMenSelected = false;
                          }
                        });
                      },
                      child: Text(
                        StringManager.kids,
                        style: isKidsSelected ? textTheme1 : textTheme2,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(children: [
                Container(
                  child: CarouselSlider.builder(
                      itemCount: imgs.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          child: Image.asset(imgs[index]),
                        );
                      },
                      options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                          autoPlayInterval: Duration(seconds: 2),
                          autoPlay: true,
                          height: 190,
                          viewportFraction: 1)),
                ),
                Positioned(
                    left: mediaQuery.width * 0.48,
                    bottom: AppSize.s30,
                    child: AnimatedSmoothIndicator(
                      count: imgs.length,
                      activeIndex: activeIndex,
                      effect: JumpingDotEffect(
                          activeDotColor: ColorManager.darkGray,
                          dotHeight: AppSize.s8,
                          dotWidth: AppSize.s8),
                    ))
              ]),
              Image.asset(
                AssetsApp.bannerSlider,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              Text(
                StringManager.shopByCategory,
                style: theme.textTheme.displayLarge,
              ),
              SizedBox(
                height: AppSize.s10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    AppConstants.cate = false;
                  });
                  Get.to(() => CategoriesScreen(),
                      transition: Transition.fadeIn);
                },
                child: Container(
                    width: double.infinity,
                    height: 190,
                    margin: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imgSlider.length,
                        itemBuilder: (context, index) {
                          return category(
                              onTapItem: () {
                                setState(() {
                                  AppConstants.cate = false;
                                  c.categoryName.value = textCategory[index];
                                });
                                Get.to(() => CategoriesScreen(),
                                    transition: Transition.fadeIn);
                              },
                              imgName: imgSlider[index],
                              textCategory: textCategory[index]);
                        })),
              ),
              SizedBox(
                height: AppSize.s30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.newArrival,
                      style: getBoldStyle2(
                          color: ColorManager.black, fontSize: FontSize.s17),
                    ),
                    GestureDetector(
                      onTap: () {
                        c.filter.value = 'New Arrival';
                        Navigator.pushNamed(context, RouteManager.viewAllRoute);
                      },
                      child: Text(
                        StringManager.viewAll,
                        style: getRegularStyle(
                                color: ColorManager.disabledGray,
                                fontSize: FontSize.s16)
                            .apply(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.s12,
              ),
              Container(
                  height: AppSize.s310,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: brandImgs.length,
                      itemBuilder: (context, index) {
                        return brand(
                          onTapProduct: () {
                            c.pushPrducts(
                                brandImgs[index],
                                brandText[index],
                                textDescription[index],
                                textPrice[index],
                                textDiscount[index]);
                            Get.to(() => ProductPage(),
                                transition: Transition.rightToLeft);
                          },
                          onTap: () {
                            setState(() {
                              react[index] = !react[index];
                              if (react[index]) {
                                assetName[index] = AssetsApp.heartBlack;
                              } else
                                assetName[index] = AssetsApp.heart;
                            });
                          },
                          // isLiked: react[index],
                          assetName: assetName[index],
                          imgName: brandImgs[index],
                          textBrand: brandText[index],
                          textDescription: textDescription[index],
                          textDiscount: textDiscount[index],
                          textPrice: '${textPrice[index]} EGP',
                        );
                      })),
              SizedBox(
                height: AppSize.s20,
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imgList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          imgList[index],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.ourBrands,
                      style: getBoldStyle2(
                          color: ColorManager.black, fontSize: FontSize.s17),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteManager.viewAllBrandsRoute);
                      },
                      child: Text(
                        StringManager.viewAll,
                        style: getRegularStyle(
                                color: ColorManager.disabledGray,
                                fontSize: FontSize.s16)
                            .apply(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imgBrands.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 88,
                        height: 60,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          AppConstants.imgBrands[index],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.trendingNow,
                      style: getBoldStyle2(
                          color: ColorManager.black, fontSize: FontSize.s17),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteManager.viewAllRoute);
                      },
                      child: Text(
                        StringManager.viewAll,
                        style: getRegularStyle(
                                color: ColorManager.disabledGray,
                                fontSize: FontSize.s16)
                            .apply(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.s12,
              ),
              Container(
                  height: AppSize.s350,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: brandImgs.length,
                      itemBuilder: (context, index) {
                        return brand(
                          assetName: assetName[index],
                          // isLiked: react[index],
                          onTap: () {
                            setState(() {
                              react[index] = !react[index];
                              if (react[index]) {
                                assetName[index] = AssetsApp.heartBlack;
                              } else
                                assetName[index] = AssetsApp.heart;
                            });
                          },
                          imgName: brandImgs[index],
                          textBrand: brandText[index],
                          textDescription: textDescription[index],
                          textDiscount: textDiscount[index],
                          textPrice: '${textPrice[index]}',
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
