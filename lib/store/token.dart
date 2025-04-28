import 'package:get/get.dart';

class TokenController extends GetxController {
  static TokenController get to => Get.find();
  var token = "".obs;
  var isLogin = false.obs;

  void setToken(String newToken) {
    token.value = newToken;
    isLogin.value = true;
  }

  void clearToken() {
    token.value = "";
    isLogin.value = false;
  }
}
