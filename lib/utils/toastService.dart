import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static void show({
    required String message,
    ToastGravity gravity = ToastGravity.CENTER,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    double fontSize = 18,
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  // 快捷方法：成功提示
  static void success(String message) {
    show(message: message, backgroundColor: Colors.green[600]!);
  }

  // 快捷方法：错误提示
  static void error(String message) {
    show(message: message, backgroundColor: Colors.redAccent);
  }

  // 快捷方法：警告/信息提示
  static void info(String message) {
    show(message: message, backgroundColor: Colors.orange[800]!);
  }
}
