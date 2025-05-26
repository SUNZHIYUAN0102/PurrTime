import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:purr_time/pages/navigations/activities/components/weeklyCalendar.dart';
import 'package:timelines_plus/timelines_plus.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
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
              child: FixedTimeline.tileBuilder(
                builder: TimelineTileBuilder.connected(
                  contentsAlign: ContentsAlign.alternating,
                  contentsBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index % 2 == 0 ? 15.w : 0,
                        right: index % 2 == 0 ? 0 : 15.w,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.grey[200],
                        ),
                        child: Padding(padding: EdgeInsets.symmetric()),
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
                  itemCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
