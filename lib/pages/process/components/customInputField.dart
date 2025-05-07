import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatelessWidget {
  final GlobalKey<FormFieldState>? fieldKey;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool? obscureText;
  final int errorMaxLines;
  final int? maxlength;
  final AutovalidateMode? autovalidateMode;

  const CustomInputField({
    super.key,
    this.fieldKey,
    required this.controller,
    this.focusNode,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.errorMaxLines = 3,
    this.maxlength,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        errorStyle: TextStyle(fontSize: 12.sp, height: 2),
        errorMaxLines: errorMaxLines,
      ),
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      keyboardType: keyboardType,
      validator: validator,
      maxLength: maxlength,
      autovalidateMode: autovalidateMode,
    );
  }
}
