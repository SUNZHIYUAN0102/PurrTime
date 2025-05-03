import 'package:purr_time/utils/dioHelper.dart';
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

      final converted =
          data.map((record) {
            if (record is Map<String, dynamic> && record["date"] is String) {
              final utc = DateTime.parse(record["date"]);
              final local = utc.toLocal();
              record["date"] = local.toIso8601String();
            }
            return record;
          }).toList();

      return converted.map((record) => RecordDto.fromJson(record)).toList();
    } catch (e) {
      print("Error in findRecordsByCatIdAndDate: $e");
      rethrow;
    }
  }

  static Future<RecordDto> createRecord(
    String catId,
    CreateRecordDto recordDto,
  ) async {
    try {
      final response = await DioHelper.post(
        "/records/$catId",
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
