import 'package:flutter/widgets.dart';
import 'package:food_ui/src/molecule/app_utils.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textDecoration,
    this.overflow,
    this.textAlign = TextAlign.start,
    this.fontFamily = AppUtils.sofiaSansFont,
  });

  /// FontWeight = 400
  const AppText.regular(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines = 2,
    this.textDecoration,
    this.fontWeight = FontWeight.w400,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.fontFamily = AppUtils.sofiaSansFont,
  });

  /// FontWeight = 500
  const AppText.medium(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines = 2,
    this.textDecoration,
    this.fontWeight = FontWeight.w500,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.fontFamily = AppUtils.sofiaSansFont,
  });

  /// FontWeight = 700
  const AppText.bold(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.textDecoration,
    this.maxLines = 2,
    this.fontWeight = FontWeight.w700,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.fontFamily = AppUtils.sofiaSansFont,
  });

  final String data;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        height: 1.2,
        fontWeight: fontWeight,
        decoration: textDecoration,
        decorationColor: color,
        overflow: overflow,
        fontFamily: fontFamily,
        package: 'food_ui',
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
