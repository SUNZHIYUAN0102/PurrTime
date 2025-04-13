import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:purr_time/apis/records.dart';
import 'package:purr_time/store/cat.dart';
import 'package:purr_time/swagger_generated_code/api_json.enums.swagger.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class RecordManagement extends StatefulWidget {
  const RecordManagement({super.key});

  @override
  State<RecordManagement> createState() => _RecordManagementState();
}

class _RecordManagementState extends State<RecordManagement> {
  late CreateRecordDtoCatalogue catalogue;
  String name = "";

  String dateTime = "";
  String amount = "";

  setDateTime(String value) {
    setState(() {
      dateTime = value;
    });
  }

  setAmount(String value) {
    setState(() {
      amount = value;
    });
  }

  submitRecord() async {
    RecordDto res = await RecordsApi.createRecord(
      CreateRecordDto(
        catalogue: catalogue,
        name: name,
        date: DateTime.parse(dateTime),
        $value: double.parse(amount),
        catId: CatController.to.homeSelectedCat.value!.id,
      ),
    );

    Get.back();
  }

  final TextEditingController _inputController = TextEditingController(
    text: "",
  );

  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    catalogue = Get.arguments["catalogue"];
    name = Get.arguments["name"];

    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_scrollController.offset > 10 && !_showTitle) {
      setState(() {
        _showTitle = true;
      });
    } else if (_scrollController.offset <= 10 && _showTitle) {
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              _showTitle ? "Add record" : "",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            floating: false,
            pinned: true,
            backgroundColor: Colors.grey[100],
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add record",
                          style: TextStyle(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                            image: DecorationImage(
                              image: NetworkImage(
                                CatController.to.homeSelectedCat.value!.image!,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
                      child: Text(
                        "Record information",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      width: double.infinity,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Catalogue",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            catalogue.value.toString()[0].toUpperCase() +
                                catalogue.value.toString().substring(1),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      width: double.infinity,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(name, style: TextStyle(fontSize: 18.sp)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        setDateTime(
                          DateFormat(
                            "yyyy-MM-dd HH:mm",
                          ).format(DateTime.now()).toString(),
                        );
                        await showBoardDateTimePicker(
                          context: context,
                          pickerType: DateTimePickerType.datetime,
                          onChanged: (p0) {
                            setDateTime(
                              DateFormat(
                                "yyyy-MM-dd HH:mm",
                              ).format(p0).toString(),
                            );
                          },
                          customCloseButtonBuilder: (
                            context,
                            isModal,
                            onClose,
                          ) {
                            return IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                if (isModal) {
                                  Navigator.pop(context);
                                }
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                          left: 20.w,
                          right: 20.w,
                        ),
                        width: double.infinity,
                        height: 65.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Date & Time",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(dateTime, style: TextStyle(fontSize: 18.sp)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 25.h),
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      width: double.infinity,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Amount",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          TextField(
                            controller: _inputController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              setAmount(value);
                            },
                          ),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      onPressed: submitRecord,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black,
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: Center(
                          child: Text(
                            "Add Record",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
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
