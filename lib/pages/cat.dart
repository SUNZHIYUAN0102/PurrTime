import 'dart:io';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:purr_time/apis/cats.dart';
import 'package:purr_time/components/customDateTimeFormField.dart';
import 'package:purr_time/components/customDropdown.dart';
import 'package:purr_time/components/customInputFormField.dart';
import 'package:purr_time/pages/process/components/customInputField.dart';
import 'package:purr_time/store/cat.dart';
import 'package:purr_time/store/user.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';
import 'package:purr_time/utils/cloudinaryUploader.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  GlobalKey<FormState> _inputFormKey = GlobalKey<FormState>();
  String name = "";
  TextEditingController nameController = TextEditingController();

  String gender = "Male";

  String catPhoto = "";

  String birth = "";
  TextEditingController birthController = TextEditingController();

  String breed = "";
  TextEditingController breedController = TextEditingController();

  String insuranceProvider = "";
  TextEditingController insuranceProviderController = TextEditingController();

  String insuranceNumber = "";
  TextEditingController insuranceNumberController = TextEditingController();

  bool isEdit = false;
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  final _codeFormKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FlutterNativeSplash.remove(); // Remove the splash screen after initialization

    if (Get.arguments != null) {
      if (Get.arguments["catId"] != null) {
        final catId = Get.arguments["catId"];
        isEdit = true;
        _getCatById(catId);
      }
    }
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();

    _codeController.dispose();
    nameController.dispose();
    breedController.dispose();
    insuranceProviderController.dispose();
    insuranceNumberController.dispose();
    birthController.dispose();
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
      nameController.text = name;

      gender = res.gender;
      catPhoto = res.image;

      birth = DateFormat("MMM d, y").format(res.birth);
      birthController.text = birth;

      breed = res.breed;
      breedController.text = breed;

      insuranceProvider = res.insuranceNumber ?? "";
      insuranceProviderController.text = insuranceProvider;

      insuranceNumber = res.insuranceNumber ?? "";
      insuranceNumberController.text = insuranceNumber;
    });
  }

  _handleButtonPress() {
    if (!_inputFormKey.currentState!.validate()) {
      return;
    }

    if (catPhoto.isEmpty) {
      Get.snackbar("Error", "Please select cat photo");
      return;
    }

    if (isEdit) {
      _updateCat();
    } else {
      _addCat();
    }
  }

  _addCat() async {
    try {
      String? photoUrl = await CloudinaryUploader.uploadImage(
        file: File(catPhoto),
        folder: "/users/${UserController.to.user.value!.id}/cats",
      );

      if (photoUrl != null) {
        catPhoto = photoUrl;
      } else {
        Get.snackbar("Error", "Failed to upload cat photo. Please try again.");
        return;
      }

      CatDto cat = await CatsApi.createCat(
        CreateCatDto(
          name: nameController.text,
          image: catPhoto,
          gender: gender,
          breed: breedController.text,
          birth:
              DateFormat("MMM d, y").parse(birthController.text, false).toUtc(),
          insuranceProvider: insuranceProviderController.text,
          insuranceNumber: insuranceNumberController.text,
        ),
      );

      CatController.to.addCat(cat);

      if (Get.arguments == null) {
        print("registration part add cat");
        CatController.to.setHomeSelectedCat(cat);
        CatController.to.setChartSelectedCat(cat);
        CatController.to.setProfileSelectedCat(cat);
        Get.offAllNamed("/");
      } else {
        Get.back();
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to add cat. Please try again.");
    }
  }

  _updateCat() async {
    if (catPhoto.isNotEmpty && !catPhoto.startsWith("http")) {
      String? photoUrl = await CloudinaryUploader.uploadImage(
        file: File(catPhoto),
        folder: "/users/${UserController.to.user.value!.id}/cats",
      );

      if (photoUrl != null) {
        catPhoto = photoUrl;
      } else {
        Get.snackbar("Error", "Failed to upload cat photo. Please try again.");
        return;
      }
    }

    try {
      CatDto cat = await CatsApi.updateCat(
        Get.arguments["catId"],
        UpdateCatDto(
          name: nameController.text,
          image: catPhoto,
          gender: gender,
          breed: breedController.text,
          birth:
              DateFormat("MMM d, y").parse(birthController.text, false).toUtc(),
          insuranceProvider: insuranceProviderController.text,
          insuranceNumber: insuranceNumberController.text,
        ),
      );

      CatController.to.updateCat(cat);
      Get.back();
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to update cat. Please try again.");
    }
  }

  _pickImage() async {
    File file = await CloudinaryUploader.pickImageFromGallery() ?? File("");

    if (file.path.isNotEmpty) {
      setState(() {
        catPhoto = file.path;
      });
    }
  }

  _renderPhoto() {
    if (catPhoto.isNotEmpty) {
      if (catPhoto.startsWith("http")) {
        return Image.network(
          catPhoto,
          fit: BoxFit.cover,
          width: 60.w,
          height: 60.w,
        );
      } else {
        return Image.file(
          File(catPhoto),
          fit: BoxFit.cover,
          width: 60.w,
          height: 60.w,
        );
      }
    } else {
      return const Icon(Icons.camera_alt_outlined);
    }
  }

  String? _validateCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a code';
    }

    if (value.length < 6) {
      return 'Code must be at least 6 characters long';
    }
    return null;
  }

  _addCatByCode(dynamic arguments) async {
    try {
      if (_codeFormKey.currentState?.validate() != true) {
        return;
      }

      Get.back();

      CatDto cat = await CatsApi.addCatByCode(_codeController.text);

      CatController.to.addCat(cat);
      if (arguments == null) {
        CatController.to.setHomeSelectedCat(cat);
        CatController.to.setChartSelectedCat(cat);
        CatController.to.setProfileSelectedCat(cat);

        Get.offAllNamed("/");
      } else {
        Get.back();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to add cat. Please try again.");
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  String? _validateBreed(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a breed';
    }
    return null;
  }

  String? _validateBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a birth date';
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
              _showTitle ? (isEdit ? "Edit cat" : "Add cat") : "",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.qr_code_outlined),
                onPressed: () {
                  _dialogBuilder(context, Get.arguments);
                },
              ),
            ],
            floating: false,
            pinned: true,
            backgroundColor: Colors.grey[100],
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          SliverToBoxAdapter(
            child: Form(
              key: _inputFormKey,
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

                          GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              width: 60.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                              child: ClipOval(child: _renderPhoto()),
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
                        child: CustomInputFormField(
                          label: "Name*",
                          controller: nameController,
                          validator: _validateName,
                        ),
                      ),

                      // Cat birth date
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: CustomDateTimeInputFormField(
                          label: "Date of birth*",
                          controller: birthController,
                          formatRule: "MMM d, y",
                          pickerType: DateTimePickerType.date,
                          maximumDate: DateTime.now(),
                          validator: _validateBirth,
                        ),
                      ),

                      // Cat breed
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: CustomInputFormField(
                          label: "Breed*",
                          controller: breedController,
                          validator: _validateBreed,
                        ),
                      ),

                      // Cat gender
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: CustomDropdown(
                          label: "Gender*",
                          options: ["Male", "Female"],
                          initialValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
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
                        child: CustomInputFormField(
                          label: "Insurance provider",
                          controller: insuranceProviderController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: CustomInputFormField(
                          label: "Insurance number",
                          controller: insuranceNumberController,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: ElevatedButton(
                          onPressed: _handleButtonPress,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            disabledBackgroundColor: Colors.black.withOpacity(
                              .3,
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
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, dynamic arguments) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            height: 300.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter cat code",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h),
                Form(
                  key: _codeFormKey,
                  child: CustomInputField(
                    controller: _codeController,
                    hintText: "Enter cat code",
                    keyboardType: TextInputType.number,
                    validator: _validateCode,
                    maxlength: 6,
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    _addCatByCode(arguments);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: Center(
                      child: Text(
                        "Add cat",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
