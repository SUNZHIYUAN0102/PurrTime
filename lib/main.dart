import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purr_time/dioHelper.dart';
import 'package:purr_time/routes.dart';
import 'package:purr_time/store/cat.dart';
import 'package:purr_time/store/token.dart';
import 'package:purr_time/store/user.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
void main() async {
  Get.put(TokenController());
  Get.put(UserController());
  Get.put(CatController());

  // DioHelper.init(baseUrl: 'http://10.0.2.2:3000/');
  DioHelper.init(baseUrl: 'http://100.65.24.237:3000/');

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
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
          navigatorObservers: [routeObserver],
          getPages: AppPages.pages,
        );
      },
    );
  }
}
