import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:purr_time/apis/records.dart';
import 'package:purr_time/components/customDateTimeFormField.dart';
import 'package:purr_time/components/customInputFormField.dart';
import 'package:purr_time/store/cat.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class RecordManagement extends StatefulWidget {
  const RecordManagement({super.key});

  @override
  State<RecordManagement> createState() => _RecordManagementState();
}

class _RecordManagementState extends State<RecordManagement> {
  late RecordDto record;
  String catalogue = "";
  String name = "";
  String dateTime = "";

  String amount = "";
  String unit = "";
  bool isEdit = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController catalogueController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController unitController = TextEditingController();

  TextEditingController dateTimeController = TextEditingController();

  _submitRecord() async {
    RecordDto res = await RecordsApi.createRecord(
      CatController.to.homeSelectedCat.value!.id,
      CreateRecordDto(
        catalogue:
            catalogue == "Daily"
                ? CreateRecordDtoCatalogue.daily
                : CreateRecordDtoCatalogue.expense,
        name: name,
        date:
            DateFormat(
              "yyyy-MM-dd HH:mm",
            ).parse(dateTimeController.text, false).toUtc(),
        $value: double.parse(amountController.text),
        unit: unitController.text,
      ),
    );

    Get.back();
  }

  _updateRecord() async {
    RecordDto res = await RecordsApi.updateRecord(
      record.id,
      UpdateRecordDto(
        catalogue:
            catalogue == "Daily"
                ? UpdateRecordDtoCatalogue.daily
                : UpdateRecordDtoCatalogue.expense,
        name: name,
        date:
            DateFormat(
              "yyyy-MM-dd HH:mm",
            ).parse(dateTimeController.text, false).toUtc(),
        $value: double.parse(amountController.text),
        unit: unitController.text,
      ),
    );

    Get.back();
  }

  _handleButtonPress() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (isEdit) {
      _updateRecord();
    } else {
      _submitRecord();
    }
  }

  bool _showTitle = false;
  final ScrollController _scrollController = ScrollController();
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
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Get.arguments["record"] is RecordDto) {
      record = Get.arguments["record"];
      catalogue =
          record.catalogue.value.toString()[0].toUpperCase() +
          record.catalogue.value.toString().substring(1);
      name = record.name.toString();
      dateTime = DateFormat("yyyy-MM-dd HH:mm").format(record.date);
      amount = record.$value.toString();
      unit = record.unit;
      isEdit = true;
    } else {
      catalogue = Get.arguments["catalogue"];
      name = Get.arguments["name"];
      unit = Get.arguments["unit"];
    }

    _scrollController.addListener(_handleScroll);

    catalogueController.text = catalogue;
    nameController.text = name;
    amountController.text = amount;
    unitController.text = unit;
    dateTimeController.text = dateTime;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();

    catalogueController.dispose();
    nameController.dispose();
    amountController.dispose();
    unitController.dispose();
    dateTimeController.dispose();
  }

  String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter an amount";
    }
    if (double.tryParse(value) == null) {
      return "Please enter a valid number";
    }
    return null;
  }

  String? validateDateTime(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a date and time";
    }
    return null;
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
              _showTitle ? (isEdit ? "Edit record" : "Add record") : "",
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
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isEdit ? "Edit record" : "Add record",
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
                                  CatController
                                      .to
                                      .homeSelectedCat
                                      .value!
                                      .image!,
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
                        child: CustomInputFormField(
                          label: "Catalogue",
                          controller: catalogueController,
                          enabled: false,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: CustomInputFormField(
                          label: "Name",
                          controller: nameController,
                          enabled: false,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: CustomDateTimeInputFormField(
                          label: "Date & Time",
                          controller: dateTimeController,
                          validator: validateDateTime,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: CustomInputFormField(
                          label: "Amount",
                          controller: amountController,
                          validator: validateAmount,
                          keyboardType: TextInputType.number,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 25.h),
                        child: CustomInputFormField(
                          enabled: false,
                          label: "Unit",
                          controller: unitController,
                        ),
                      ),

                      ElevatedButton(
                        onPressed: _handleButtonPress,
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
                              isEdit ? "Update record" : "Add record",
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
          ),
        ],
      ),
    );
  }
}
