import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purr_time/dioHelper.dart';
import 'package:purr_time/routes.dart';
import 'package:purr_time/store/token.dart';

void main() {
  Get.put(TokenController());

  DioHelper.init(baseUrl: 'http://10.0.2.2:3000/');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          getPages: AppPages.pages,
        );
      },
    );
  }
}
