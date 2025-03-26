import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            backgroundColor: Colors.grey[100],
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Edit cat",
                          style: TextStyle(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    // Cat information
                    Container(
                      margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
                      child: Text(
                        "Cat information",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      width: double.infinity,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text("Ginger", style: TextStyle(fontSize: 18.sp)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      width: double.infinity,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Date of birth",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            "Jan 2, 2021",
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      width: double.infinity,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Breed",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            "Siberian cat",
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      width: double.infinity,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text("Male", style: TextStyle(fontSize: 18.sp)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      width: double.infinity,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Length",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text("50cm", style: TextStyle(fontSize: 18.sp)),
                        ],
                      ),
                    ),

                    // Insurance information
                    Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Text(
                        "Insurance information",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      width: double.infinity,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Insurance provider",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text("Allianz", style: TextStyle(fontSize: 18.sp)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      width: double.infinity,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Insurance number",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            "98722728282",
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
