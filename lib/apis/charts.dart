import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';
import 'package:purr_time/utils/dioHelper.dart';

class ChartsApi {
  static Future<List<String>> getRecordMonth(String catId) async {
    try {
      final response = await DioHelper.get("/charts/month/$catId");
      final List<dynamic> data = response.data;

      return data.map((json) => json.toString()).toList();
    } catch (e) {
      print("Error in get reocrd month: $e");
      rethrow;
    }
  }

  static Future<List<WeightDto>> getCatMonthlyWeightRecords(
    String catId,
    String year,
    String month,
  ) async {
    try {
      final response = await DioHelper.get(
        "/charts/weight/$catId/$year/$month",
      );
      final List<dynamic> data = response.data;

      return data.map((json) => WeightDto.fromJson(json)).toList();
    } catch (e) {
      print("Error in get reocrd month: $e");
      rethrow;
    }
  }

  static Future<List<ExpenseDto>> getCatMonthlyExpenseRecords(
    String catId,
    String year,
    String month,
  ) async {
    try {
      final response = await DioHelper.get(
        "/charts/expense/$catId/$year/$month",
      );
      final List<dynamic> data = response.data;

      return data.map((json) => ExpenseDto.fromJson(json)).toList();
    } catch (e) {
      print("Error in get reocrd month: $e");
      rethrow;
    }
  }
}
