import 'package:purr_time/utils/dioHelper.dart';
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

  static Future<CatDto> getCatById(String catId) async {
    try {
      final response = await DioHelper.get("/cats/$catId");
      return CatDto.fromJson(response.data);
    } catch (e) {
      print("Error in getCatById: $e");
      rethrow;
    }
  }

  static Future<CatDto> createCat(CreateCatDto catDto) async {
    try {
      final response = await DioHelper.post("/cats", data: catDto.toJson());
      return CatDto.fromJson(response.data);
    } catch (e) {
      print("Error in createCat: $e");
      rethrow;
    }
  }

  static Future<CatDto> updateCat(String catId, UpdateCatDto catDto) async {
    try {
      final response = await DioHelper.patch(
        "/cats/$catId",
        data: catDto.toJson(),
      );
      return CatDto.fromJson(response.data);
    } catch (e) {
      print("Error in updateCat: $e");
      rethrow;
    }
  }
}
