import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = "Daily";

  final _calendarController = AdvancedCalendarController.today();

  final events = <DateTime>[DateTime.now(), DateTime(2022, 10, 10)];

  toRecordPage() {
    Get.toNamed("/record");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Purr Time"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.h),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdvancedCalendar(
                  controller: _calendarController,
                  events: events,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  width: double.infinity,
                  height: 55.h,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: toRecordPage,
                          child: Container(
                            margin: EdgeInsets.only(right: 10.w),
                            width: 55.w,
                            height: 55.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    index == 0
                                        ? Color.fromRGBO(249, 229, 172, 1)
                                        : Colors.grey,
                                width: 2.w,
                              ),
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
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[200]!, width: 1.w),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 10.h,
                      bottom: 10.h,
                    ),
                    child: Column(
                      spacing: 5.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "13:20",
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  width: 35.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[200],
                                  ),
                                ),
                                Text("Food", style: TextStyle(fontSize: 14.sp)),
                              ],
                            ),
                            Text("200g", style: TextStyle(fontSize: 14.sp)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
