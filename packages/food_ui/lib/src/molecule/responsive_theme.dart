// import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:food_ui/src/molecule/color_data.dart';
import 'package:food_ui/src/molecule/data.dart';
import 'package:food_ui/src/molecule/theme.dart';

enum AppThemeColorMode {
  light,
  dark,
}

/// Updates automatically the [AppTheme] regarding the current [MediaQuery],
/// as soon as the Theme isn't overriden.
class AppResponsiveTheme extends StatelessWidget {
  const AppResponsiveTheme({
    required this.child,
    super.key,
    this.colorMode,
  });

  final AppThemeColorMode? colorMode;
  final Widget child;

  static AppThemeColorMode colorModeOf(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    // final useDarkTheme = platformBrightness == ui.Brightness.dark;
    // if (useDarkTheme) {
    //   return AppThemeColorMode.dark;
    // }
    return AppThemeColorMode.light;
  }

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeData.regular();

    /// Updating the colors for the current brightness
    final colorMode = this.colorMode ?? colorModeOf(context);
    switch (colorMode) {
      case AppThemeColorMode.dark:
        theme = theme.withColors(AppColorsData.light());
      case AppThemeColorMode.light:
        theme = theme.withColors(AppColorsData.light());
    }

    return AppTheme(
      data: theme,
      child: child,
    );
  }
}
