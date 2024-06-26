import 'package:flutter/material.dart' show Brightness;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ui/food_ui.dart';

class ThemeBloc extends Cubit<AppThemeColorMode> {
  ThemeBloc() : super(AppThemeColorMode.dark);

  void switchTheme(Brightness brightness) {
    emit(brightness == Brightness.dark ? AppThemeColorMode.light : AppThemeColorMode.dark);
  }
}
