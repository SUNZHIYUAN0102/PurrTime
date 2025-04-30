import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purr_time/apis/cats.dart';
import 'package:purr_time/apis/user.dart';
import 'package:purr_time/pages/process/components/customInputField.dart';
import 'package:purr_time/store/token.dart';
import 'package:purr_time/store/user.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final _emailFieldKey = GlobalKey<FormFieldState>();

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final _passwordFieldKey = GlobalKey<FormFieldState>();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final _confirmPasswordFieldKey = GlobalKey<FormFieldState>();

  late bool _isRegistration;
  @override
  void initState() {
    super.initState();

    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        _emailFieldKey.currentState?.validate();
      }
    });

    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        _passwordFieldKey.currentState?.validate();
      }
    });

    _confirmPasswordFocusNode.addListener(() {
      if (!_confirmPasswordFocusNode.hasFocus) {
        _confirmPasswordFieldKey.currentState?.validate();
      }
    });

    if (Get.arguments["authMode"] == "register") {
      setState(() {
        _isRegistration = true;
      });
    } else {
      setState(() {
        _isRegistration = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordFocusNode.dispose();
    _emailFieldKey.currentState?.dispose();
    _passwordFieldKey.currentState?.dispose();
    _confirmPasswordFieldKey.currentState?.dispose();

    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    //complex password regex, includes at least one uppercase letter, one lowercase letter, one number, and one special character
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  _registerUser() async {
    try {
      AuthDto response = await UserApi.register(
        CreateUserDto(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );

      TokenController.to.setToken(response.token);
      Get.offAllNamed("/process/userInfo");
    } catch (e) {
      print(e);
    }
  }

  _loginUser() async {
    try {
      AuthDto response = await UserApi.login(
        CreateUserDto(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );

      TokenController.to.setToken(response.token);

      if (response.user.avatar != null && response.user.username != null) {
        UserController.to.setUser(response.user);
        List<CatDto> catList = await CatsApi.getUserCats();
        if (catList.isEmpty) {
          Get.offAllNamed(
            "/cat",
            arguments: {"catId": null, "fromProcess": true},
          );
        } else {
          Get.offAllNamed("/");
        }
      } else {
        Get.offAllNamed("/process/userInfo");
      }
    } catch (e) {
      Get.snackbar(
        "Login Error",
        "Invalid email or password",
        duration: const Duration(seconds: 2),
      );
    }
  }

  _handleButtonPress() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_isRegistration) {
        _registerUser();
      } else {
        _loginUser();
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
                          Icons.lock_outline,
                          color: Colors.black,
                          size: 30.sp,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                        child: Text(
                          _isRegistration ? "Registration" : "Sign in",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: CustomInputField(
                          fieldKey: _emailFieldKey,
                          focusNode: _emailFocusNode,
                          controller: _emailController,
                          hintText: "Please enter your email",
                          validator: _validateEmail,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: CustomInputField(
                          fieldKey: _passwordFieldKey,
                          focusNode: _passwordFocusNode,
                          controller: _passwordController,
                          hintText: "Please enter your password",
                          obscureText: true,
                          validator: _validatePassword,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),

                      if (_isRegistration)
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          child: CustomInputField(
                            fieldKey: _confirmPasswordFieldKey,
                            focusNode: _confirmPasswordFocusNode,
                            controller: _confirmPasswordController,
                            hintText: "Please confirm your password",
                            obscureText: true,
                            validator: _validateConfirmPassword,
                            keyboardType: TextInputType.visiblePassword,
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
                        _isRegistration ? "Register" : "Sign in",
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
