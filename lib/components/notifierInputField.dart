import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotifierInputField extends StatelessWidget {
  final String label;
  final ValueNotifier<String> notifier;
  final TextInputType keyboardType;
  final String? hintText;

  const NotifierInputField({
    super.key,
    required this.label,
    required this.notifier,
    this.keyboardType = TextInputType.text,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      width: double.infinity,
      height: 65.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
          ),
          ValueListenableBuilder<String>(
            valueListenable: notifier,
            builder: (context, value, _) {
              return TextField(
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  hintText: hintText,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  border: InputBorder.none,
                ),
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: value,
                    selection: TextSelection.collapsed(offset: value.length),
                  ),
                ),
                onChanged: (newValue) {
                  notifier.value = newValue;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
