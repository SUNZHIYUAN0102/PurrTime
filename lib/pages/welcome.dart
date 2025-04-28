import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoPlayerController = VideoPlayerController.asset("videos/welcome.mp4")
      ..initialize().then((_) {
        _videoPlayerController.setLooping(true);
        _videoPlayerController.play();
        setState(() {});

        FlutterNativeSplash.remove(); // remove the splash screen
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _videoPlayerController.dispose();
  }

  _toAuthPage() {
    Get.toNamed("/auth");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _videoPlayerController.value.size.width,
                height: _videoPlayerController.value.size.height,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          ),
          Positioned(
            top: 140.h,
            child: SizedBox(
              width: 375.w,
              child: Column(
                spacing: 15.h,
                children: [
                  Text(
                    "Purr Time",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "A cat's life is a happy life",
                    style: TextStyle(color: Colors.white, fontSize: 22.sp),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 45.h,
            child: SizedBox(
              width: 375.w,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 42.5.w),
                    margin: EdgeInsets.only(bottom: 15.h),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            "By tapping 'Sign in' / 'Create account', you agree to our ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: "Terms of Service.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: " Learn how we process your data in our ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ),
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: " and ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ),
                          ),
                          TextSpan(
                            text: "Cookie Policy.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.h),
                    width: 290.w,
                    height: 60.h,
                    child: ElevatedButton(
                      onPressed: _toAuthPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        "Create account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
