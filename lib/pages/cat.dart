import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:purr_time/apis/cats.dart';
import 'package:purr_time/components/notiferDatetimeInputField.dart';
import 'package:purr_time/components/notifierInputField.dart';
import 'package:purr_time/store/cat.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  String name = "";
  ValueNotifier<String> nameNotifier = ValueNotifier<String>("");

  String gender = "Male";

  String birth = "";
  ValueNotifier<String> birthNotifier = ValueNotifier<String>("");

  String weight = "";
  ValueNotifier<String> weightNotifier = ValueNotifier<String>("");

  String breed = "";
  ValueNotifier<String> breedNotifier = ValueNotifier<String>("");

  String length = "";
  ValueNotifier<String> lengthNotifier = ValueNotifier<String>("");

  String insuranceProvider = "";
  ValueNotifier<String> insuranceProviderNotifier = ValueNotifier<String>("");

  String insuranceNumber = "";
  ValueNotifier<String> insuranceNumberNotifier = ValueNotifier<String>("");

  bool isEdit = false;
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Get.arguments["catId"] != null) {
      final catId = Get.arguments["catId"];
      isEdit = true;
      _getCatById(catId);
    }

    nameNotifier.addListener(() {
      setState(() {
        name = nameNotifier.value;
      });
    });

    birthNotifier.addListener(() {
      setState(() {
        birth = birthNotifier.value;
      });
    });

    weightNotifier.addListener(() {
      setState(() {
        weight = weightNotifier.value;
      });
    });

    breedNotifier.addListener(() {
      setState(() {
        breed = breedNotifier.value;
      });
    });

    lengthNotifier.addListener(() {
      setState(() {
        length = lengthNotifier.value;
      });
    });

    insuranceProviderNotifier.addListener(() {
      setState(() {
        insuranceProvider = insuranceProviderNotifier.value;
      });
    });

    insuranceNumberNotifier.addListener(() {
      setState(() {
        insuranceNumber = insuranceNumberNotifier.value;
      });
    });

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

  _getCatById(catId) async {
    CatDto res = await CatsApi.getCatById(catId);

    setState(() {
      name = res.name;
      nameNotifier.value = res.name;

      birth = res.birth.toString();
      birthNotifier.value = res.birth.toString();

      weight = res.weight.toString();
      weightNotifier.value = res.weight.toString();

      breed = res.breed;
      breedNotifier.value = res.breed;

      length = res.length.toString();
      lengthNotifier.value = res.length.toString();

      insuranceProvider = res.insuranceNumber ?? "";
      insuranceProviderNotifier.value = res.insuranceProvider ?? "";

      insuranceNumber = res.insuranceNumber ?? "";
      insuranceNumberNotifier.value = res.insuranceNumber ?? "";
    });
  }

  _handleButtonPress() {
    if (name.isEmpty) {
      Get.snackbar("Error", "Please enter cat name");
      return;
    }

    if (birth.isEmpty) {
      Get.snackbar("Error", "Please enter cat birth date");
      return;
    }

    if (weight.isEmpty) {
      Get.snackbar("Error", "Please enter cat weight");
      return;
    }

    if (breed.isEmpty) {
      Get.snackbar("Error", "Please enter cat breed");
      return;
    }

    if (gender.isEmpty) {
      Get.snackbar("Error", "Please enter cat gender");
      return;
    }

    if (isEdit) {
      _updateCat();
    } else {
      _addCat();
    }

    Get.back();
  }

  _addCat() async {
    CatDto cat = await CatsApi.createCat(
      CreateCatDto(
        name: name,
        gender: gender,
        breed: breed,
        birth: DateFormat("yyyy-MM-dd HH:mm").parse(birth, true).toLocal(),
        length: double.parse(length),
        weight: double.parse(weight),
        insuranceProvider: insuranceProvider,
        insuranceNumber: insuranceNumber,
      ),
    );

    CatController.to.addCat(cat);
  }

  _updateCat() async {
    CatDto cat = await CatsApi.updateCat(
      Get.arguments["catId"],
      UpdateCatDto(
        name: name,
        gender: gender,
        breed: breed,
        birth: DateFormat("yyyy-MM-dd HH:mm").parse(birth, true).toLocal(),
        length: double.parse(length),
        weight: double.parse(weight),
        insuranceProvider: insuranceProvider,
        insuranceNumber: insuranceNumber,
      ),
    );

    CatController.to.updateCat(cat);
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
              _showTitle ? (isEdit ? "Edit cat" : "Add cat") : "",
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
                          isEdit ? "Edit cat" : "Add cat",
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
                          ),
                        ),
                      ],
                    ),
                    // Cat information
                    Container(
                      margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
                      child: Text(
                        "Cat information",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    // Cat name
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: NotifierInputField(
                        label: "Name*",
                        notifier: nameNotifier,
                        keyboardType: TextInputType.text,
                        hintText: "Enter cat name",
                      ),
                    ),

                    // Cat birth date
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: NotiferDateTimeInputField(
                        label: "Date of birth*",
                        notifier: birthNotifier,
                        formatRule: "MMM d, y",
                        pickerType: DateTimePickerType.date,
                      ),
                    ),

                    // Cat weight
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: NotifierInputField(
                        label: "Weight*",
                        notifier: weightNotifier,
                        keyboardType: TextInputType.text,
                        hintText: "Enter cat weight",
                      ),
                    ),

                    // Cat breed
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: NotifierInputField(
                        label: "Breed*",
                        notifier: breedNotifier,
                        keyboardType: TextInputType.text,
                        hintText: "Enter cat breed",
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
                            "Gender*",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text("Male", style: TextStyle(fontSize: 18.sp)),
                        ],
                      ),
                    ),

                    //Cat length
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: NotifierInputField(
                        label: "Length (centimeters)",
                        notifier: lengthNotifier,
                        keyboardType: TextInputType.number,
                        hintText: "Enter cat length",
                      ),
                    ),

                    // Insurance information
                    Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Text(
                        "Insurance information",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: NotifierInputField(
                        label: "Insurance provider",
                        notifier: insuranceProviderNotifier,
                        keyboardType: TextInputType.text,
                        hintText: "Enter insurance provider",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: NotifierInputField(
                        label: "Insurance number",
                        notifier: insuranceNumberNotifier,
                        keyboardType: TextInputType.text,
                        hintText: "Enter insurance number",
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: ElevatedButton(
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
                              isEdit ? "Update cat" : "Add cat",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
