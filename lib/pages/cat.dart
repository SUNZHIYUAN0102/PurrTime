import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:purr_time/apis/cats.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final catId = Get.arguments["catId"];
    _getCatById(catId);
  }

  late CatDto cat = CatDto(
    id: "",
    name: "",
    gender: "",
    breed: "",
    birth: DateTime.now(),
    weight: 0,
  );
  _getCatById(catId) async {
    CatDto res = await CatsApi.getCatById(catId);

    setState(() {
      cat = res;
    });
  }

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
            elevation: 0,
            scrolledUnderElevation: 0,
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
                            "Name*",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(cat.name, style: TextStyle(fontSize: 18.sp)),
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
                            "Date of birth*",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            DateFormat('MMM d, y').format(cat.birth),
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
                            "Breed*",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(cat.breed, style: TextStyle(fontSize: 18.sp)),
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
                            "Gender*",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(cat.gender, style: TextStyle(fontSize: 18.sp)),
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
                          Text(
                            "${cat.length} cm",
                            style: TextStyle(fontSize: 18.sp),
                          ),
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
                          Text(
                            cat.insuranceProvider ?? "",
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
                            "Insurance number",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            cat.insuranceNumber ?? "",
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
