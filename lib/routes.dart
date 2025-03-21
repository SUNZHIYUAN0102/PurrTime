import 'package:purr_time/pages/authentication.dart';
import 'package:purr_time/pages/cat.dart';
import 'package:purr_time/pages/login.dart';
import 'package:purr_time/pages/navigations.dart';
import 'package:get/get.dart';
import 'package:purr_time/pages/recipeDetail.dart';
import 'package:purr_time/pages/registration.dart';

class AppPages {
  static final pages = [
    GetPage(name: "/", page: () => Navigations()),
    GetPage(name: "/authentication", page: () => Authentication()),
    GetPage(name: "/login", page: () => Login()),
    GetPage(name: "/registration", page: () => Registration()),
    GetPage(name: "/cat", page: () => Cat()),
    GetPage(name: "/recipe/detail", page: () => Recipedetail()),
  ];
}
