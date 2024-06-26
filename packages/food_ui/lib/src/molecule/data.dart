import 'package:equatable/equatable.dart';
import 'package:food_ui/src/molecule/color_data.dart';
import 'package:food_ui/src/molecule/typography.dart';

class AppThemeData extends Equatable {
  const AppThemeData({
    required this.colors,
    // required this.icons,
    required this.typography,
  });

  factory AppThemeData.regular() => AppThemeData(
        colors: AppColorsData.light(),
        // icons: AppIconsData.regular(),
        typography: AppTypographyData.regular(),
      );
  final AppColorsData colors;
  // final AppIconsData icons;
  final AppTypographyData typography;

  AppThemeData withColors(AppColorsData colors) {
    return AppThemeData(
      colors: colors,
      typography: typography,
    );
  }

  @override
  List<Object?> get props => [
        colors,
        typography,
        // icons,
      ];
}
