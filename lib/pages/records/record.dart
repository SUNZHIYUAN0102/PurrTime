import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class RecordItem {
  final IconData icon;
  final String name;
  final String unit;

  RecordItem({required this.icon, required this.name, required this.unit});
}

IconData getRecordIcon(String name) {
  switch (name) {
    case "Food":
      return Icons.pest_control_rodent_outlined;
    case "Water":
      return Icons.water_drop_outlined;
    case "Clean":
      return Icons.cleaning_services_outlined;
    case "Weight":
      return Icons.monitor_weight_outlined;
    case "Litter":
      return Icons.emoji_nature_outlined;
    case "Vaccinations":
      return Icons.vaccines_outlined;
    case "Supplies":
      return Icons.toys_outlined;
    case "Medical":
      return Icons.medical_information_outlined;
    case "Grooming":
      return Icons.spa_outlined;
    default:
      return Icons.question_mark_rounded;
  }
}

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> with TickerProviderStateMixin {
  late final TabController _tabController;

  final List<RecordItem> _dailyRecordItems = [
    RecordItem(
      icon: Icons.pest_control_rodent_outlined,
      name: "Food",
      unit: "g",
    ),
    RecordItem(icon: Icons.water_drop_outlined, name: "Water", unit: "ml"),
    RecordItem(
      icon: Icons.cleaning_services_outlined,
      name: "Clean",
      unit: "times",
    ),
    RecordItem(icon: Icons.monitor_weight_outlined, name: "Weight", unit: "kg"),
  ];

  final List<RecordItem> _expenseRecordItems = [
    RecordItem(
      icon: Icons.pest_control_rodent_outlined,
      name: "Food",
      unit: "euros",
    ),
    RecordItem(
      icon: Icons.emoji_nature_outlined,
      name: "Litter",
      unit: "euros",
    ),
    RecordItem(
      icon: Icons.vaccines_outlined,
      name: "Vaccinations",
      unit: "euros",
    ),
    RecordItem(icon: Icons.toys_outlined, name: "Supplies", unit: "euros"),
    RecordItem(
      icon: Icons.medical_information_outlined,
      name: "Medical",
      unit: "euros",
    ),
    RecordItem(icon: Icons.spa_outlined, name: "Grooming", unit: "euros"),
  ];

  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.index == _tabController.animation?.value.round()) {
        setState(() {
          _currentTabIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toRecordManagement(RecordItem item) {
    Get.toNamed(
      "/recordManagement",
      arguments: {
        "catalogue": _currentTabIndex == 0 ? "Daily" : "Expense",
        "name": item.name,
        "unit": item.unit,
      },
    );
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
              children: _renderRecordItems(
                _dailyRecordItems,
                toRecordManagement,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 10.h,
              bottom: 10.h,
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 10.75.h,
              children: _renderRecordItems(
                _expenseRecordItems,
                toRecordManagement,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_renderRecordItems(List<RecordItem> items, Function toRecordManagement) {
  return items.map((item) {
    return Column(
      spacing: 5.h,
      children: [
        InkWell(
          onTap: () {
            toRecordManagement(item);
          },
          child: Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: Colors.grey[800], size: 35.sp),
          ),
        ),
        Text(item.name, style: TextStyle(fontSize: 14.sp)),
      ],
    );
  }).toList();
}
