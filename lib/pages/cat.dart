import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:image_picker/image_picker.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:purr_time/apis/cats.dart';
import 'package:purr_time/components/notiferDatetimeInputField.dart';
import 'package:purr_time/components/notifierInputField.dart';
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
  String name = "";
  ValueNotifier<String> nameNotifier = ValueNotifier<String>("");

  String gender = "Male";

  String catPhoto = "";

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

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final FocusNode _codeFocusNode = FocusNode();

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

    _codeFocusNode.addListener(() {
      if (!_codeFocusNode.hasFocus) {
        _formKey.currentState?.validate();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    nameNotifier.dispose();
    birthNotifier.dispose();
    weightNotifier.dispose();
    breedNotifier.dispose();
    lengthNotifier.dispose();
    insuranceProviderNotifier.dispose();
    insuranceNumberNotifier.dispose();
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();

    _codeController.dispose();
    _codeFocusNode.dispose();
    _formKey.currentState?.dispose();
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
      nameNotifier.value = name;

      gender = res.gender;

      catPhoto = res.image;

      birth = res.birth.toString();
      birthNotifier.value = birth;

      weight = res.weight.toString();
      weightNotifier.value = weight;

      breed = res.breed;
      breedNotifier.value = breed;

      if (res.length != null) {
        length = res.length.toString();
      } else {
        length = "";
      }
      lengthNotifier.value = length;

      insuranceProvider = res.insuranceNumber ?? "";
      insuranceProviderNotifier.value = insuranceProvider;

      insuranceNumber = res.insuranceNumber ?? "";
      insuranceNumberNotifier.value = insuranceNumber;
    });
  }

  _handleButtonPress() {
    if (name.isEmpty) {
      Get.snackbar("Error", "Please enter cat name");
      return;
    }

    if (catPhoto.isEmpty) {
      Get.snackbar("Error", "Please select cat photo");
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
          name: name,
          image: catPhoto,
          gender: gender,
          breed: breed,
          birth: DateFormat("yyyy-MM-dd HH:mm").parse(birth, true).toLocal(),
          length: length.isEmpty ? null : double.parse(length),
          weight: double.parse(weight),
          insuranceProvider: insuranceProvider,
          insuranceNumber: insuranceNumber,
        ),
      );

      CatController.to.addCat(cat);

      if (Get.arguments == null) {
        Get.offAllNamed("/");
      } else {
        Get.back();
      }
    } catch (e) {
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
          name: name,
          image: catPhoto,
          gender: gender,
          breed: breed,
          birth: DateFormat("yyyy-MM-dd HH:mm").parse(birth, true).toLocal(),
          length: length.isEmpty ? null : double.parse(length),
          weight: double.parse(weight),
          insuranceProvider: insuranceProvider,
          insuranceNumber: insuranceNumber,
        ),
      );

      CatController.to.updateCat(cat);
      Get.back();
    } catch (e) {
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
    return null;
  }

  _addCatByCode(dynamic arguments) async {
    try {
      if (_formKey.currentState?.validate() != true) {
        return;
      }

      Get.back();

      CatDto cat = await CatsApi.addCatByCode(_codeController.text);

      CatController.to.addCat(cat);
      if (arguments == null) {
        Get.offAllNamed("/");
      } else {
        Get.back();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to add cat. Please try again.");
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
                        maximumDate: DateTime.now(),
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

                    // Cat gender
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(
                        top: 10.h,
                        // bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      width: double.infinity,
                      // height: 65.h,
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
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      value: "Male",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                    ),
                                    const Text("Male"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      value: "Female",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                    ),
                                    const Text("Female"),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          disabledBackgroundColor: Colors.black.withOpacity(.3),
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
                  key: _formKey,
                  child: CustomInputField(
                    controller: _codeController,
                    focusNode: _codeFocusNode,
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
