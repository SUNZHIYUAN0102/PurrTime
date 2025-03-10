import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, // 开始位置
            end: Alignment.bottomCenter, // 结束位置
            colors: [
              Color(0xFFFFA751), // 渐变开始颜色
              Color(0xFFFFE259), // 渐变结束颜色
            ],
          ),
        ),
      ),
    );
  }
}
