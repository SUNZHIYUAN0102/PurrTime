import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Recipes'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.black,
          ),
        ],
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 90.h,
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 10.h,
              bottom: 10.h,
            ),
            decoration: BoxDecoration(color: Colors.white),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 14,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      index == 13
                          ? EdgeInsets.only(right: 0)
                          : EdgeInsets.only(right: 10.w),
                  padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: index == 0 ? Color(0xFFFBE7AC) : Colors.grey[200],
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("16", style: TextStyle(fontSize: 14.sp)),
                      Text("Sun", style: TextStyle(fontSize: 14.sp)),
                      index == 2
                          ? Text("●", style: TextStyle(fontSize: 14.sp))
                          : Text(" ", style: TextStyle(fontSize: 14.sp)),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10.h),
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
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
