import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TokenController extends GetxController {
  final box = GetStorage();
  static TokenController get to => Get.find();
  var token = Rxn<String>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    token.value = box.read("token");

    ever(token, (_) {
      box.write('token', token.value);
    });
  }

  void setToken(String newToken) {
    token.value = newToken;
  }

  void clearToken() {
    token.value = null;
  }
}
