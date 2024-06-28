import 'package:flutter/material.dart';
import 'package:food_ui/food_ui.dart';

SnackBar customSnackBar({
  required String message,
  required BuildContext context,
  Duration? time,
  bool? isDismissAble,
}) {
  final appColor = context.colorScheme;
  return SnackBar(
    margin: const EdgeInsets.only(
      bottom: 10,
      left: 10,
      right: 10,
    ),
    dismissDirection: (isDismissAble ?? true) ? DismissDirection.vertical : DismissDirection.none,
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
    duration: time ?? const Duration(milliseconds: 2500),
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 20,
    ),
    backgroundColor: appColor.mainThemeColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
