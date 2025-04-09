import 'package:purr_time/dioHelper.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class CatsApi {
  static Future<List<CatDto>> getUserCats() async {
    try {
      final response = await DioHelper.get("/cats");
      final List<dynamic> data = response.data;

      return data.map((json) => CatDto.fromJson(json)).toList();
    } catch (e) {
      print("Error in getUserCats: $e");
      rethrow;
    }
  }
}
