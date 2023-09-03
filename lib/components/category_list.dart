import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keswa/presentation/view_all/view_all.dart';
import '../recourses/color_manager.dart';
import '../recourses/font_manager.dart';
import '../recourses/style_manager.dart';
import '../recourses/values_manager.dart';
import '../uitls/controller.dart';

var c = Get.put(Controller());
List<String> items = [
  'New Arival',
  'Shop All',
  'Dresses',
  'Jeans',
  'Knitwear',
  'Shorts',
  'skirts'
];
Widget categoryList({required BuildContext context}) => GestureDetector(
      onTap: () {
        Get.to(() => ViewALLScreen(), transition: Transition.fade);
      },
      child: Container(
        height: 530,
        margin: EdgeInsets.only(
            left: AppSize.s16, right: AppSize.s12, top: AppSize.s16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  c.categoryName.value,
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s17),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                child: Image.asset('assets/icons/cloth.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                items[index],
                                style: getRegularStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s14),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Divider(
                            height: 2,
                            color: ColorManager.lightGray,
                          ),
                          SizedBox(
                            height: 6,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
