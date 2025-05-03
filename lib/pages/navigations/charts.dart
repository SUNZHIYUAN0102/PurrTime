import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String errorText = "Please enter a value";

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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                width: double.infinity,
                height: 65.h,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 226, 224),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Cat",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            errorText = "Please enter a value";
                          });
                        }
                        return null;
                      },
                      controller: TextEditingController.fromValue(
                        TextEditingValue(
                          text: "",
                          selection: TextSelection.collapsed(offset: "".length),
                        ),
                      ),
                    ),
                  ],
                ),
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
