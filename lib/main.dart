import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:purr_time/apis/cats.dart';
import 'package:purr_time/apis/user.dart';
import 'package:purr_time/utils/dioHelper.dart';
import 'package:purr_time/routes.dart';
import 'package:purr_time/store/cat.dart';
import 'package:purr_time/store/token.dart';
import 'package:purr_time/store/user.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

void main() async {
  await GetStorage.init();
  Get.put(TokenController());
  Get.put(UserController());
  Get.put(CatController());

  // DioHelper.init(baseUrl: 'http://10.0.2.2:3000/');
  DioHelper.init(baseUrl: 'http://100.65.24.237:3000/');

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final initialRoute = await configInitialRoute();
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute,
          navigatorObservers: [routeObserver],
          getPages: AppPages.pages,
        );
      },
    );
  }
}

Future<String> configInitialRoute() async {
  final box = GetStorage();
  final token = box.read('token');

  if (token == null || JwtDecoder.isExpired(token)) {
    TokenController.to.clearToken();
    return "/welcome";
  }

  final user = await UserApi.getUser();
  if (user.username == null || user.avatar == null) {
    return "/process/userInfo";
  }

  UserController.to.setUser(user);

  final catList = await CatsApi.getUserCats();
  if (catList.isEmpty) {
    return "/cat";
  }

  CatController.to.setCatList(catList);
  CatController.to.setHomeSelectedCat(catList[0]);
  CatController.to.setChartSelectedCat(catList[0]);
  CatController.to.setProfileSelectedCat(catList[0]);

  return "/";
}
