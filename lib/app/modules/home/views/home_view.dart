import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_web_exam/app/data/constants.dart';
import 'package:sizer/sizer.dart';
import '../controllers/home_controller.dart';
import 'widgets/Hover_widgets.dart';

class HomeView extends GetView<HomeController> {
  HomeController homeController = Get.put(HomeController());

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Products',
          style: TextStyle(
              color: Constants.textcolorblack, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Constants.backgroundcolor,
      ),
      body: Container(
          alignment: Alignment.center,
          color: Constants.backgroundcolor2,
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                color: Constants.backgroundcolor,
                height: 10.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Constants.backgroundcolor,
                          child: Image.asset('imagecircle.png'),
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        Text(
                          'Addidas Sport wears',
                          style: TextStyle(
                              color: Constants.textcolorblack,
                              fontSize: 6.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: ((context, index) {
                          if (index == 5) {
                            return Stack(
                              children: [
                                Center(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 0.6.w),
                                    height: 3.5.w,
                                    width: 3.5.w,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6))),
                                    child: Image.asset(
                                      'addidaslogo.png',
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 0.6.w),
                                    height: 3.5.w,
                                    width: 3.5.w,
                                    decoration: BoxDecoration(
                                        color: Constants.aza.withOpacity(.8),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6))),
                                    child: Center(
                                      child: Text(
                                        '10+',
                                        style: TextStyle(
                                            color: Constants.backgroundcolor,
                                            fontSize: 3.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 0.6.w),
                            height: 3.5.w,
                            width: 3.5.w,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Image.asset(
                              'addidaslogo.png',
                            ),
                          );
                        }))
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 2.w),
                  // padding: EdgeInsets.symmetric(vertical: 2.w),
                  child: GridView.builder(
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4.w,
                        mainAxisSpacing: 2.w),
                    itemBuilder: (BuildContext context, int index) {
                      return HoverWidgetContainer(
                        widgetcottainer: InkWell(
                          onTap: (() {
                            controller.getAllProducts();
                          }),
                          child: Container(
                            alignment: Alignment.topCenter,
                            height: 10.h,
                            width: 10.w,
                            decoration: const BoxDecoration(
                                color: Constants.backgroundcolor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'shoes.png',
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.h, top: 1.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Addidas Sport wears',
                                        style: TextStyle(
                                            color: Constants.textcolorblack,
                                            fontSize: 3.5.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '\$1200',
                                        style: TextStyle(
                                            color: Constants.textcolorblack,
                                            fontSize: 3.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
