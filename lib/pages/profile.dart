import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  toCatPage() {
    Get.toNamed("/cat");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        ],
                      ),
                    ),
                    Container(
                      width: 280,
                      height: 82,
                      margin: EdgeInsets.only(top: 20.h),
                      child: Swiper(
                        itemCount: 3,
                        viewportFraction: 0.4,
                        scale: 0.15,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: toCatPage,
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
                              ),
                            ),
                          );
                        },
                      ),
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
          Container(
            height: 140.h,
            decoration: BoxDecoration(color: Color.fromRGBO(254, 254, 254, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "4 y/o",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Age",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.sp,
                        ),
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
                        "Siberian cat",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Breed",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.sp,
                        ),
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
                        "Male",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sex",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
    );
  }
}
