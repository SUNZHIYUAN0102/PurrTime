import 'package:purr_time/pages/cat.dart';
import 'package:purr_time/pages/navigations.dart';
import 'package:get/get.dart';
import 'package:purr_time/pages/process/auth.dart';
import 'package:purr_time/pages/recipeDetail.dart';
import 'package:purr_time/pages/records/recordManagement.dart';
import 'package:purr_time/pages/records/record.dart';
import 'package:purr_time/pages/welcome.dart';

class AppPages {
  static final pages = [
    GetPage(name: "/", page: () => Navigations()),
    GetPage(name: "/welcome", page: () => Welcome()),
    GetPage(name: "/auth", page: () => Auth()),
    GetPage(name: "/cat", page: () => Cat()),
    GetPage(name: "/recipe/detail", page: () => Recipedetail()),
    GetPage(name: "/record", page: () => Record()),
    GetPage(name: "/recordManagement", page: () => RecordManagement()),
  ];
}
