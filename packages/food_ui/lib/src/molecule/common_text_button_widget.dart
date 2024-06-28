import 'package:flutter/material.dart';
import 'package:food_ui/food_ui.dart';

class CommonTextButtonWidget extends StatelessWidget {
  const CommonTextButtonWidget({
    required this.onPressed,
    required this.text,
    this.backGroundColor,
    this.foreGroundColor,
    this.isUnderline = false,
    this.isTapTargetSize = false,
    super.key,
    this.isLoading,
    this.btnColor,
    this.height,
    this.width,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool? isLoading;
  final Color? foreGroundColor;
  final Color? backGroundColor;
  final bool isUnderline;
  final bool isTapTargetSize;
  final Color? btnColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final appColor = context.colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: btnColor ?? appColor.mainThemeColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        minimumSize: Size(width ?? 250, height ?? 48),
      ),
      onPressed: onPressed,
      child: (isLoading ?? false)
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : AppText.medium(
              text,
              fontSize: 15,
              color: Colors.white,
              fontWeight: AppFontWeight.bold,
              textDecoration: isUnderline ? TextDecoration.underline : null,
            ),
    );
  }
}
