import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
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

  final _calendarController = AdvancedCalendarController.today();

  final events = <DateTime>[DateTime.now(), DateTime(2022, 10, 10)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Purr Time"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
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
                SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
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
                        );
                      },
                    ),
                  ),
                ),
                // SizedBox(
                //   width: double.infinity,
                //   height: 30.h,
                //   child: Center(
                //     child: ListView.builder(
                //       itemCount: categories.length,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return Padding(
                //           padding: EdgeInsets.only(right: 20.w),
                //           child: Text(
                //             categories[index],
                //             style: TextStyle(
                //               fontSize: 22.sp,
                //               color:
                //                   selectedCategory == categories[index]
                //                       ? Color.fromRGBO(68, 55, 47, 1)
                //                       : Color.fromRGBO(163, 145, 132, 1),
                //               fontWeight:
                //                   selectedCategory == categories[index]
                //                       ? FontWeight.bold
                //                       : FontWeight.normal,
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
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
                    // margin:
                    //     index == 9
                    //         ? EdgeInsets.only(bottom: 100.h)
                    //         : EdgeInsets.only(bottom: 10.h),
                    // width: double.infinity,
                    // height: 80.h,
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   borderRadius: BorderRadius.circular(10.r),
                    // ),
                    // child: Padding(
                    //   padding: EdgeInsets.all(8),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(
                    //         width: 60.w,
                    //         height: 60.h,
                    //         decoration: BoxDecoration(
                    //           color: Colors.pink,
                    //           borderRadius: BorderRadius.circular(50.r),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Padding(
                    //           padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
