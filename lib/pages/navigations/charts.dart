import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:purr_time/components/customDateTimeFormField.dart';
import 'package:purr_time/components/customDropdown.dart';
import 'package:purr_time/components/customInputFormField.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 50.h, horizontal: 16.w),
            child: CustomDropdown(label: "Gender", options: ["Male", "Female"]),
          ),
        ],
      ),
    );
  }
}
