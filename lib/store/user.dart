import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  var user =
      {
        "username": "littleyuanyuan",
        "email": "",
        "avatar": "https://picsum.photos/id/237/300/300",
      }.obs;

  void setUser(Map<String, String> newUser) {
    user.value = newUser;
  }

  void clearUser() {
    user.value = {};
  }
}
