import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:purr_time/apis/cats.dart';
import 'package:purr_time/apis/records.dart';
import 'package:purr_time/store/cat.dart';
import 'package:purr_time/store/user.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = "Daily";

  final _calendarController = AdvancedCalendarController.today();

  final events = <DateTime>[DateTime.now()];

  late CatDto _selectedCat;

  late List<RecordDto> _records = [];

  DateTime _selectedDate = DateTime.now();

  toRecordPage() {
    Get.toNamed("/record");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _calendarController.addListener(() {
      _switchSelectedDate(_calendarController.value);
    });

    _getUserCats();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  _getUserCats() async {
    List<CatDto> res = await CatsApi.getUserCats();

    CatController.to.setCatList(res);

    setState(() {
      _selectedCat = CatController.to.catList[0];
    });

    _findRecordsByCatIdAndDate();
  }

  _switchSelectedCat(CatDto cat) {
    setState(() {
      _selectedCat = cat;
    });

    _findRecordsByCatIdAndDate();
  }

  _findRecordsByCatIdAndDate() async {
    List<RecordDto> res = await RecordsApi.findRecordsByCatIdAndDate(
      _selectedCat.id,
      date: _selectedDate.toString(),
    );

    setState(() {
      _records = res;
    });
  }

  _switchSelectedDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });

    _findRecordsByCatIdAndDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: double.infinity,
        leading: Obx(() {
          return Row(
            spacing: 10.w,
            children: [
              Container(
                margin: EdgeInsets.only(left: 16.w),
                decoration: BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.hardEdge,
                child: Image.network(UserController.to.user["avatar"]!),
              ),
              Text(
                "Welcome, ${UserController.to.user["username"]!}",
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
            ],
          );
        }),
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
                    child: Obx(() {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: CatController.to.catList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              _switchSelectedCat(
                                CatController.to.catList[index],
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10.w),
                              width: 55.w,
                              height: 55.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      _selectedCat.id ==
                                              CatController.to.catList[index].id
                                          ? Color.fromRGBO(249, 229, 172, 1)
                                          : Colors.grey,
                                  width: 2.w,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    CatController.to.catList[index].image ?? "",
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
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _records.length,
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
                          DateFormat("hh:mm").format(_records[index].date),
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
