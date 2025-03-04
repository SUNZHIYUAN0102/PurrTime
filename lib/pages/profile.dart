import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(249, 229, 172, 1),
                ),
                width: double.infinity,
                height: 300.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 45.h,
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your pets",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
                        "3Kg",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Weight",
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
