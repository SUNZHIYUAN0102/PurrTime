import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputFormField extends FormField<String> {
  CustomInputFormField({
    super.key,
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? hintText,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool enabled = true,
  }) : super(
         initialValue: controller.text,
         onSaved: onSaved,
         validator: validator,
         autovalidateMode: AutovalidateMode.onUserInteraction,
         builder: (state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 padding: EdgeInsets.symmetric(
                   horizontal: 20.w,
                   vertical: 10.h,
                 ),
                 width: double.infinity,
                 height: 65.h,
                 decoration: BoxDecoration(
                   color: Colors.grey[300],
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(
                     color: state.hasError ? Colors.red : Colors.transparent,
                   ),
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Text(
                       label,
                       style: TextStyle(
                         fontSize: 14.sp,
                         color: Colors.grey[600],
                       ),
                     ),
                     TextField(
                       enabled: enabled,
                       keyboardType: keyboardType,
                       decoration: InputDecoration(
                         hintText: hintText,
                         isDense: true,
                         contentPadding: EdgeInsets.symmetric(vertical: 0),
                         border: InputBorder.none,
                       ),
                       style: TextStyle(fontSize: 15.sp),
                       controller: controller,
                       onChanged: (newValue) {
                         state.didChange(newValue);
                       },
                     ),
                   ],
                 ),
               ),
               if (state.hasError)
                 Padding(
                   padding: EdgeInsets.only(top: 4.h, left: 8.w),
                   child: Text(
                     state.errorText!,
                     style: TextStyle(color: Colors.red, fontSize: 12.sp),
                   ),
                 ),
             ],
           );
         },
       );
}
