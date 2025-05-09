import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:purr_time/components/customDateTimeFormField.dart';
import 'package:purr_time/components/customInputFormField.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController(
    text: "2026-01-01 00:00",
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String? validateDateTime(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a date and time";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.all(50),
              child: CustomDateTimeInputFormField(
                label: "Date & Time",
                controller: controller,
                validator: validateDateTime,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _formKey.currentState?.validate();
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
