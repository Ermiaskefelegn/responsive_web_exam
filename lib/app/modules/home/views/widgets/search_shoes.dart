import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_web_exam/app/data/constants.dart';
import 'package:responsive_web_exam/app/modules/home/views/widgets/Hover_widgets.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/home_controller.dart';

class SearchProducts extends SearchDelegate<dynamic> {
  // for()
  // List<Map<String, dynamic>>.from(json.decode(response.body)['membre']);
  HomeController homeController = Get.put(HomeController());
  // List companynames = homeController.searchitemslist;
  List fooditemname = [];
  SearchProducts(
      // this.companynames,
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<dynamic> searchlist = query.isEmpty
        ? []
        : homeController.searchitemslist
            .where((P) => P.title!.s!.contains(query))
            .toList();
    return homeController.searchitemslist.contains(query)
        ? ListView.builder(
            itemCount: searchlist.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return HoverWidgetContainer(
                widgetcottainer: Container(
                  alignment: Alignment.topCenter,
                  height: 10.h,
                  width: 10.w,
                  decoration: const BoxDecoration(
                      color: Constants.backgroundcolor,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
              );
            })
        : const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('No Items found'),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    fooditemname.clear();
    for (var element in homeController.searchitemslist) {
      fooditemname.add(element.title!.s.toString());
    }
    print("printing listed items$fooditemname");
    List<dynamic> companyList = query.isEmpty
        ? []
        : fooditemname.toList().where((P) => P.contains(query)).toList();

    return companyList.isEmpty
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('No Items found'),
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: companyList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 2.h, top: 4.h),
                child: Text(
                  fooditemname[index],
                  style: TextStyle(
                      color: Constants.textcolorblack,
                      fontSize: ResponsiveWrapper.of(context).isMobile
                          ? 10.sp
                          : 3.5.sp,
                      fontWeight: FontWeight.bold),
                ),
              );
            });
  }
}
