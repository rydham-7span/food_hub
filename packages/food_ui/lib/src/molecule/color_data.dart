import 'package:flutter/widgets.dart';
import 'package:food_ui/food_ui.dart';
import 'package:food_ui/src/atoms/atoms.dart';
import 'package:food_ui/src/atoms/colors.dart';

class AppColorsData {
  const AppColorsData({
    required this.mainThemeColor,
    required this.blackColor,
    required this.tertiaryColor,
    required this.outlineColor,
    required this.m3BlackColor,
    required this.redSecondaryContainer,
    required this.m3RedColor,
    required this.searchBackgroundColor,
    required this.greenColor,
    required this.neutral500Color,
    required this.m3GreyColor,
    required this.surfaceTintColor,
    required this.schemesOutlineColor,
    required this.labelLightSecondaryColor,
    required this.backgroundLightSecondaryColor,
    required this.redLightSecondaryColor,
    required this.m3LightSecondaryColor,
    required this.successGreenColor,
    required this.backgroundColor,
    required this.m3LightColor,
    required this.m3LightOnSurface,
    required this.m3White,
    required this.m3Grey,
    required this.m3SvgColor,
    required this.lineChartColor,
    required this.backgroundSecondaryLight,
    required this.m3Grey100,
    required this.m3LightPrimaryFixed,
    required this.actionBlue,
    required this.warningText,
    required this.offlineBorderColor,
    required this.offlineBannerColor,
    required this.primaryBlackColor,
    required this.warningRedBanner,
    required this.backgroundGreenColor,
    required this.backgroundRedColor,
    required this.textGreenColor,
    required this.textRedColor,
    required this.backgroundWarningColor,
    required this.yellowTextColor,
    required this.invalidBottomSheetColor,
  });

  factory AppColorsData.light() => const AppColorsData(
        mainThemeColor: AppColors.mainThemeColor,
        backgroundColor: AppColors.backgroundColorBright,
        blackColor: AppColors.blackColorBright,
        tertiaryColor: AppColors.tertiaryColorBright,
        outlineColor: AppColors.outlineColorBright,
        m3BlackColor: AppColors.m3BlackColorBright,
        redSecondaryContainer: AppColors.redSecondaryContainerBright,
        m3RedColor: AppColors.m3RedColorBright,
        searchBackgroundColor: AppColors.searchBackgroundColorBright,
        greenColor: AppColors.greenColorBright,
        neutral500Color: AppColors.neutral500ColorBright,
        m3GreyColor: AppColors.m3GreyColorBright,
        surfaceTintColor: AppColors.surfaceTintColorBright,
        schemesOutlineColor: AppColors.schemesOutlineColorBright,
        labelLightSecondaryColor: AppColors.labelLightSecondaryColorBright,
        backgroundLightSecondaryColor: AppColors.backgroundLightSecondaryColorBright,
        redLightSecondaryColor: AppColors.redLightSecondaryColorBright,
        m3LightSecondaryColor: AppColors.m3LightSecondaryColorBright,
        successGreenColor: AppColors.successGreenColorBright,
        m3LightColor: AppColors.m3LightColorBright,
        m3LightOnSurface: AppColors.m3LightOnSurface,
        m3White: AppColors.m3White,
        m3Grey: AppColors.m3Grey,
        lineChartColor: AppColors.lineChartColorBright,
        backgroundSecondaryLight: AppColors.backgroundSecondaryBright,
        m3SvgColor: AppColors.m3SvgColorBright,
        m3Grey100: AppColors.m3Grey100,
        m3LightPrimaryFixed: AppColors.m3LightPrimaryFixed,
        actionBlue: AppColors.actionBlue,
        warningText: AppColors.warningTextColor,
        offlineBorderColor: AppColors.offlineBorder,
        offlineBannerColor: AppColors.offlineBannerColor,
        primaryBlackColor: AppColors.primaryBlackColor,
        warningRedBanner: AppColors.warningRedColor,
        backgroundGreenColor: AppColors.backgroundGreenColor,
        backgroundRedColor: AppColors.backgroundRedColor,
        textRedColor: AppColors.redTextColor,
        textGreenColor: AppColors.greenTextColor,
        backgroundWarningColor: AppColors.backgroundWarningColor,
        yellowTextColor: AppColors.yellowTextColor,
        invalidBottomSheetColor: AppColors.invalidBottomSheetColor,
      );

  final Color mainThemeColor;
  final Color backgroundColor;
  final Color blackColor;
  final Color m3White;
  final Color tertiaryColor;
  final Color outlineColor;
  final Color m3BlackColor;
  final Color redSecondaryContainer;
  final Color m3RedColor;
  final Color searchBackgroundColor;
  final Color greenColor;
  final Color neutral500Color;
  final Color m3GreyColor;
  final Color surfaceTintColor;
  final Color schemesOutlineColor;
  final Color labelLightSecondaryColor;
  final Color backgroundLightSecondaryColor;
  final Color redLightSecondaryColor;
  final Color m3LightSecondaryColor;
  final Color successGreenColor;
  final Color m3LightColor;
  final Color lineChartColor;
  final Color backgroundSecondaryLight;
  final Color m3LightOnSurface;
  final Color m3Grey;
  final Color m3SvgColor;
  final Color m3Grey100;
  final Color m3LightPrimaryFixed;
  final Color actionBlue;
  final Color warningText;
  final Color offlineBorderColor;
  final Color offlineBannerColor;
  final Color primaryBlackColor;
  final Color warningRedBanner;
  final Color backgroundGreenColor;
  final Color textGreenColor;
  final Color backgroundRedColor;
  final Color textRedColor;
  final Color backgroundWarningColor;
  final Color yellowTextColor;
  final Color invalidBottomSheetColor;
}
