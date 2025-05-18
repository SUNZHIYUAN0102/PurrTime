import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class WeightChart extends StatelessWidget {
  final List<WeightDto> weightRecords;
  const WeightChart({super.key, required this.weightRecords});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Weight",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: double.infinity,
          height: 150.h,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                enabled: true,
                touchSpotThreshold: 100,
                getTouchedSpotIndicator: (barData, spotIndexes) {
                  return spotIndexes.map((index) {
                    return TouchedSpotIndicatorData(
                      FlLine(color: Colors.black, strokeWidth: 1.w),
                      FlDotData(
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 2.5.w,
                            color: Colors.black,
                            strokeWidth: .1.w,
                            strokeColor: Colors.black,
                          );
                        },
                      ),
                    );
                  }).toList();
                },
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) {
                    return Colors.black;
                  },
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((LineBarSpot spot) {
                      final value = spot.y.toInt();
                      final date = spot.x.toInt().toString().padLeft(2, '0');
                      return LineTooltipItem(
                        "Day $date\n$value kg",
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
              // 网格线
              gridData: FlGridData(drawVerticalLine: false),
              // 显示刻度
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final day = value.toInt();

                      int lastDay =
                          double.parse(
                            weightRecords[weightRecords.length - 1].date,
                          ).toInt();

                      if ([1, 5, 10, 15, 20, 25].contains(day) ||
                          day == lastDay) {
                        return Text(day.toString());
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
              // 边框
              borderData: FlBorderData(
                show: true,
                border: Border(
                  top: BorderSide(color: Colors.grey[300]!, width: 1.w),
                  bottom: BorderSide(color: Colors.grey[300]!, width: .5.w),
                  left: BorderSide.none,
                  right: BorderSide.none,
                ),
              ),

              lineBarsData: [
                LineChartBarData(
                  color: Colors.black,
                  barWidth: .5.w,
                  // isCurved: true,
                  spots:
                      weightRecords
                          .map((e) => FlSpot(double.parse(e.date), e.$value))
                          .toList(),
                  dotData: FlDotData(
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 2.5.w,
                        color: spot.y > 0 ? Colors.black : Colors.transparent,
                        strokeWidth: .1.w,
                        strokeColor: Colors.black,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
