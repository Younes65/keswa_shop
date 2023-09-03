import 'package:flutter/material.dart';
import 'package:keswa/components/text_form.dart';
import 'package:keswa/recourses/app_constants.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:keswa/recourses/font_manager.dart';
import 'package:keswa/recourses/style_manager.dart';
import 'package:keswa/recourses/values_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  List disply = List.from(AppConstants.items);

  updateList(String item) {
    setState(() {
      disply = AppConstants.items
          .where(
              (element) => element.toLowerCase().contains(item.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: AppSize.s20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: AppSize.s20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: textForm(
                      colorBorder: ColorManager.white,
                      onChange: (value) => updateList(value!),
                      labelText: 'Search Something',
                      controller: searchController,
                      suffixIcon: Icons.search),
                ),
                SizedBox(
                  width: AppSize.s12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    searchController.clear();
                  },
                  child: Text(
                    'Cancel',
                    style: getRegularStyle(
                            color: ColorManager.black, fontSize: FontSize.s16)
                        .apply(decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: AppSize.s30,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Category',
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.s14),
            ),
            SizedBox(
              height: AppPadding.p12,
            ),
            Container(
              height: 130,
              width: double.infinity,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: disply.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            disply[index],
                            style: getRegularStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s14),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Divider(
                            height: 2,
                            color: ColorManager.disabledGray,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Brands',
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.s14),
            ),
            SizedBox(
              height: AppPadding.p12,
            ),
            Container(
              height: 130,
              width: double.infinity,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: disply.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            disply[index],
                            style: getRegularStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s14),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Divider(
                            height: 2,
                            color: ColorManager.disabledGray,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Recommended',
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.s14),
            ),
            SizedBox(
              height: AppPadding.p12,
            ),
            Container(
              height: 130,
              width: double.infinity,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: disply.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            disply[index],
                            style: getRegularStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s14),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Divider(
                            height: 2,
                            color: ColorManager.disabledGray,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ]),
        ),
      ),
    ));
  }
}
