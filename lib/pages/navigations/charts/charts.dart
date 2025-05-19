import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:purr_time/apis/charts.dart';
import 'package:purr_time/pages/navigations/charts/components/expenseRanking.dart';
import 'package:purr_time/pages/navigations/charts/components/weightChart.dart';
import 'package:purr_time/store/cat.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getRecordsTimeList();
  }

  String timeType = "Month";

  List<String> timeList = [];
  List<ExpenseDto> expenseRecords = [];
  List<WeightDto> weightRecords = [];

  String currTime = "";

  void _getRecordsTimeList() async {
    try {
      if (timeType == "Month") {
        timeList = await ChartsApi.getRecordMonth(
          CatController.to.chartSelectedCat.value!.id,
        );

        setState(() {
          timeList = timeList;
        });

        _setCurrTime(timeList[timeList.length - 1]);
      } else {
        timeList = await ChartsApi.getRecordYear(
          CatController.to.chartSelectedCat.value!.id,
        );

        setState(() {
          timeList = timeList;
        });

        _setCurrTime(timeList[timeList.length - 1]);
      }
    } catch (e) {
      print("Error in get reocrd time: $e");
    }
  }

  void _setCurrTime(String time) {
    setState(() {
      currTime = time;
    });

    if (timeType == "Month") {
      _getCatMonthlyWeightRecords();
      _getCatMonthlyExpenseRecords();
    } else {
      _getCatYearlyWeightRecords();
      _getCatYearlyExpenseRecords();
    }
  }

  void _changeTimeType(String type) {
    setState(() {
      timeType = type;
    });

    _getRecordsTimeList();
  }

  void _setChartSelectedCat(CatDto cat) {
    CatController.to.setChartSelectedCat(cat);

    if (timeType == "Month") {
      _getCatMonthlyWeightRecords();
      _getCatMonthlyExpenseRecords();
    } else {
      _getCatYearlyWeightRecords();
      _getCatYearlyExpenseRecords();
    }
  }

  void _getCatMonthlyWeightRecords() async {
    try {
      weightRecords = await ChartsApi.getCatMonthlyWeightRecords(
        CatController.to.chartSelectedCat.value!.id,
        currTime.split("-")[0],
        currTime.split("-")[1],
      );

      setState(() {
        weightRecords = weightRecords;
      });
    } catch (e) {
      print("Error in get reocrd month: $e");
    }
  }

  void _getCatMonthlyExpenseRecords() async {
    try {
      expenseRecords = await ChartsApi.getCatMonthlyExpenseRecords(
        CatController.to.chartSelectedCat.value!.id,
        currTime.split("-")[0],
        currTime.split("-")[1],
      );

      setState(() {
        expenseRecords = expenseRecords;
      });
    } catch (e) {
      print("Error in get reocrd month: $e");
    }
  }

  void _getCatYearlyWeightRecords() async {
    try {
      weightRecords = await ChartsApi.getCatYearlyWeightRecords(
        CatController.to.chartSelectedCat.value!.id,
        currTime,
      );

      setState(() {
        weightRecords = weightRecords;
      });
    } catch (e) {
      print("Error in get reocrd month: $e");
    }
  }

  void _getCatYearlyExpenseRecords() async {
    try {
      expenseRecords = await ChartsApi.getCatYearlyExpenseRecords(
        CatController.to.chartSelectedCat.value!.id,
        currTime,
      );

      setState(() {
        expenseRecords = expenseRecords;
      });
    } catch (e) {
      print("Error in get reocrd month: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Container(
          width: 170.w,
          height: 42.h,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.w),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _changeTimeType("Month");
                  },
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: timeType == "Month" ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.r),
                        bottomLeft: Radius.circular(50.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Month",
                        style: TextStyle(
                          color:
                              timeType == "Month" ? Colors.white : Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _changeTimeType("Year");
                  },
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: timeType == "Year" ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.r),
                        bottomRight: Radius.circular(50.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Year",
                        style: TextStyle(
                          color:
                              timeType == "Year" ? Colors.white : Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            width: double.infinity,
            height: 45.w,
            child: Obx(() {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CatController.to.catList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _setChartSelectedCat(CatController.to.catList[index]);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      width: 45.w,
                      height: 45.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              CatController.to.chartSelectedCat.value?.id ==
                                      CatController.to.catList[index].id
                                  ? Color.fromRGBO(249, 229, 172, 1)
                                  : Colors.grey,
                          width: 2.w,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            CatController.to.catList[index].image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15.h),
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[300]!, width: 1.w),
                bottom: BorderSide(color: Colors.grey[300]!, width: 1.w),
              ),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: timeList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _setCurrTime(timeList[index]);
                  },
                  child: Container(
                    width: 80.w,
                    alignment: Alignment.center,
                    child: Text(
                      timeList[index],
                      style: TextStyle(
                        fontSize: 14.sp,
                        color:
                            timeList[index] == currTime
                                ? Colors.black
                                : Colors.grey[400],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  spacing: 20.h,
                  children: [
                    WeightChart(
                      weightRecords: weightRecords,
                      timeType: timeType,
                    ),
                    ExpenseRanking(expenseRecords: expenseRecords),
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
