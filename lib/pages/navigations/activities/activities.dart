import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:purr_time/pages/navigations/activities/components/weeklyCalendar.dart';
import 'package:timelines_plus/timelines_plus.dart';

class Activity {
  final String title;
  final String description;
  final DateTime date;

  Activity({
    required this.title,
    required this.description,
    required this.date,
  });
}

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  // for cats
  List<Activity> activities = [
    Activity(
      title: "Wake Up",
      description: "Wake up from 5 hours of sleep.",
      date: DateTime(2025, 5, 27, 6, 30),
    ),
    Activity(
      title: "Play",
      description: "Play with a toy for 30 minutes.",
      date: DateTime(2025, 5, 27, 7, 0),
    ),
    Activity(
      title: "Eat",
      description: "Eat breakfast for 15 minutes.",
      date: DateTime(2025, 5, 27, 7, 30),
    ),
    Activity(
      title: "Nap",
      description: "Take a nap for 2 hours.",
      date: DateTime(2025, 5, 27, 8, 0),
    ),
    Activity(
      title: "Groom",
      description: "Groom for 30 minutes.",
      date: DateTime(2025, 5, 27, 10, 0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat("MMMM dd, yyyy").format(DateTime.now()),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                "Today",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 10.h),
              child: WeeklyCalendar(
                initialDate: DateTime.now(),
                onDateSelected: (date) {},
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: FixedTimeline.tileBuilder(
                  theme: TimelineThemeData(nodePosition: 0),
                  builder: TimelineTileBuilder.connected(
                    contentsAlign: ContentsAlign.basic,
                    contentsBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          constraints: BoxConstraints(minHeight: 50.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.grey[200],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.h,
                              vertical: 10.h,
                            ),
                            child: Column(
                              spacing: 5.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      activities[index].title,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      DateFormat.jm().format(
                                        activities[index].date,
                                      ),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  activities[index].description,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },

                    indicatorBuilder: (context, index) {
                      return OutlinedDotIndicator(
                        size: 12.w,
                        color: Colors.blue,
                        borderWidth: 1.5.w,
                      );
                    },

                    connectorBuilder: (context, index, type) {
                      return SolidLineConnector(
                        color: Colors.blue,
                        space: 1.5.w,
                        indent: type == ConnectorType.start ? 0 : 4.h,
                        endIndent: type == ConnectorType.end ? 0 : 4.h,
                      );
                    },
                    itemCount: activities.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
