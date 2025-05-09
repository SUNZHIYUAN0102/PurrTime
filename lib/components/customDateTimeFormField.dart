import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomDateTimeInputFormField extends FormField<String> {
  CustomDateTimeInputFormField({
    super.key,
    required String label,
    required TextEditingController controller,
    String formatRule = "yyyy-MM-dd HH:mm",
    DateTimePickerType pickerType = DateTimePickerType.datetime,
    DateTime? maximumDate,
    String? hintText,
    FormFieldValidator<String>? validator,
    FormFieldSetter<String>? onSaved,
  }) : super(
         autovalidateMode: AutovalidateMode.onUserInteraction,
         initialValue: controller.text,
         onSaved: onSaved,
         validator: validator,
         builder: (state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               GestureDetector(
                 onTap: () async {
                   if (controller.text.isEmpty) {
                     controller.text = DateFormat(
                       formatRule,
                     ).format(DateTime.now());
                     state.didChange(controller.text);
                   }

                   await showBoardDateTimePicker(
                     context: state.context,
                     initialDate: DateFormat(formatRule).parse(controller.text),
                     pickerType: pickerType,
                     maximumDate: maximumDate,
                     onChanged: (p0) {
                       controller.text = DateFormat(formatRule).format(p0);
                       state.didChange(controller.text);
                     },
                     customCloseButtonBuilder: (context, isModal, onClose) {
                       return IconButton(
                         icon: Icon(Icons.close),
                         onPressed: () {
                           if (isModal) {
                             Navigator.pop(context);
                           }
                         },
                       );
                     },
                   );
                 },
                 child: Container(
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
                       AbsorbPointer(
                         child: TextField(
                           readOnly: true,
                           decoration: InputDecoration(
                             hintText: hintText,
                             isDense: true,
                             contentPadding: EdgeInsets.symmetric(vertical: 0),
                             border: InputBorder.none,
                           ),
                           style: TextStyle(fontSize: 15.sp),
                           controller: controller,
                         ),
                       ),
                     ],
                   ),
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
