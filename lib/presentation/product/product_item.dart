import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/components/first_button.dart';
import 'package:keswa/components/flexible_sheet.dart';
import 'package:keswa/components/snackbar.dart';
import 'package:keswa/presentation/slider_image/slider_image.dart';
import 'package:keswa/recourses/app_constants.dart';
import 'package:keswa/recourses/assets_strings.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/routes_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import 'package:keswa/uitls/controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../components/brand.dart';
import '../../components/custom_bar.dart';
import '../../components/divider.dart';
import '../../recourses/color_manager.dart';
import '../../recourses/strings_manager.dart';
import '../../recourses/values_manager.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var c = Get.put(Controller());
  int activeIndex = 0;
  var size = '';
  int? item;
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
  List<int> textPrice = [550, 550, 500];
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
  List<String> info = [
    'Description',
    'FAQs',
    'Shipping Details',
    'Return Policy'
  ];

  List prcent = [70, 5, 25];
  List desc = ['Small Size', 'True to Size', 'Larger Size'];
  Widget sizeChart() {
    return Container(
      height: 250,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.cancel_outlined)),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Size Chart',
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s16),
                ),
              ),
            ),
            SizedBox(
              width: 40,
            )
          ],
        ),
      ]),
    );
  }

  Widget selectSize() {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringManager.selectSize,
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.s17),
            ),
            GestureDetector(
              onTap: () {
                flexibleSheet(context: context, widget: sizeChart());
              },
              child: Text(
                StringManager.sizeChart,
                style: getRegularStyle(
                        color: ColorManager.disabledGray,
                        fontSize: FontSize.s16)
                    .apply(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          height: AppSize.s42,
          width: mediaQuery.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AppConstants.size.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    item = index;
                    size = AppConstants.size[index];
                  });
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: AppSize.s16,
                  width: AppSize.s50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: item == index
                          ? ColorManager.disabledGray
                          : ColorManager.white,
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.lightGray.withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 2,
                            offset: Offset(0.5, 1))
                      ]),
                  child: Center(
                    child: Text(
                      AppConstants.size[index],
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
            child: Text(
          'Only 1 Item left!',
          style: theme.textTheme.titleSmall!
              .apply(color: ColorManager.red.withOpacity(0.6)),
        )),
      ],
    );
  }

  Widget bottomSheetInfo({String? text}) {
    return Container(
      height: AppSize.s350,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.cancel_outlined)),
            ),
            Expanded(
              child: Center(
                child: Text(
                  text!,
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s16),
                ),
              ),
            ),
            SizedBox(
              width: 40,
            )
          ],
        ),
      ]),
    );
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List imgs = [c.imageName.value, c.imageName.value];
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: ColorManager.white, boxShadow: [
          BoxShadow(
              color: ColorManager.lightGray.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(1, 1.5))
        ]),
        height: 90,
        width: double.infinity,
        child: FirstButton(
          textButton: 'Add To Cart',
          context: context,
          funOnPressed: () {
            if (item == null) {
              snackbar(title: 'Error', message: 'you must select size');
              _scrollController.animateTo(450,
                  curve: Curves.easeIn, duration: Duration(milliseconds: 1000));
            } else {
              c.pushCart(size: size);
              if (!AppConstants.list1.contains(c.imageName.value))
                AppConstants.list1.add(c.imageName.value);
              AppConstants.list2.add(c.brandName.value);
              AppConstants.list3.add(c.productName.value);
              AppConstants.list4.add(c.productPrice.value);
              AppConstants.list5.add(c.sizeItem.value);
              // Navigator.pop(context);
              c.pushCart(size: size);
              snackbar1(title: 'Success', message: 'Item Added');
              setState(() {});
            }
          },
        ),
      ),
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: AppSize.s10,
        ),
        Obx(
          () => Container(
            height: 40,
            margin: EdgeInsets.only(left: 10),
            child: customBar(
              onPressedBack: () => Navigator.pop(context),
              isShownCarte: true,
              isShownBack: true,
              text: c.productName.value,
            ),
          ),
        ),
        SizedBox(
          height: AppSize.s10,
        ),
        Expanded(
          child: Container(
            height: 553,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(children: [
                    CarouselSlider.builder(
                        itemCount: imgs.length,
                        itemBuilder: (context, index, realIndex) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => SliderImageScreen(),
                                  transition: Transition.fade);
                            },
                            child: Container(
                              padding: EdgeInsets.only(right: AppPadding.p12),
                              width: mediaQuery.width,
                              child: Image.asset(
                                imgs[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                            padEnds: false,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                activeIndex = index;
                              });
                            },
                            autoPlayInterval: Duration(seconds: 2),
                            autoPlay: false,
                            height: 330,
                            viewportFraction: 0.77)),
                    Positioned(
                        left: mediaQuery.width * 0.48,
                        bottom: AppSize.s30,
                        child: AnimatedSmoothIndicator(
                          count: imgs.length,
                          activeIndex: activeIndex,
                          effect: JumpingDotEffect(
                              activeDotColor: ColorManager.white,
                              dotHeight: AppSize.s8,
                              dotWidth: AppSize.s8),
                        ))
                  ]),
                  SizedBox(
                    height: AppSize.s12,
                  ),
                  Container(
                    height: mediaQuery.height,
                    margin: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                c.brandName.value,
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s17),
                              ),
                              Row(
                                children: [
                                  Image.asset(AssetsApp.star),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  Text(
                                    '4.8 Ratings',
                                    style: getMediumStyle(
                                        color: ColorManager.black),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s16,
                          ),
                          Text(
                            c.productName.value,
                            style: getMediumStyle(color: ColorManager.black),
                          ),
                          SizedBox(
                            height: AppSize.s16,
                          ),
                          Row(
                            children: [
                              if (c.discount.value != '')
                                Text(
                                  c.discount.value,
                                  style: theme.textTheme.titleMedium!.apply(
                                      decoration: TextDecoration.lineThrough,
                                      color: ColorManager.lightGray),
                                ),
                              if (c.discount.value != '')
                                SizedBox(
                                  width: 9,
                                ),
                              Text(
                                '${c.productPrice.value}',
                                style: getBoldStyle(
                                    color: ColorManager.red,
                                    fontSize: FontSize.s17),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            'SKU: swdress1025896',
                            style: theme.textTheme.titleSmall,
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Origin: UK',
                                style: theme.textTheme.titleSmall,
                              ),
                              Container(
                                height: 25,
                                width: 60,
                                color: ColorManager.lightGreen,
                                child: Center(
                                    child: Text(
                                  'Exclusive',
                                  style: theme.textTheme.bodyMedium!
                                      .apply(color: ColorManager.white),
                                )),
                              )
                            ],
                          ),
                          divider(),
                          selectSize(),
                          divider(),
                          Text(
                            StringManager.moreOptions,
                            style: getSemiBoldStyle(
                                color: ColorManager.black, fontSize: 17),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Container(
                            height: AppSize.s100,
                            width: mediaQuery.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: AppConstants.brandImgs.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(ProductPage(),
                                        transition: Transition.fadeIn);
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: AppPadding.p8),
                                    height: AppSize.s100,
                                    width: 90,
                                    child: Image.asset(
                                      AppConstants.brandImgs[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          divider(),
                          Expanded(
                            child: Container(
                              height: 200,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: AppSize.s51,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              info[index],
                                              style: getSemiBoldStyle(
                                                  color: ColorManager.black,
                                                  fontSize: FontSize.s17),
                                            ),
                                            IconButton(
                                                iconSize: AppSize.s16,
                                                onPressed: () {
                                                  if (index == 0)
                                                    flexibleSheet(
                                                        context: context,
                                                        widget: bottomSheetInfo(
                                                            text: info[index]));
                                                  else if (index == 1)
                                                    flexibleSheet(
                                                        context: context,
                                                        widget: bottomSheetInfo(
                                                            text: info[index]));
                                                  else if (index == 2)
                                                    flexibleSheet(
                                                        context: context,
                                                        widget: bottomSheetInfo(
                                                            text: info[index]));
                                                  else
                                                    flexibleSheet(
                                                        context: context,
                                                        widget: bottomSheetInfo(
                                                            text: info[index]));
                                                },
                                                icon: Icon(
                                                    Icons.arrow_forward_ios))
                                          ],
                                        ),
                                        Divider(
                                          height: 2,
                                          color: ColorManager.disabledGray,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    height: 1250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Feature',
                              style: getSemiBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s18),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    iconSize: 15,
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_back_ios)),
                                IconButton(
                                    iconSize: 15,
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 50,
                        ),
                        divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringManager.customerReview,
                              style: getSemiBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s17),
                            ),
                            GestureDetector(
                              onTap: () {
                                flexibleSheet(
                                    context: context, widget: sizeChart());
                              },
                              child: Text(
                                StringManager.viewAll,
                                style: getRegularStyle(
                                        color: ColorManager.disabledGray,
                                        fontSize: FontSize.s16)
                                    .apply(
                                        decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          '( 1025 Ratings )',
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Image.asset(AssetsApp.star),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              '4.8 Ratings',
                              style: getMediumStyle(color: ColorManager.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Did the item fit well ?',
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: desc.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      desc[index],
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    LinearPercentIndicator(
                                      barRadius: Radius.circular(12),
                                      animation: true,
                                      width: 150.0,
                                      lineHeight: 8.0,
                                      percent: prcent[index] / 100,
                                      progressColor: ColorManager.red,
                                    ),
                                    Text(
                                      '${prcent[index]} %',
                                      style: theme.textTheme.titleMedium,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        divider(),
                        Text(
                          'Complete The Look',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s16),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                            height: AppSize.s310,
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
                                      setState(() {
                                        Get.toNamed(
                                          RouteManager.productPage,
                                        );
                                      });
                                    },
                                    onTap: () {
                                      setState(() {
                                        react[index] = !react[index];
                                        if (react[index]) {
                                          assetName[index] =
                                              AssetsApp.heartBlack;
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
                                    textPrice: '${textPrice[index]}',
                                  );
                                })),
                        divider(),
                        Text(
                          'Similar Product',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s16),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                            height: AppSize.s310,
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
                                      setState(() {
                                        Get.toNamed(
                                          RouteManager.productPage,
                                        );
                                      });
                                    },
                                    onTap: () {
                                      setState(() {
                                        react[index] = !react[index];
                                        if (react[index]) {
                                          assetName[index] =
                                              AssetsApp.heartBlack;
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
                                    textPrice: '${textPrice[index]}',
                                  );
                                })),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ])),
    );
  }
}
