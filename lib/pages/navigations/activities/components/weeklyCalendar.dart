import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WeeklyCalendar extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  const WeeklyCalendar({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  late DateTime _initialWeekStart;
  DateTime? _selectedDate;
  late PageController _pageController;
  final int _initialPage = 2;

  @override
  void initState() {
    super.initState();
    _initialWeekStart = _getWeekStart(widget.initialDate);
    _selectedDate = widget.initialDate;
    _pageController = PageController(initialPage: _initialPage);
  }

  DateTime _getWeekStart(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  List<DateTime> _getWeekDates(DateTime start) {
    return List.generate(7, (i) => start.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 75.h,
          child: PageView.builder(
            itemCount: 3,
            controller: _pageController,
            itemBuilder: (context, index) {
              final offset = index - _initialPage;
              final weekStart = _initialWeekStart.add(
                Duration(days: offset * 7),
              );
              final weekDates = _getWeekDates(weekStart);

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    weekDates.map((date) {
                      final isMarked = _selectedDate == date;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate = date;
                          });
                          widget.onDateSelected(date);
                        },
                        child: Container(
                          width: 45.w,
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('E').format(date),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${date.day}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 5.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                  color:
                                      isMarked
                                          ? Colors.blue
                                          : Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
