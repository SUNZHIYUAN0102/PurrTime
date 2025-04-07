import 'package:get/get.dart';

class TokenController extends GetxController {
  static TokenController get to => Get.find();
  var token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkOTU3ZDk5NS00ZThhLTRlOGItYmU2NC03MDYwZmJkNjM0NzAiLCJpYXQiOjE3NDQwMjE2NDEsImV4cCI6MTc0NjYxMzY0MX0.erWulHKNytjHsLQU1m5bbP8YEd6YXgtki8Vjdr8gc-o"
          .obs;
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
