import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:purr_time/store/cat.dart';

String formatCatAge(DateTime birthDate) {
  final now = DateTime.now();

  final ageInDays = now.difference(birthDate).inDays;

  if (ageInDays >= 365) {
    final years = (ageInDays / 365).floor();
    return "$years y/o";
  } else if (ageInDays >= 30) {
    final months = (ageInDays / 30).floor();
    return "$months m/o";
  } else {
    return "$ageInDays d/o";
  }
}

class MyPets extends StatefulWidget {
  const MyPets({super.key});

  @override
  State<MyPets> createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  _toCatPage({String? catId}) {
    Get.toNamed("/cat", arguments: {"catId": catId});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFFF9E3A8),
                        Color(0xFFFAE6AD),
                        Color(0xFFFAE6AB),
                        Color(0xffFBE7A9),
                        Color(0xFFFBE7AC),
                      ],
                    ),
                  ),
                  width: double.infinity,
                  height: 250.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 55.h,
                          left: 16.w,
                          right: 16.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My pets",
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            IconButton(
                              iconSize: 30.sp,
                              icon: Icon(Icons.add),
                              onPressed: _toCatPage,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 280,
                        height: 82,
                        margin: EdgeInsets.only(top: 20.h),
                        child: Obx(() {
                          return Swiper(
                            itemCount: CatController.to.catList.length,
                            viewportFraction: 0.4,
                            scale: 0.15,
                            loop: CatController.to.catList.length > 2,
                            onIndexChanged: (value) {
                              CatController.to.setProfileSelectedCat(
                                CatController.to.catList[value],
                              );
                            },
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  _toCatPage(
                                    catId: CatController.to.catList[index].id,
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.5.w,
                                    ),
                                    //circle
                                    borderRadius: BorderRadius.circular(50.r),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        CatController.to.catList[index].image ??
                                            "",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -15.h,
                  child: Container(
                    width: 100.w,
                    height: 30.h,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
              ],
            ),
            // Profile details
            _renderProfileDetail(context),
            // Share the love
            Padding(
              padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  Text(
                    "Share the love ❤",
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 165.w,
                        height: 170.h,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(249, 229, 172, 1),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      Container(
                        width: 165.w,
                        height: 170.h,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(249, 229, 172, 1),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _renderProfileDetail(BuildContext context) {
  return Container(
    height: 140.h,
    decoration: BoxDecoration(color: Color.fromRGBO(254, 254, 254, 1)),
    child: Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formatCatAge(
                    CatController.to.profileSelectedCat.value!.birth,
                  ),
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Age",
                  style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
                ),
              ],
            ),
          ),
          Container(
            width: 1.w,
            height: 100.h,
            decoration: BoxDecoration(color: Colors.grey[300]),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CatController.to.profileSelectedCat.value!.code,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Code",
                  style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
                ),
              ],
            ),
          ),
          Container(
            width: 1.w,
            height: 100.h,
            decoration: BoxDecoration(color: Colors.grey[300]),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CatController.to.profileSelectedCat.value!.gender,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sex",
                  style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ],
      );
    }),
  );
}
