import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBarFunction({
  required String title,
  required String subtitle,
  Duration? animationDuration,
  SnackPosition? snackPosition,
  double? borderRadius,
  Color? backgroundColor,
  SnackStyle? snackStyle,
  Duration? duration,
  Curve? reverseAnimationCurve,
  DismissDirection? dismissDirection,
}) {
  Get.snackbar(title, subtitle,
      animationDuration: animationDuration,
      isDismissible: true,
      snackPosition: snackPosition,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      snackStyle: snackStyle,
      duration: duration,
      reverseAnimationCurve: reverseAnimationCurve,
      dismissDirection: dismissDirection);
}
