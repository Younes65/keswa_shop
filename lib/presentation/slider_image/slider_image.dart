import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keswa/recourses/color_manager.dart';
import 'package:photo_view/photo_view.dart';

import '../../uitls/controller.dart';

class SliderImageScreen extends StatefulWidget {
  const SliderImageScreen({super.key});

  @override
  State<SliderImageScreen> createState() => _SliderImageScreenState();
}

class _SliderImageScreenState extends State<SliderImageScreen> {
  var c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    List imgs = [c.imageName.value, c.imageName.value];
    var mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(children: [
            PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imgs.length,
              itemBuilder: (context, index) {
                return Container(
                    height: mediaQuery.height,
                    width: mediaQuery.width,
                    child: PhotoView.customChild(
                      maxScale: PhotoViewComputedScale.contained,
                      minScale: PhotoViewComputedScale.contained,
                      child: Image.asset(
                        imgs[index],
                        fit: BoxFit.fill,
                      ),
                    ));
              },
            ),
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
