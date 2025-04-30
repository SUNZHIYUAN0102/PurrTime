import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:purr_time/apis/cats.dart';
import 'package:purr_time/apis/records.dart';
import 'package:purr_time/main.dart';
import 'package:purr_time/pages/records/record.dart';
import 'package:purr_time/store/cat.dart';
import 'package:purr_time/store/user.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with RouteAware {
  final _calendarController = AdvancedCalendarController.today();

  final events = <DateTime>[DateTime.now()];

  late List<RecordDto> _records = [];

  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _calendarController.addListener(() {
      _switchSelectedDate(_calendarController.value);
    });

    _getUserCats();

    CatController.to.homeSelectedCat.listen((cat) {
      if (cat != null) {
        _findRecordsByCatIdAndDate();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    _calendarController.dispose();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    _findRecordsByCatIdAndDate();
  }

  _toRecordPage() {
    Get.toNamed("/record");
  }

  _getUserCats() async {
    List<CatDto> res = await CatsApi.getUserCats();

    if (res.isNotEmpty) {
      CatController.to.setCatList(res);

      CatController.to.setHomeSelectedCat(res[0]);

      CatController.to.setProfileSelectedCat(res[0]);
    }
  }

  _switchSelectedCat(CatDto cat) {
    CatController.to.setHomeSelectedCat(cat);
  }

  _findRecordsByCatIdAndDate() async {
    if (CatController.to.homeSelectedCat.value != null) {
      List<RecordDto> res = await RecordsApi.findRecordsByCatIdAndDate(
        CatController.to.homeSelectedCat.value!.id,
        date: _selectedDate.toString(),
      );

      setState(() {
        _records = res;
      });
    }
  }

  _switchSelectedDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });

    _findRecordsByCatIdAndDate();
  }

  _deleteRecord(RecordDto record) async {
    await RecordsApi.deleteRecord(record.id);
    setState(() {
      _records.remove(record);
    });
  }

  _toRecordManagementPage(RecordDto record) {
    Get.toNamed("/recordManagement", arguments: {"record": record});
  }

  @override
  Widget build(BuildContext context) {
    return FloatingDraggableWidget(
      floatingWidget: FloatingActionButton(
        //circle
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        onPressed: _toRecordPage,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingWidgetHeight: 50.w,
      floatingWidgetWidth: 50.h,
      dx: 309.w,
      dy: 650.h,
      mainScreenWidget: Scaffold(
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
                  child: Image.network(UserController.to.user.value!.avatar!),
                ),
                Text(
                  "Welcome, ${UserController.to.user.value!.email}",
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
                                        CatController
                                                    .to
                                                    .homeSelectedCat
                                                    .value!
                                                    .id ==
                                                CatController
                                                    .to
                                                    .catList[index]
                                                    .id
                                            ? Color.fromRGBO(249, 229, 172, 1)
                                            : Colors.grey,
                                    width: 2.w,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      CatController.to.catList[index].image ??
                                          "",
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
              child:
                  _records.isNotEmpty
                      ? _renderRecordList()
                      : _renderEmptyWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderRecordList() {
    return ListView.builder(
      itemCount: _records.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(
            bottom: index == _records.length - 1 ? 180.h : 0,
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    _deleteRecord(_records[index]);
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_outline_outlined,
                  label: "Delete",
                ),
              ],
            ),

            child: InkWell(
              onTap: () {
                _toRecordManagementPage(_records[index]);
              },
              child: Container(
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
                        DateFormat("HH:mm").format(_records[index].date),
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
                                child: Icon(
                                  getRecordIcon(_records[index].name),
                                  color: Colors.grey[800],
                                  size: 20.sp,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _records[index].name,
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  Text(
                                    _records[index].catalogue.value
                                            .toString()[0]
                                            .toUpperCase() +
                                        _records[index].catalogue.value
                                            .toString()
                                            .substring(1),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            _records[index].$value.toString(),
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _renderEmptyWidget() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 150.w,
            height: 150.h,
            margin: EdgeInsets.only(top: 120.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/empty.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "No records found",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
