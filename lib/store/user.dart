import 'package:get/get.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  final user = Rxn<UserDto>();

  void setUser(UserDto newUser) {
    user.value = newUser;
  }

  void clearUser() {
    user.value = null;
  }
}
