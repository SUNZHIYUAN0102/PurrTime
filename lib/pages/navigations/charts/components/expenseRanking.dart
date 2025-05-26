import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:purr_time/pages/records/record.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class ExpenseRanking extends StatelessWidget {
  final List<ExpenseDto> expenseRecords;

  const ExpenseRanking({super.key, required this.expenseRecords});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Expense Ranking",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        _renderExpenseContent(),
      ],
    );
  }

  Widget _renderExpenseContent() {
    if (expenseRecords.isNotEmpty) {
      return Column(
        children:
            expenseRecords.map((item) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                  border: Border(
                    // last item color is transparent
                    bottom: BorderSide(
                      color:
                          (item == expenseRecords.last &&
                                  expenseRecords.length > 1)
                              ? Colors.transparent
                              : Colors.grey[300]!,
                      width: 1.w,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10.w),
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: Icon(
                        getRecordIcon(item.name),
                        color: Colors.grey[800],
                        size: 20.sp,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 8.w,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  Text(
                                    "${(item.percentage * 100).toInt()}%",
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                ],
                              ),
                              Text(
                                "€${item.total.toInt()}",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              lineHeight: 8.h,
                              percent: item.percentage,
                              progressColor: Colors.amber[400],
                              barRadius: Radius.circular(10.sp),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      );
    } else {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/empty.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "No records found",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ],
        ),
      );
    }
  }
}
