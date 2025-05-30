import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnack({
  required String title,
  required String message,
  Color bgColor = const Color(0xFFE57373),
  IconData icon = Icons.error_outline,
  Color iconColor = Colors.white,
  Color textColor = Colors.white,
}) {

  Get.snackbar(
    title,
    message,
    backgroundColor: bgColor,
    colorText: textColor,
    icon: Icon(icon, color: iconColor),
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 10,
    margin: EdgeInsets.all(10),
    duration: Duration(seconds: 3),
    boxShadows: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        spreadRadius: 1,
        offset: Offset(0, 3),
      )
    ],
  );
}
