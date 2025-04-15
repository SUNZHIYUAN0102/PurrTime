import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class NotiferDateTimeInputField extends StatelessWidget {
  final String label;
  final ValueNotifier<String> notifier;

  const NotiferDateTimeInputField({
    super.key,
    required this.label,
    required this.notifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: notifier,
      builder: (context, value, child) {
        return InkWell(
          onTap: () async {
            if (value.isEmpty) {
              notifier.value = DateFormat(
                "yyyy-MM-dd HH:mm",
              ).format(DateTime.now());
            }

            await showBoardDateTimePicker(
              context: context,
              initialDate: DateFormat("yyyy-MM-dd HH:mm").parse(notifier.value),
              pickerType: DateTimePickerType.datetime,
              onChanged: (p0) {
                notifier.value = DateFormat("yyyy-MM-dd HH:mm").format(p0);
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
            padding: EdgeInsets.only(
              top: 10.h,
              bottom: 10.h,
              left: 20.w,
              right: 20.w,
            ),
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
                Text(value, style: TextStyle(fontSize: 18.sp)),
              ],
            ),
          ),
        );
      },
    );
  }
}
