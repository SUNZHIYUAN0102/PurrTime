import 'package:purr_time/dioHelper.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class UserApi {
  static Future<AuthDto> login(CreateUserDto userDto) async {
    try {
      final response = await DioHelper.post(
        "/auth/login",
        data: userDto.toJson(),
      );
      return AuthDto.fromJson(response.data);
    } catch (e) {
      print("Error in login: $e");
      rethrow;
    }
  }

  static Future<AuthDto> register(CreateUserDto userDto) async {
    try {
      final response = await DioHelper.post(
        "/auth/register",
        data: userDto.toJson(),
      );
      return AuthDto.fromJson(response.data);
    } catch (e) {
      print("Error in registration: $e");
      rethrow;
    }
  }
}
