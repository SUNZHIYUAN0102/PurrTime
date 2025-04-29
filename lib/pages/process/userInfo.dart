import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:purr_time/apis/user.dart';
import 'package:purr_time/pages/process/components/customInputField.dart';
import 'package:purr_time/store/user.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class Userinfo extends StatefulWidget {
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final _usernameFieldKey = GlobalKey<FormFieldState>();

  final List<String> avatarList = [
    "https://res.cloudinary.com/dgakhptmh/image/upload/v1745967253/avatar1_wraaaj.jpg",
    "https://res.cloudinary.com/dgakhptmh/image/upload/v1745967252/avatar2_pfqedt.jpg",
    "https://res.cloudinary.com/dgakhptmh/image/upload/v1745967252/avatar3_xtspsn.jpg",
    "https://res.cloudinary.com/dgakhptmh/image/upload/v1745967252/avatar4_ryuqev.jpg",
    "https://res.cloudinary.com/dgakhptmh/image/upload/v1745967252/avatar5_qfkduy.jpg",
    "https://res.cloudinary.com/dgakhptmh/image/upload/v1745967251/avatar6_jkkghv.jpg",
    "https://res.cloudinary.com/dgakhptmh/image/upload/v1745967252/avatar7_vpgrz1.jpg",
    "https://res.cloudinary.com/dgakhptmh/image/upload/v1745967251/avatar8_hsrcqn.jpg",
    "https://res.cloudinary.com/dgakhptmh/image/upload/v1745967251/avatar9_siudxu.jpg",
    "https://res.cloudinary.com/dgakhptmh/image/upload/v1745967250/avatar10_pfnu7z.jpg",
  ];

  late String _selectedAvatar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _usernameFocusNode.addListener(() {
      if (!_usernameFocusNode.hasFocus) {
        _usernameFieldKey.currentState?.validate();
      }
    });

    setState(() {
      _selectedAvatar = avatarList[0];
    });

    FlutterNativeSplash.remove(); // Remove the splash screen after initialization
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your username";
    } else if (value.length < 3) {
      return "Username must be at least 3 characters long";
    } else if (value.length > 20) {
      return "Username must be less than 20 characters long";
    }
    return null;
  }

  void _handleAvatarSelection(String avatar) {
    setState(() {
      _selectedAvatar = avatar;
    });
  }

  _handleButtonPress() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserDto response = await UserApi.updateUser(
          UpdateUserDto(
            username: _usernameController.text,
            avatar: _selectedAvatar,
          ),
        );

        UserController.to.setUser(response);
      } catch (e) {
        print("Error in button press: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: 375.w,
              height: 812.h,
              child: Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 160.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 3.w),
                        ),
                        child: Icon(
                          Icons.description_outlined,
                          color: Colors.black,
                          size: 30.sp,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                        child: Text(
                          "Profile Information",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 30.h, bottom: 20.h),
                          width: 100.w,
                          height: 100.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: ClipOval(
                            child: Image.network(
                              _selectedAvatar,
                              fit: BoxFit.cover,
                              width: 90.w,
                              height: 90.w,
                            ),
                          ),
                        ),
                      ),

                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 12.5.w,
                        runSpacing: 12.5.h,
                        children: [
                          for (String avatar in avatarList)
                            GestureDetector(
                              onTap: () => _handleAvatarSelection(avatar),
                              child: Container(
                                width: 55.w,
                                height: 55.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        avatar == _selectedAvatar
                                            ? Colors.black
                                            : Colors.transparent,
                                    width: 2.w,
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    avatar,
                                    fit: BoxFit.cover,
                                    width: 53.w,
                                    height: 53.w,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: CustomInputField(
                          fieldKey: _usernameFieldKey,
                          focusNode: _usernameFocusNode,
                          controller: _usernameController,
                          hintText: "Please enter your username",
                          validator: _validateUsername,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 50.h,
              child: SizedBox(
                width: 375.w,
                child: Center(
                  child: SizedBox(
                    width: 290.w,
                    height: 60.h,
                    child: ElevatedButton(
                      onPressed: _handleButtonPress,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
