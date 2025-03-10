import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //categories list
  List<String> categories = ["Daily", "Expense", "Weight"];

  String selectedCategory = "Daily";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(color: Color.fromRGBO(249, 229, 172, 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 80.h,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Row(
                          spacing: 5.w,

                          children: [
                            Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                            ),

                            Text("Ginger", style: TextStyle(fontSize: 16.sp)),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 30.h,
                  child: Center(
                    child: ListView.builder(
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              fontSize: 22.sp,
                              color:
                                  selectedCategory == categories[index]
                                      ? Color.fromRGBO(68, 55, 47, 1)
                                      : Color.fromRGBO(163, 145, 132, 1),
                              fontWeight:
                                  selectedCategory == categories[index]
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        index == 9
                            ? EdgeInsets.only(bottom: 100.h)
                            : EdgeInsets.only(bottom: 10.h),
                    width: double.infinity,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
