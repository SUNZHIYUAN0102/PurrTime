import 'package:purr_time/dioHelper.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class RecordsApi {
  static Future<List<RecordDto>> findRecordsByCatIdAndDate(
    String catId, {
    String? date,
  }) async {
    try {
      final response = await DioHelper.get(
        "/records/all/$catId",
        queryParameters: {"date": date},
      );

      final List<dynamic> data = response.data;
      return data.map((json) => RecordDto.fromJson(json)).toList();
    } catch (e) {
      print("Error in findRecordsByCatIdAndDate: $e");
      rethrow;
    }
  }
}
