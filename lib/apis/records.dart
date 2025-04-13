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

  static Future<RecordDto> createRecord(CreateRecordDto recordDto) async {
    try {
      final response = await DioHelper.post(
        "/records/",
        data: recordDto.toJson(),
      );
      return RecordDto.fromJson(response.data);
    } catch (e) {
      print("Error in createRecord: $e");
      rethrow;
    }
  }

  static Future<RecordDto> updateRecord(
    String recordId,
    UpdateRecordDto recordDto,
  ) async {
    try {
      final response = await DioHelper.patch(
        "/records/$recordId",
        data: recordDto.toJson(),
      );
      return RecordDto.fromJson(response.data);
    } catch (e) {
      print("Error in updateRecord: $e");
      rethrow;
    }
  }

  static Future<void> deleteRecord(String recordId) async {
    try {
      await DioHelper.delete("/records/$recordId");
    } catch (e) {
      print("Error in deleteRecord: $e");
      rethrow;
    }
  }
}
