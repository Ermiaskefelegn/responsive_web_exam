import 'package:flutter/material.dart';

import 'package:get/get.dart' hide Condition;
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_web_exam/app/data/constants.dart';
import 'package:responsive_web_exam/app/modules/home/views/widgets/search_shoes.dart';
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
        toolbarHeight: ResponsiveWrapper.of(context).isMobile ? 15.h : 30.h,
        title: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: ResponsiveWrapper.of(context).isMobile ? 6.h : 6.h,
                  width: Get.width,
                  color: Constants.primarycolor,
                ),
                SizedBox(
                  height: ResponsiveWrapper.of(context).isMobile ? 1.5.h : 5.h,
                ),
                SizedBox(
                  width: Get.width,
                  height: ResponsiveWrapper.of(context).isMobile ? 5.h : 15.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'My Products',
                        style: TextStyle(
                            color: Constants.textcolorblack,
                            fontWeight: FontWeight.bold),
                      ),
                      ResponsiveWrapper.of(context).isMobile
                          ? const SizedBox()
                          : Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 6,
                                  itemBuilder: ((context, index) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 1.h),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 2.h, horizontal: 2.h),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Constants.aza, width: 2),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(30))),
                                      height: 0.5.w,
                                      child: const Center(
                                        child: Text(
                                          'Convers Shoes',
                                          style: TextStyle(
                                              color: Constants.textcolorblack,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    );
                                  })),
                            )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 3.h,
              right: ResponsiveWrapper.of(context).isMobile ? 12.5.w : 30.w,
              child: InkWell(
                onTap: () {
                  showSearch(context: context, delegate: SearchProducts());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  width: ResponsiveWrapper.of(context).isMobile ? 70.w : 60.h,
                  height: ResponsiveWrapper.of(context).isMobile ? 4.h : 3.w,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1, 1),
                          spreadRadius: 0,
                          blurRadius: 5,
                          color: Colors.grey.withOpacity(0.9),
                        ),
                      ],
                      color: Constants.backgroundcolor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Constants.aza),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Search for a Product',
                        style: TextStyle(
                            fontSize: ResponsiveWrapper.of(context).isMobile
                                ? 10.sp
                                : 3.5.sp,
                            color: Constants.textcolorblack,
                            fontWeight: FontWeight.w400),
                      ),
                      VerticalDivider(
                        color: Constants.aza,
                        endIndent: 6,
                        indent: 6,
                        width: 2.w,
                      ),
                      DropdownButton(
                          underline: const SizedBox(),
                          elevation: 0,
                          hint: Text(
                            "Categroies",
                            style: TextStyle(
                              color: Constants.aza,
                              fontSize: ResponsiveWrapper.of(context).isMobile
                                  ? 10.sp
                                  : 3.5.sp,
                            ),
                          ),
                          items: const [],
                          onChanged: (value) {})
                    ],
                  ),
                ),
              ),
            )
          ],
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
              ResponsiveVisibility(
                  visible: false,
                  visibleWhen: const [Condition.largerThan(name: MOBILE)],
                  child: responsiveheader(context)),
              responsivegridview(context)
            ],
          )),
    );
  }

  Container responsiveheader(BuildContext context) {
    return Container(
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
                    fontSize:
                        ResponsiveWrapper.of(context).isMobile ? 12.sp : 6.sp,
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
                          margin: EdgeInsets.symmetric(horizontal: 0.6.w),
                          height: 3.5.w,
                          width: 3.5.w,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: Image.asset(
                            'addidaslogo.png',
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.6.w),
                          height: 3.5.w,
                          width: 3.5.w,
                          decoration: BoxDecoration(
                              color: Constants.aza.withOpacity(.8),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6))),
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
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Image.asset(
                    'addidaslogo.png',
                  ),
                );
              }))
        ],
      ),
    );
  }

  Expanded responsivegridview(
    BuildContext context,
  ) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.w),
        // padding: EdgeInsets.symmetric(vertical: 2.w),
        child: Obx(() {
          return GridView.builder(
            itemCount: controller.producslist.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveWrapper.of(context).isDesktop
                    ? 4
                    : ResponsiveWrapper.of(context).isMobile
                        ? 2
                        : ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                            ? 3
                            : 3,
                crossAxisSpacing: 4.w,
                mainAxisSpacing: 2.w),
            itemBuilder: (BuildContext context, int index) {
              return HoverWidgetContainer(
                widgetcottainer: Container(
                  alignment: Alignment.topCenter,
                  height: 16.h,
                  width: 10.w,
                  decoration: const BoxDecoration(
                      color: Constants.backgroundcolor,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        controller.producslist[index].image!.s.toString(),
                        // height: 20.h,
                        // width: 30.h,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.h, top: .5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              controller.producslist[index].title!.s.toString(),
                              style: TextStyle(
                                  color: Constants.textcolorblack,
                                  fontSize:
                                      ResponsiveWrapper.of(context).isMobile
                                          ? 10.sp
                                          : 3.5.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              controller.producslist[index].price!.n.toString(),
                              style: TextStyle(
                                  color: Constants.textcolorblack,
                                  fontSize:
                                      ResponsiveWrapper.of(context).isMobile
                                          ? 8.sp
                                          : 3.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
