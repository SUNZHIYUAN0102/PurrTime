import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            height: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Record",
                  style: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  child: TabBar(
                    controller: _tabController,
                    tabs: [Tab(text: "Daily"), Tab(text: "Expense")],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 10.h,
              bottom: 10.h,
            ),
            child: Wrap(
              spacing: 10.75.w,
              runSpacing: 10.75.h,
              children: [
                Column(
                  spacing: 5.h,
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.pest_control_rodent_outlined,
                        color: Colors.grey[800],
                        size: 35.sp,
                      ),
                    ),
                    Text("Food", style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
                Column(
                  spacing: 5.h,
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.water_drop_outlined,
                        color: Colors.grey[800],
                        size: 35.sp,
                      ),
                    ),
                    Text("Water", style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
                Column(
                  spacing: 5.h,
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.cleaning_services_outlined,
                        color: Colors.grey[800],
                        size: 35.sp,
                      ),
                    ),
                    Text("Clean", style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
                Column(
                  spacing: 5.h,
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.monitor_weight_outlined,
                        color: Colors.grey[800],
                        size: 35.sp,
                      ),
                    ),
                    Text("Weight", style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.directions_transit),
        ],
      ),
    );
  }
}
