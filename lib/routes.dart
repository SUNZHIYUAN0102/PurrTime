import 'package:purr_time/pages/home.dart';
import 'package:purr_time/pages/navigations.dart';
import 'package:purr_time/pages/profile.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: "/", page: () => Navigations()),
    GetPage(name: "/home", page: () => Home()),
    GetPage(name: "/profile", page: () => Profile()),
  ];
}
